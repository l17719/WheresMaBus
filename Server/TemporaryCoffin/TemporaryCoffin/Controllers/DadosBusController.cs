using System;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using TemporaryCoffin.Models.ValueObject;
using TemporaryCoffin.Utils;

namespace TemporaryCoffin.Controllers
{
    /// <summary>
    /// Controller Bus
    /// </summary>
    public class DadosBusController : ApiController
    {
        #region ClassVars
        private static readonly Utilities Instance = Utilities.GetInstance();
        //private static readonly LogFactoryManager LogManager = LogFactoryManager.GetInstance();
        #endregion

        #region Metodos
        
        #region ObterInfoBus

        /// <summary>
        /// Metodo para devolver a informacao da localizacao do bus
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("GetBus")]
        [ResponseType(typeof(DataResponseVo))]
        public async Task<IHttpActionResult> ObterInfoBus([FromBody]RequestVO value)
        {

            if (value == null)
            {
                return BadRequest("Sem informacao");
               
            }

            var tmpTask = WorkerObterInfo(value);
            var resultado = await tmpTask;
            if (resultado == null)
            {
                return NotFound();

            }
            return Ok(resultado);
        }


        private static async Task<DataResponseVo> WorkerObterInfo(RequestVO value)
        {

            var tmpTask = Instance.GetLastPosBus(value);
            var resultado = await tmpTask;
            return resultado;
            
        }
        
        #endregion

        #region InjectaInformacaoBus
        /// <summary>
        /// metodo para inserir informacaoBus
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("c")]
        [ResponseType(typeof (string))]
        public async Task<HttpResponseMessage> RegInfoBus([FromBody] InfoDataBusVo value)
        {
            if (value == null)
            {
                return new HttpResponseMessage { Content = new StringContent("NODATA"), StatusCode = HttpStatusCode.BadRequest };
            }

            var tmpTask = WorkerInfoBus(value);
            var resultado = await tmpTask;
            if (resultado == "NOK")
            {
                return new HttpResponseMessage
                {
                    Content = new StringContent("DATANOK"),
                    StatusCode = HttpStatusCode.BadRequest
                };
            }

            return new HttpResponseMessage {Content = new StringContent("DATAOK"), StatusCode = HttpStatusCode.OK};
        }

        private static async Task<string> WorkerInfoBus(InfoDataBusVo value)
        {
            var resultado="";
            try
            {
                var tmpTask = Instance.RegisterBusInfo(value);
                var resultadoTask = await tmpTask;

                resultado = resultadoTask;
            }
            catch (Exception)
            {
                resultado = "NOK";
                
                throw;
            }
            return resultado;
        }
        #endregion


        #region AddParagens

        /// <summary>
        /// 
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("ap")]
        [ResponseType(typeof (string))]
        public async Task<HttpResponseMessage> RegistaDadosParagem([FromBody] InfoDataBusVo value)
        {
            if (value == null)
            {
                return new HttpResponseMessage
                {
                    Content = new StringContent("NODATA"),
                    StatusCode = HttpStatusCode.BadRequest
                };
            }

            var tmptask = WorkerRegistoDadosParagem(value);
            var resultado = await tmptask;
            if (resultado == "NOK" || resultado == "SEMROTA")
            {
                return new HttpResponseMessage
                {
                    Content = new StringContent("BADDATA"),
                    StatusCode = HttpStatusCode.Forbidden
                };

            }
            return new HttpResponseMessage
            {
                StatusCode = HttpStatusCode.OK,
                Content = new StringContent("OK")
            };
        }


        private static async Task<string> WorkerRegistoDadosParagem(InfoDataBusVo value)
        {
            var tmpTask = Instance.RegisterStop(value);
            var resultado = await tmpTask;
            return resultado;
        }

        #endregion

        #endregion
    }
}
