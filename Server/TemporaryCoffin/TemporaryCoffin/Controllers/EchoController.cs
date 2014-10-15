using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;

namespace TemporaryCoffin.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    public class EchoController : ApiController
    {
        #region Metodos
        /// <summary>
        /// metodo para devolver uma mensagem de echo para teste
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [ResponseType(typeof(string))]
        public HttpResponseMessage Echo()
        {
            // var response = Request.CreateResponse(HttpStatusCode.OK, "DATA OK");
            //return response;
            return new HttpResponseMessage { Content = new StringContent("DataOk"), StatusCode = HttpStatusCode.OK };
        }
        #endregion
    }
}
