using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using practical7.Models;
using practical7.Extensions;

namespace practical7.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        var employee = new Employee
        {
            Id = 1,
            FirstName = "John",
            LastName = "Doe",
            Email = "john.doe@example.com",
            HireDate = DateTime.Now
        };

        ViewBag.FullName = employee.GetFullName();
        return View(employee);
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
