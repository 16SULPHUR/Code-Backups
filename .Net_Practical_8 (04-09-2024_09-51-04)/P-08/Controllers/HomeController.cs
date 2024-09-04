using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using P_08.Models;
using P_08.Services;

namespace P_08.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly WebService _webService; 

        // Combine dependencies into one constructor
        public HomeController(ILogger<HomeController> logger, WebService webService)
        {
            _logger = logger;
            _webService = webService;
        }

        public async Task<IActionResult> Index()
        {
            string url = "https://official-joke-api.appspot.com/jokes/random"; 
            var data = await _webService. downloadData(url); // Use _webService instead of _webDataService
            ViewBag.Data = data;
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
}
