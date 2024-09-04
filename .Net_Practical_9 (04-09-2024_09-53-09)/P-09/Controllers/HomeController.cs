using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using P_09.Models;

namespace P_09.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        //setting a Cookie

        Response.Cookies.Append("MyCookie","CookieValue",new CookieOptions {Expires = DateTimeOffset.UtcNow.AddMinutes(5)});

        //retirve query value
        string QueryValue = Request.Query["example"];

        //retrive session value
        string SessionValue = HttpContext.Session.GetString("SessionKey");

        ViewBag.QueryValue = QueryValue;
        ViewBag.SessionValue = SessionValue;

        return View();
    }

    [HttpPost]
    public IActionResult SetSessionValue(string sessionValue){
        HttpContext.Session.SetString("SessionKey",sessionValue);
        return RedirectToAction("Index");
    }

    [HttpPost]
    public IActionResult SetHiddenFieldValue(string hiddenValue){
        Response.Cookies.Append("HiddenFieldCookie",hiddenValue,new CookieOptions {Expires = DateTimeOffset.UtcNow.AddMinutes(5)});
        return RedirectToAction("Index");
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
