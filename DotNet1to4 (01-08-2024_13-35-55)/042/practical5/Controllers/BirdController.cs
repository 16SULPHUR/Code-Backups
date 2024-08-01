using Microsoft.AspNetCore.Mvc;
using BirdInfoApp.Models;
using System.Collections.Generic;

namespace BirdInfoApp.Controllers
{
    public class BirdController : Controller
    {
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
    }
}
