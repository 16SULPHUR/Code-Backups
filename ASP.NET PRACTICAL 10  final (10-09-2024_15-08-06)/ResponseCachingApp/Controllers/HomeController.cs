using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using ResponseCachingApp.Models;

using Microsoft.Extensions.Caching.Memory;

namespace ResponseCachingApp.Controllers;

public class HomeController(IMemoryCache memoryCache) : Controller
{
    private readonly IMemoryCache _memoryCache = memoryCache;
    private const string NumberKey = "GeneratedNumber";
    private const string AttemptsKey = "NumberOfAttempts";

    [HttpGet]
    public IActionResult Index()
    {
        // Initialize game if not already started
        if (!_memoryCache.TryGetValue(NumberKey, out int _))
        {
            ResetGame();
        }

        return View();
    }

    [HttpPost]
    [ResponseCache(Duration = 30, VaryByQueryKeys = new[] { "guess" })]
    public IActionResult Guess(int guess)
    {
        // Retrieve the generated number from cache
        var generatedNumber = _memoryCache.Get<int>(NumberKey);
        var attempts = _memoryCache.Get<int>(AttemptsKey);

        string resultMessage;
        int difference = Math.Abs(generatedNumber - guess); // Calculate the difference

        if (guess == generatedNumber)
        {
            resultMessage = $"Congratulations! You guessed the number {generatedNumber} correctly in {attempts} attempts!";
            ResetGame(); // Reset game on correct guess
        }
        else
        {
            attempts++;
            _memoryCache.Set(AttemptsKey, attempts);

            // Provide nuanced feedback based on the difference
            if (difference > 20)
            {
                resultMessage = guess < generatedNumber ? "Low! Try a much higher number." : "Too High! Try a much lower number.";
            }
            else if (difference > 10)
            {
                resultMessage = guess < generatedNumber ? "Too Low! A bit higher might do." : "Higher! You're close, but a bit lower.";
            }
            else
            {
                resultMessage = guess < generatedNumber ? "Almost there, but still too low!" : "Close! But a bit too high!";
            }
        }

        return Json(new { message = resultMessage });
    }

    private void ResetGame()
    {
        // Generate a random number between 1 and 100
        var random = new Random();
        var numberToGuess = random.Next(1, 101);
        _memoryCache.Set(NumberKey, numberToGuess, TimeSpan.FromMinutes(10)); // Cache number for 10 minutes
        _memoryCache.Set(AttemptsKey, 0); // Reset attempts
    }
}