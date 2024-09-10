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
    [ResponseCache(Duration = 30, VaryByQueryKeys = new[] { "guess" })] // Cache the response based on "guess" for 30 seconds
    public IActionResult Guess(int guess)
    {
        // Retrieve the generated number from cache
        var generatedNumber = _memoryCache.Get<int>(NumberKey);
        var attempts = _memoryCache.Get<int>(AttemptsKey);

        string resultMessage;
        if (guess == generatedNumber)
        {
            resultMessage = $"Congratulations! You guessed the number {generatedNumber} correctly in {attempts} attempts!";
            ResetGame(); // Reset game on correct guess
        }
        else
        {
            attempts++;
            _memoryCache.Set(AttemptsKey, attempts);

            if (guess < generatedNumber)
            {
                resultMessage = $"Too low! You've attempted {attempts} times.";
            }
            else
            {
                resultMessage = $"Too high! You've attempted {attempts} times.";
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