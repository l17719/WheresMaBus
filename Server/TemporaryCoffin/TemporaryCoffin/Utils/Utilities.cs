using System;
using System.Collections.Generic;
using System.Data.Entity.Core.EntityClient;

namespace TemporaryCoffin.Utils
{
    /// <summary>
    /// 
    /// </summary>
    public class Utilities
    {
        #region Classvars

        private static Utilities _instance;
        private static EntityConnectionStringBuilder _sqlConnection;
        
        

        #endregion

        #region Ctor
        /// <summary>
        /// construtor classe
        /// </summary>
        private Utilities()
        {
        }


        /// <summary>
        /// definicao do metodo singleton
        /// </summary>
        /// <returns></returns>
        public static Utilities GetInstance()
        {
            return _instance ?? (_instance = new Utilities());
        }

        #endregion
        #region VerificacaoUser
        #region Userverification
        /// <summary>
        /// Metodo para verificar se existem items em cache e/ou retirar quer cache ou db
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public bool IsUserValid(string value)
        {
            if (_tmplistaTiposPedidos == null)
            {
                if (CheckCache())
                {
                    _tmpListaUsers = ExtractFromCache();
                }
                else
                {
                    var tmpGetfromDb = ExtractFromDb();
                    _tmpListaUsers = tmpGetfromDb;
                }


            }

            if (_tmpListaUsers.Any())
            {
                InjectIntoCache(_tmpListaUsers);
            }

            return CheckValidKey(value);
        }
        /// <summary>
        /// metodo para verificar se a chave e valida
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        private static bool CheckValidKey(string value)
        {

            var tmpQuery = (from t in _tmpListaUsers
                            where t.ApiKey == Guid.Parse(value) && t.IsValid
                            select t.IdUser).SingleOrDefault();

            return tmpQuery.ToString() != "00000000-0000-0000-0000-000000000000" && string.IsNullOrEmpty(tmpQuery.ToString());
        }


        /// <summary>
        /// metodo para verificar se os items estao dentro da cache
        /// </summary>
        /// <returns></returns>
        private static bool CheckCache()
        {
            // after appfabric
            //var tmpLista = (List<CSortUser>) Cache.Get("default");
            // return tmpLista != null && tmpLista.Any();
            //


            return false;

        }

        /// <summary>
        /// metodo para efectuar a extraccao dos dados da cache
        /// </summary>
        /// <returns>List of CsortUser</returns>
        private static List<CSortUser> ExtractFromCache()
        {

            if (_tmpListaUsers != null && _tmpListaUsers.Any())
            {
                _tmpListaUsers.Clear();

            }

            return new List<CSortUser>();
            // after appfabric
            // return (List<CSortUser>)Cache.Get("default");
            //
        }

        /// <summary>
        /// Metodo para extrair os dados da base dados
        /// </summary>
        /// <returns></returns>
        private static List<Utilizadores> ExtractFromDb()
        {
            var resultado = new List<Utilizadores>();
            try
            {
                using (var tmp = new RequestDbContext(GetAuthConnection().ProviderConnectionString))
                {
                    try
                    {

                        tmp.Configuration.AutoDetectChangesEnabled = false;


                        var tmpQuery = (from t in tmp.DadosUsers
                                        select t).ToList();

                        if (tmpQuery.Any())
                        {
                            resultado = tmpQuery;
                        }



                    }
                    finally
                    {
                        tmp.Configuration.AutoDetectChangesEnabled = true;
                    }
                }
            }
            catch (Exception e)
            {
                if (e.InnerException != null)
                {
                    //LogManager.WriteError(1000, "Erro ExtractFromDb: \n " + e.InnerException + "\n " + e.Message);
                }
                else
                {
                    //LogManager.WriteError(1000, "Erro ExtractFromDb:\n " + e.Message);
                }

            }
            return resultado;
        }

       
        #endregion
        #endregion


    }
}