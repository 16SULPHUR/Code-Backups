using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using practical3.Models;

namespace practical3.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

        public IActionResult Index()
        {
            var hour = DateTime.Now.Hour;
            string greeting;
            string imagePath;

            if (hour < 12)
            {
                greeting = "Good Morning!";
                imagePath = "/images/morning.png";
            }
            else if (hour < 18)
            {
                greeting = "Good Afternoon!";
                imagePath = "/images/afternoon.png";
            }
            else
            {
                greeting = "Good Evening!";
                imagePath = "/images/evening.png";
            }

            ViewBag.Greeting = greeting;
            ViewBag.ImagePath = imagePath;

            return View();
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
