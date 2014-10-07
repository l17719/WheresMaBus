using System.Threading.Tasks;
using System.Web.Http;
using TemporaryCoffin.Models.ValueObject;

namespace TemporaryCoffin.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    public class Pedidos : ApiController
    {
        [HttpGet]
        public async Task<InfoDataBus> GetLastBusLocation()
        {
            
        }

        private async Task<InfoDataBus> WorkerGetLastBusLocation()
        {
            
        }
    }
}
