using Microsoft.AspNetCore.Mvc;
using practicle6.Models;

namespace practicle6.Controllers
{
    public class HomeController : Controller
    {
        public ViewResult Index()
        {
            // Create an array of Employee objects
            Employee[] employees = new Employee[]
            {
                new Employee { Name = "AMAN GUPTA", Salary = 80000, Id = 1234 },
                new Employee { Name = "Ravi Kumar", Salary = 75000, Id = 1235 },
                new Employee { Name = "Sita Devi", Salary = 68000, Id = 1236 },
                new Employee { Name = "Rajesh Singh", Salary = 72000, Id = 1237 },
                new Employee { Name = "Anita Sharma", Salary = 69000, Id = 1238 },
                new Employee { Name = "Neha Patel", Salary = 71000, Id = 1239 },
                new Employee { Name = "Vikram Singh", Salary = 74000, Id = 1240 },
                new Employee { Name = "Priya Yadav", Salary = 70000, Id = 1241 },
                new Employee { Name = "Sunil Verma", Salary = 73000, Id = 1242 },
                new Employee { Name = "Kiran Mehta", Salary = 67000, Id = 1243 },
                new Employee { Name = "Raj Kumar", Salary = 68000, Id = 1244 }
            };

            // Create an array of Manager objects
            Manager[] managers = new Manager[]
            {
                new Manager { Name = "Alice Johnson", salary = 90000, id = 1 },
                new Manager { Name = "Bob Smith", salary = 85000, id = 2 },
                new Manager { Name = "Carol Davis", salary = 92000, id = 3 },
                new Manager { Name = "David Wilson", salary = 88000, id = 4 },
                new Manager { Name = "Eva Brown", salary = 93000, id = 5 },
                new Manager { Name = "Frank Miller", salary = 87000, id = 6 },
                new Manager { Name = "Grace Lee", salary = 94000, id = 7 },
                new Manager { Name = "Henry White", salary = 89000, id = 8 },
                new Manager { Name = "Ivy Harris", salary = 91000, id = 9 },
                new Manager { Name = "Jack Clark", salary = 86000, id = 10 }
            };

            // Create an array of Clerk objects
            Clerk[] clerks = new Clerk[]
            {
                new Clerk { Name = "Mina Tanaka", salary = 50000, id = 1 },
                new Clerk { Name = "Yuki Sato", salary = 52000, id = 2 },
                new Clerk { Name = "Kenji Nakamura", salary = 48000, id = 3 },
                new Clerk { Name = "Aiko Suzuki", salary = 49000, id = 4 },
                new Clerk { Name = "Hiroshi Yamamoto", salary = 51000, id = 5 },
                new Clerk { Name = "Nori Saito", salary = 53000, id = 6 },
                new Clerk { Name = "Sakura Kobayashi", salary = 50000, id = 7 },
                new Clerk { Name = "Takumi Matsumoto", salary = 47000, id = 8 },
                new Clerk { Name = "Riko Fujita", salary = 46000, id = 9 },
                new Clerk { Name = "Shinji Mori", salary = 54000, id = 10 }
            };

            // Pass the arrays to the view using ViewBag
            ViewBag.Employees = employees;
            ViewBag.Managers = managers;
            ViewBag.Clerks = clerks;

            return View();
        }
    }
}
