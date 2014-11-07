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
            try
            {
                using (var tmpconn = new TemporaryCoffinModel(GetSqlConfigData().ProviderConnectionString))
                {
                    try
                    {
                        tmpconn.Configuration.AutoDetectChangesEnabled = false;
                        var tmpData = Convert.ToDateTime(value.DataHora);
                        var tmpquery = await (from t in tmpconn.DadosBus
                            where t.Longitude <= value.Longitude
                                  && t.Latitude <= value.Latitude
                                  && t.DataHora <= tmpData
                            select t).ToListAsync();


                        if (!tmpquery.Any())
                        {
                            return new DataResponseVo
                            {
                                ResponseMessage = "NoBus"
                            };
                        }

                        var resultado = new DataResponseVo
                        {
                            ResponseMessage = "BusFound",
                            ListaPontos = new List<CoordinatesVo>(),
                            TimeAvg = 0
                        };

                        resultado.TimeAvg = await GetMediaDatas(value);
                        foreach (var item in tmpquery)
                        {
                            resultado.ListaPontos.Add(new CoordinatesVo
                            {
                                ID = item.ID.ToString(),
                                LatPos = item.Latitude,
                                LongPos = item.Longitude
                            });
                        }


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
            return null;
        } 
        #endregion
        #region Calculo Medias

        private async Task<double> GetMediaDatas(RequestVO value)
        {
            var resultado = 0.0;
            try
            {
                using (var tmpconn = new TemporaryCoffinModel(GetSqlConfigData().ProviderConnectionString))
                {
                    try
                    {
                        tmpconn.Configuration.AutoDetectChangesEnabled = false;


                        var tmpquery = await (from t in tmpconn.DadosBus
                                              where t.Longitude <= value.Longitude
                                                    && t.Latitude <= value.Latitude
                                                    && t.DataHora == Convert.ToDateTime(value.DataHora)
                                              select t).FirstOrDefaultAsync();

                        if (tmpquery == null)
                        {
                            return resultado;
                        }

                        var tmpData = Convert.ToDateTime(value.DataHora).AddMonths( - 1);

                        
                        var tmpDataMedia = await (from t in tmpconn.DadosBus
                                                      where t.Latitude>=tmpquery.Latitude && t.Longitude>=tmpquery.Longitude
                                                      && t.Latitude<=value.Latitude && t.Longitude<=value.Longitude
                                                      && t.DataHora>=tmpData && t.DataHora<=Convert.ToDateTime(value.DataHora)
                                                      select t).Take(50).ToListAsync();


                        if (tmpDataMedia.Any())
                        {
                            resultado = tmpDataMedia.Aggregate(resultado, (current, item) => current + item.DataHora.Ticks/current);
                        }


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