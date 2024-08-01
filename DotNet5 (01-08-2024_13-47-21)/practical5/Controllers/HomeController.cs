using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using practical5.Models;

namespace practical5.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

        public IActionResult Index()
        {
            var birds = new List<Bird>
            {
                new Bird { Name = "Sparrow", Color = "Brown", Habitat = "Urban areas" },
                new Bird { Name = "Eagle", Color = "Dark brown", Habitat = "Mountains" },
                new Bird { Name = "Parrot", Color = "Green", Habitat = "Tropical forests" },
                new Bird { Name = "Penguin", Color = "Black and white", Habitat = "Antarctica" },
                new Bird { Name = "Hawk", Color = "Brown", Habitat = "Woodlands" },
                new Bird { Name = "Owl", Color = "Gray", Habitat = "Forests" },
                new Bird { Name = "Flamingo", Color = "Pink", Habitat = "Swamps" },
                new Bird { Name = "Peacock", Color = "Blue and green", Habitat = "Forests" },
                new Bird { Name = "Swallow", Color = "Blue and white", Habitat = "Open fields" },
                new Bird { Name = "Crow", Color = "Black", Habitat = "Various" }
            };

            return View(birds);
        }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
