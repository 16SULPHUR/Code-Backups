using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using System;

namespace cie2.Controllers
{
    public class HomeController : Controller
    {
        // Action to display the main page and show current cookie value
        public IActionResult Index()
        {
            // Retrieve the cookie value if it exists
            string cookieValue = Request.Cookies["MyCookie"];

            // Pass the cookie value to the view
            ViewData["CookieValue"] = cookieValue;

            return View();
        }

        // Action to set a cookie with a custom value
        [HttpPost]
        public IActionResult SetCustomCookie(string cookieValue)
        {
            if (!string.IsNullOrEmpty(cookieValue))
            {
                Response.Cookies.Append("MyCookie", cookieValue, new CookieOptions
                {
                    Expires = DateTimeOffset.Now.AddMinutes(5) // Cookie expires in 5 minutes
                });
            }

            return RedirectToAction("Index");
        }

        // Action to delete the cookie
        public IActionResult DeleteCookie()
        {
            // Delete the cookie
            Response.Cookies.Delete("MyCookie");

            return RedirectToAction("Index");
        }
    }
}
