using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using P_07.Models;
using P_07.Extensions;

namespace P_07.Controllers;

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
    new Employee { id = 986524, name = "John", age = 52 }
};
    var employee = employees[0];
    bool isEligible = employee.isEligibleForRetirement();
    ViewBag.eligibility = isEligible ? "Employee is eligible for retirement":"Employee is not eligible for retirement";
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
