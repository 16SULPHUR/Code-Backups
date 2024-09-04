using System.Net.Http;
using System.Threading.Tasks;

namespace P_08.Services{

    public class WebService{
        private readonly HttpClient _httpClient;

        public WebService(HttpClient httpClient){
            _httpClient = httpClient;
        }

        public async Task<string> downloadData(string url){
            var response = await _httpClient.GetStringAsync(url);
            return response;
        }
    }
}