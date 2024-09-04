using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using P_06.Models;

namespace P_06.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

      public IActionResult Index()
        {
            var employees = new List<Employee>
            {
                new Employee { name = "John", emp_id = 4656, age = 54 },
                new Employee { name = "Alice", emp_id = 8956, age = 24 },
                new Employee { name = "Echon", emp_id = 1258, age = 18 }
            };
            return View(employees);
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
