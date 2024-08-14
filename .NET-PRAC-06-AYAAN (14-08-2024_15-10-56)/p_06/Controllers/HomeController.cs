using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using p_06.Models;

namespace p_06.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        var employees = new List<Employee>{

            new Employee{
                Name = "John",
                Age = 25,
                Salary = 5000.00,
                Email = "john@gmail.com",
                role="Clerk",
            },
            new Employee{
                Name = "Alice",
                Age = 25,
                Salary = 5000.00,
                Email = "alice@gmail.com",
                role="Clerk",
            },
            new Employee{
                Name = "Sam",
                Age = 25,
                Salary = 5000.00,
                Email = "sam@gmail.com",
                role="Manager",
            }

        };

        ViewBag.employees = employees;
        
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
