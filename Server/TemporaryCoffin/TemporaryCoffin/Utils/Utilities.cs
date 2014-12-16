using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.EntityClient;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Configuration;
using TemporaryCoffin.Models.DbModel;
using TemporaryCoffin.Models.DbModel.DbData;
using TemporaryCoffin.Models.ValueObject;

namespace TemporaryCoffin.Utils
{
    /// <summary>
    /// 
    /// </summary>
    public class Utilities
    {
        #region Classvars
        private static readonly LogFactoryManager LogManager = LogFactoryManager.GetInstance();
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
        
        #region ConnectionStringData

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public  EntityConnectionStringBuilder GetSqlConfigData()
        {
            var resultado = new EntityConnectionStringBuilder();
            //var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            var config = WebConfigurationManager.OpenWebConfiguration("~");
            var connString = config.ConnectionStrings.ConnectionStrings["DbConnection"].ConnectionString;
            var sqlbuilder = new SqlConnectionStringBuilder(connString);
            resultado.Metadata = @"res://*/";
            resultado.Provider = "System.Data.SqlClient";
            resultado.ProviderConnectionString = sqlbuilder.ToString();
            return resultado;
        }

       
        

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public EntityConnectionStringBuilder DevolveConnection()
        {
            return _sqlConnection ?? (_sqlConnection = GetSqlConfigData());
        }

        #endregion

        
        #region BusRegisterInformation
        /// <summary>
        /// regista a informacao dos dados recebidos do bus para a base de dados
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public async Task<string> RegisterBusInfo(InfoDataBusVo value)
        {
            try
            {
                using (var conn = new TemporaryCoffinModel(DevolveConnection().ProviderConnectionString))
                {
                    conn.DadosBus.Add(new BusDataInformation
                    {
                        ID = Guid.NewGuid(),
                        DataHora = DateTime.UtcNow,
                        Latitude = value.Latitude,
                        Longitude = value.Longitude
                    });

                    await conn.SaveChangesAsync();
                    
                }
            }
            catch (Exception e)
            {
               
                if (e.InnerException != null)
                {
                    LogManager.WriteError(1000, "Erro TC RegBusInfo: \n " + e.InnerException + "\n " + e.Message);
                }
                else
                {
                    LogManager.WriteError(1000, "Erro TC RegBusInfo:\n " + e.Message);
                }
                return "NOK";
            }
            return "OK";
        }
        #endregion

        #region registoDadosParagem
        /// <summary>
        /// metodo para registar os dados da paragem
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public async Task<string> RegisterStop(InfoDataBusVo value)
        {

            try
            {
                using (var tmp= new TemporaryCoffinModel(GetSqlConfigData().ProviderConnectionString))
                {

                    var tmpdataLinha =await (from t in tmp.DadosLinha
                        select t.ID).FirstOrDefaultAsync();

                    if (!string.IsNullOrEmpty(tmpdataLinha.ToString()))
                    {
                        tmp.DadosParagens.Add(new Paragens
                        {
                            ID = Guid.NewGuid(),
                            NomeParagem = value.NomeParagem,
                            latitude = value.Latitude,
                            longitude = value.Longitude,
                            IdLinha = tmpdataLinha
                        });   
                    }
                    else
                    {
                        return "SEMROTA";
                    }
                    
                }
            }
            catch (Exception e)
            {
                if (e.InnerException != null)
                {
                    LogManager.WriteError(1000, "Erro TC RegBusStop: \n " + e.InnerException + "\n " + e.Message);
                }
                else
                {
                    LogManager.WriteError(1000, "Erro TC RegBusStop:\n " + e.Message);
                }
                return "NOK";  
                 
            }
            return "OK";
        }

        #endregion
        
        #region RegistoInfoLinha

        /// <summary>
        /// 
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public async Task<string> RegistaLinha(InfoLinhaVo value)
        {
            try
            {
                using (var tmp = new TemporaryCoffinModel(GetSqlConfigData().ProviderConnectionString))
                {

                    tmp.DadosLinha.Add(new Linha
                    {
                        ID = Guid.NewGuid(),
                        LatFim = value.LatFim,
                        LatInicio = value.LatInicio,
                        LongFim = value.LongFim,
                        LongInicio = value.LongInicio,
                        NomeLinha = value.NomeLinha
                    });

                    await tmp.SaveChangesAsync();
                }
            }
            catch (Exception e)
            {

                if (e.InnerException != null)
                {
                    LogManager.WriteError(1000, "Erro TC RegLinha: \n " + e.InnerException + "\n " + e.Message);
                }
                else
                {
                    LogManager.WriteError(1000, "Erro TC RegLinha:\n " + e.Message);
                }
                return "NOK";
                
                
            }
            return "OK";
        }
        #endregion



        #region ObtemDadosMedia

        /// <summary>
        /// 
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public async Task<DataResponseVo> GetLastPosBus(RequestVO value)
        {
            var resultado= new DataResponseVo();
            try
            {
                using (var tmpconn = new TemporaryCoffinModel(GetSqlConfigData().ProviderConnectionString))
                {
                    try
                    {
                        tmpconn.Configuration.AutoDetectChangesEnabled = false;
                        

                        // last position of bus
                        var tmpQUeryBus = await (from t in tmpconn.DadosBus
                            orderby t.DataHora descending
                            select t).FirstOrDefaultAsync();
                        //

                        if (tmpQUeryBus == null)
                        {
                            return new DataResponseVo
                            {
                                ResponseMessage = "NobusFound",
                                 TimeAvg = 0
                            };
                        }
                        //query para obter o nome da paragem onde o bus se encontra
                        //var tmpQueryParagem = await (from t in tmpconn.DadosParagens
                        //                             where t.latitude == tmpQUeryBus.Latitude
                        //                                   && t.longitude == tmpQUeryBus.Longitude
                        //                             select t).SingleOrDefaultAsync();
                        var tmpQueryParagem = await (from t in tmpconn.DadosParagens
                                                     where t.latitude == tmpQUeryBus.Latitude
                                                           && t.longitude == tmpQUeryBus.Longitude
                                                     select t).FirstOrDefaultAsync();
                        //

                        //query para obter os dados da paragem onde o user se encontra
                        //var tmpQueryDataUSer = await (from t in tmpconn.DadosParagens
                        //                              where t.latitude == value.Latitude && t.longitude == value.Longitude
                        //                              select t).SingleOrDefaultAsync();
                        var tmpQueryDataUSer = await (from t in tmpconn.DadosParagens
                                                      where t.latitude == value.Latitude
                                                      select t).FirstOrDefaultAsync();
                        //

                        // verifica se ambas as queries nao sao nulas

                        if (tmpQueryDataUSer == null)
                        {
                            // caso null retorna uma vo vazia
                            return new DataResponseVo
                            {
                                ResponseMessage = "NobusFound",
                                TimeAvg = 0
                            };
                        }
                        // verifica se o valor da ordem do bus > user(esta a frente)
                        //if (tmpQueryParagem.Ordem > tmpQueryDataUSer.Ordem)
                        //{
                        //    return new DataResponseVo
                        //    {
                        //        ResponseMessage = "BusAhead",
                        //        ListaPontos = new List<CoordinatesVo>
                        //            {
                        //                new CoordinatesVo
                        //                {
                        //                    ID = Guid.NewGuid().ToString(),
                        //                    LatPos = tmpQUeryBus.Latitude,
                        //                    LongPos = tmpQUeryBus.Longitude,
                        //                    NomeParagem = tmpQueryParagem.NomeParagem
                        //                }
                        //            }
                        //    };
                        //}

                       
                        //var tmpData = Convert.ToDateTime(value.DataHora);
                        ////subtrai mes
                        //var tmpDataLMonth = Convert.ToDateTime(tmpData).AddMonths(-1);
                        ////
                        //// query para obter os dados do ultimo mes
                        //var tmpquery = await (from t in tmpconn.DadosBus
                        //                      where t.Longitude == value.Longitude
                        //                            && t.Latitude == value.Latitude
                        //                            && t.DataHora <= tmpDataLMonth
                        //                      select t).Take(50).ToListAsync();
                        //

                        resultado.ResponseMessage = "BusFound";
                        resultado.ListaPontos= new List<CoordinatesVo>();
                        resultado.TimeAvg = 0;
                       

                       //resultado.TimeAvg =  GetMediaDatas(tmpquery);
                        resultado.TimeAvg = 5;
                       //alteracao para conter a paragem
                        resultado.ListaPontos.Add(new CoordinatesVo
                       {
                           ID = Guid.NewGuid().ToString(),
                           LatPos = tmpQUeryBus.Latitude,
                           LongPos = tmpQUeryBus.Longitude,
                           NomeParagem = tmpQueryParagem.NomeParagem
                       });
                        //

                    }
                    finally
                    {
                        tmpconn.Configuration.AutoDetectChangesEnabled = true;
                    }
                }
            }
            catch (Exception e)
            {

                if (e.InnerException != null)
                {
                    LogManager.WriteError(1000, "Erro TC GetLastBuspos: \n " + e.InnerException + "\n " + e.Message);
                }
                else
                {
                    LogManager.WriteError(1000, "Erro TC GetLastBuspos:\n " + e.Message);
                }
            }
            return resultado;
        } 
        #endregion
        #region Calculo Medias
        /// <summary>
        /// metodo para devolver a media das datas
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        private static double GetMediaDatas(List<BusDataInformation> value)
        {
            var resultado = 0.0;
            try
            {
                if (value.Any())
                {
                    resultado =  value.Aggregate(resultado, (current, item) => current + item.DataHora.Ticks / current);
                }

            }
            catch (Exception e)
            {

                if (e.InnerException != null)
                {
                    LogManager.WriteError(1000, "Erro CSORTAPI GetMediaDatas: \n " + e.InnerException + "\n " + e.Message);
                }
                else
                {
                    LogManager.WriteError(1000, "Erro CSORTAPI GetMediaDatas:\n " + e.Message);
                }
            }
            return resultado;
        } 
        #endregion
    }
}