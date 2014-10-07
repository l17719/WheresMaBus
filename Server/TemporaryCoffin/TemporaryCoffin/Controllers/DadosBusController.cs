using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using TemporaryCoffin.Models.DbModel.DbData;
using TemporaryCoffin.Models.ValueObject;
using TemporaryCoffin.Utils;

namespace TemporaryCoffin.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    public class DadosBusController : ApiController
    {
        #region ClassVars
        private static readonly Utilities Instance = Utilities.GetInstance();
        private static readonly LogFactoryManager LogManager = LogFactoryManager.GetInstance();
        #endregion

        #region Metodos
        #region ObterInfoBus

        [HttpGet]
        public async Task<InfoBus> ObterInfoBus()
        {
            try
            {

            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private static async Task<InfoBus> WorkerGetInfoBus()
        {
            
        }
        #endregion
        #region InjectaInformacaoBus
        /// <summary>
        /// metodo para inserir informacaoBus
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("Criar")]
        [ResponseType(typeof (string))]
        public async Task<HttpResponseMessage> RegInfoBus([FromBody] InfoDataBus value)
        {
            
        }

        private static async Task<string> WorkerCriarArtigo(InfoDataBus value)
        {
            try
            {

            }
            catch (Exception)
            {
                
                throw;
            }
        }
        #endregion
        #endregion
    }
}
