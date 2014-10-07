using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using TemporaryCoffin.Models.ValueObject;
using TemporaryCoffin.Utils;

namespace TemporaryCoffin.Controllers
{
    public class UsersController : ApiController
    {
        #region Classvars
        private static readonly Utilities Utility = Utility.GetInstance();
        private static readonly LogFactoryManager Log = LogFactoryManager.GetInstance();

        #endregion
        #region RegistoUser

        [HttpPost]
        [ActionName("Criar")]
        [ResponseType(typeof(string))]
        public async Task<HttpResponseMessage> RegistoUtilizador([FromBody] UtilizadorVo value)
        {

            if (value == null)
            {
                return new HttpResponseMessage { Content = new StringContent("NODATA"), StatusCode = HttpStatusCode.Forbidden };

            }
            var tmpTask = WorkerRegUser(value);
            var resultado = await tmpTask;

            if (resultado == "UserExists")
            {
                return new HttpResponseMessage
                {
                    Content = new StringContent("USEREXISTS"),
                    StatusCode = HttpStatusCode.Forbidden
                };
            }
            return new HttpResponseMessage { Content = new StringContent("USEROK"), StatusCode = HttpStatusCode.ok };
            //return resultado;
        }

        private static async Task<string> WorkerRegUser(UtilizadorVo value)
        {
            try
            {
                return await Task.Run(() =>
                {
                    var x = Utility.GetCachedUsers();

                    var tmpUser = (from t in x
                                   where t.Username == value.Username
                                   select t).SingleOrDefault();

                    var resultado = "";
                    if (tmpUser == null)
                    {

                        resultado = Guid.NewGuid().ToString();
                        // crud operations for db and cache and local
                        Utility.AddUser(value);



                    }
                    else
                    {
                        resultado = "UserExists";
                    }


                    return resultado;

                });




            }
            catch (Exception e)
            {

                if (e.InnerException != null)
                {
                    Log.WriteError(1200, "Erro ao registar user:\n" + e.InnerException + "\n" + e.Message);
                }
                else
                {
                    Log.WriteError(1200, "Erro ao registar user:\n" + e.Message);
                }

                throw new HttpResponseException(HttpStatusCode.BadRequest);

            }


        }
        #endregion

        #region EditUSer

        [HttpPost]
        [ActionName("Edit")]
        [ResponseType(typeof(string))]
        public async Task<string> EditUser(string valueId, string valueFirstName, string valueLastName)
        {
            if (string.IsNullOrEmpty(valueId))
            {
                return "USERNOTFOUND";
            }
            var tmpTask = WorkerEditUser(valueId, valueFirstName, valueLastName);
            var resultado = await tmpTask;
            return resultado;
        }

        private static async Task<string> WorkerEditUser(string valueID, string valueFirst, string valueLast)
        {
            try
            {
                return await Task.Run(() =>
                {
                    var x = Utility.GetCachedUsers();
                    var tmpUser = (from t in x
                                   where t.IdUtilizador == Guid.Parse(valueID)
                                   select t).SingleOrDefault();


                    var resultado = "";
                    if (tmpUser == null)
                    {
                        resultado = "USERNOTFOUND";

                    }
                    else
                    {
                        Utility.EditUser(valueID, valueFirst, valueLast);
                        resultado = "EDITOK";
                    }
                    return resultado;
                });
            }
            catch (Exception)
            {

                throw new HttpResponseException(HttpStatusCode.BadRequest);
            }
        }

        #endregion

        #region RecuperarInfo

        [HttpGet]
        public async Task<UtilizadorVo> RecuperaPass(string value)
        {
            
        }

        private static async Task<string> WorkerCriarFamilia(string value)
        {
            
        }
        #endregion
    }
}
