using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using practical1.Models;

namespace practical1.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            var birds = new List<Bird>
    {
        new Bird { Id = 1, Name = "Indian Peafowl", HindiName = "मोर", Species = "Pavo cristatus", Region = "Indian Subcontinent", ConservationStatus = "Least Concern", ImageUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Peacock_Plumage.jpg/320px-Peacock_Plumage.jpg" },
        new Bird { Id = 2, Name = "Indian Roller", HindiName = "नीलकंठ", Species = "Coracias benghalensis", Region = "South Asia", ConservationStatus = "Least Concern", ImageUrl = "https://www.shanghaibirding.com/wp-content/uploads/2020/11/indian-roller.jpg" },
        new Bird { Id = 3, Name = "Sarus Crane", HindiName = "सारस", Species = "Antigone antigone", Region = "North and Central India", ConservationStatus = "Vulnerable", ImageUrl = "https://truespiritanimal.com/wp-content/uploads/2023/12/sarus-crane-symbolism-and-meaning-8da6a320.webp" },
        new Bird { Id = 4, Name = "Great Indian Hornbill", HindiName = "धनेश", Species = "Buceros bicornis", Region = "Indian Subcontinent", ConservationStatus = "Vulnerable", ImageUrl = "https://images.deccanherald.com/deccanherald%2F2024-04%2F1c27db75-214e-4ac6-8547-c43fe96bfe34%2Ffile7v1ywv0ajhg1ei3khh10.jpg?auto=format%2Ccompress&fmt=webp&fit=max&format=webp&q=70&w=900&dpr=1" },
        new Bird { Id = 5, Name = "Indian Pitta", HindiName = "नवरंग", Species = "Pitta brachyura", Region = "Indian Subcontinent", ConservationStatus = "Least Concern", ImageUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Indian_pitta_%28Pitta_brachyura%29_Photograph_by_Shantanu_Kuveskar.jpg/220px-Indian_pitta_%28Pitta_brachyura%29_Photograph_by_Shantanu_Kuveskar.jpg" },
        new Bird { Id = 6, Name = "Golden Oriole", HindiName = "पीलक", Species = "Oriolus kundoo", Region = "Indian Subcontinent", ConservationStatus = "Least Concern", ImageUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/IndianGoldenOriole_M.jpg/220px-IndianGoldenOriole_M.jpg" },
        new Bird { Id = 7, Name = "White-throated Kingfisher", HindiName = "सफेद गला किलकिला", Species = "Halcyon smyrnensis", Region = "South Asia", ConservationStatus = "Least Concern", ImageUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/White-throated_kingfisher_%28Halcyon_smyrnensis%29_Galle.jpg/220px-White-throated_kingfisher_%28Halcyon_smyrnensis%29_Galle.jpg" },
        new Bird { Id = 8, Name = "Indian Paradise Flycatcher", HindiName = "शाही बुलबुल", Species = "Terpsiphone paradisi", Region = "Indian Subcontinent", ConservationStatus = "Least Concern", ImageUrl = "https://risingnepaldaily.com/storage/media/25433/1.jpg" },
        new Bird { Id = 9, Name = "Himalayan Monal", HindiName = "मोनाल", Species = "Lophophorus impejanus", Region = "Himalayas", ConservationStatus = "Least Concern", ImageUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Himalayan_Monal_Adult_Male_East_Sikkim_Sikkim_India.png/220px-Himalayan_Monal_Adult_Male_East_Sikkim_Sikkim_India.png" },
        new Bird { Id = 10, Name = "Red-whiskered Bulbul", HindiName = "सिपाही बुलबुल", Species = "Pycnonotus jocosus", Region = "Indian Subcontinent", ConservationStatus = "Least Concern", ImageUrl = "https://th-i.thgim.com/public/sci-tech/energy-and-environment/p5jdlr/article30808050.ece/alternates/LANDSCAPE_1200/RedwhiskeredBulbulPycnonotusjocosus" }
    };

            return View(birds);
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
