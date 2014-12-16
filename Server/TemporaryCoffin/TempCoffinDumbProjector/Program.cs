using System;
using System.Collections.Generic;
using System.Globalization;
using System.Threading;
using System.Threading.Tasks;
using RestSharp;
using TempCoffinDumbProjector.Model;

namespace TempCoffinDumbProjector
{
    public class Program
    {

        private static List<Paragens> _listaparagens;
        private static Paragens _selectedParagem;
        static  void Main(string[] args)
        {
            _listaparagens = GeraListaParagens();

            var tmpTask = Task<string>.Factory.StartNew(GenerateData);
            if (tmpTask.Result == "OK")
            {
                Environment.Exit(0);
            }

        }
        #region GeraDadosDummy
        /// <summary>
        /// Gera lista paragens lista para injeccao de dados dummy
        /// </summary>
        /// <returns> List</returns>
        private static List<Paragens> GeraListaParagens()
        {
           return new List<Paragens>
           {
               new Paragens
                {
                    ID = Guid.NewGuid(),
                    IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                    NomeParagem = "Av Dinis Miranda",
                    latitude = 38.5653476,
                    longitude = -7.909456999999975
                },
                new Paragens
                {
                    ID = Guid.NewGuid(),
                    IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                    NomeParagem = "Av Combatentes",
                    latitude = 38.562692,
                    longitude = -7.906251699999984
                },
                new Paragens
                {
                    ID = Guid.NewGuid(),
                    IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                    NomeParagem = "Chafariz del Rei",
                    latitude = 38.5664284,
                    longitude = -7.902641000000017
                },
                new Paragens
                {
                    ID = Guid.NewGuid(),
                    NomeParagem = "Hospital Patrocinio",
                   IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                   latitude = 38.5689513,
                   longitude = -7.903241299999991
                },
                new Paragens
                {
                    ID = Guid.NewGuid(),
                    NomeParagem = "Avenida S. Joao Deus",
                    IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                    latitude = 38.5701901,
                    longitude = -7.901536299999975
                },
                new Paragens
                {
                    ID = Guid.NewGuid(),
                    NomeParagem = "Rua Machede",
                    IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                    latitude = 38.5720499,
                    longitude = -7.903438100000017,

                },
                new Paragens
                {
                    IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                    ID = Guid.NewGuid(),
                    NomeParagem = "Portas de moura, Rua Dom Augusto Eduardo Nunes",
                    latitude = 38.5691873,
                    longitude = -7.904356900000039
                },
                  new Paragens
                {
                    ID = Guid.NewGuid(),
                    NomeParagem = "Hospital Espirito Santo",
                   IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                   latitude = 38.5689513,
                   longitude = -7.903241299999991
                },
                  new Paragens
                {
                    ID = Guid.NewGuid(),
                    NomeParagem = "Rossio Sao Bras",
                   IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                   latitude = 38.5665979,
                   longitude = -7.905662799999959
                },
                 new Paragens
                {
                    ID = Guid.NewGuid(),
                    NomeParagem = "Rua Republica",
                   IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                   latitude = 38.5693596,
                   longitude = -7.908276999999998
                },
                 new Paragens
                {
                    ID = Guid.NewGuid(),
                    NomeParagem = "Praça Giraldo",
                   IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                   latitude = 38.570941,
                   longitude = -7.909378999999944
                },
                new Paragens
                {
                    ID = Guid.NewGuid(),
                    NomeParagem = "Rua de Serpa Pinto, Evora",
                   IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                   latitude = 38.5706994,
                   longitude = -7.911979400000064
                },
                new Paragens
                {
                    ID = Guid.NewGuid(),
                    NomeParagem = "Rua de Serpa Pinto, Evora",
                   IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                   latitude = 38.5706994,
                   longitude = -7.911979400000064
                },
                new Paragens
                {
                    ID = Guid.NewGuid(),
                    NomeParagem = "Avenida Lisboa",
                   IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                   latitude = 38.5719461,
                   longitude = -7.915531299999998
                },
                 new Paragens
                {
                    ID = Guid.NewGuid(),
                    NomeParagem = "Horta da Porta",
                   IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                   latitude = 38.574747,
                   longitude = -7.916391200000021
                },
                 new Paragens
                {
                    ID = Guid.NewGuid(),
                    NomeParagem = "Porta Nova Rua Candido Reis",
                   IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                   latitude = 38.5744402,
                   longitude = -7.912951600000042
                },
                new Paragens
                {
                    ID = Guid.NewGuid(),
                    NomeParagem = "Rua Menino Jesus",
                   IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                   latitude = 38.5733317,
                   longitude = -7.908930700000042
                },
                new Paragens
                {
                    ID = Guid.NewGuid(),
                    NomeParagem = "Rampa Seminario Largo Colegiais",
                   IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                   latitude = 38.5736278,
                   longitude = -7.9062404000000015
                },
                new Paragens
                {
                    ID = Guid.NewGuid(),
                    NomeParagem = "Rua Doutor Domingos Rosado",
                   IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                   latitude = 38.5747516,
                   longitude = -7.901795399999969
                },
                 new Paragens
                {
                    ID = Guid.NewGuid(),
                    NomeParagem = "Avenida da Universidade",
                   IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                   latitude = 38.5739458,
                   longitude = -7.903209599999968
                },
                new Paragens
                {
                    ID = Guid.NewGuid(),
                    NomeParagem = "Rua da Corredoura",
                   IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                   latitude = 38.5737883,
                   longitude = -7.9096002999999655
                },
                 new Paragens
                {
                    ID = Guid.NewGuid(),
                    NomeParagem = "Rua de Aviz",
                   IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                   latitude = 38.5748003,
                   longitude = -7.909974899999952
                },
                new Paragens
                {
                    ID = Guid.NewGuid(),
                    NomeParagem = "Avenida de São Sebastião",
                   IdLinha = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                   latitude = 38.5690676,
                   longitude = -7.917530299999953
                },
            };
           
        }
        #endregion

        #region DummyInjection
        /// <summary>
        /// Metodo para gerar dummy data para o bus
        /// </summary>
        /// <returns>String</returns>
        private static string GenerateData()
        {
            var i = 0;
            while (true)
            {
                if (i == _listaparagens.Count)
                {
                    i = 0;
                    _selectedParagem = _listaparagens[i];
                }
                else
                {
                    _selectedParagem = _listaparagens[i];
                }


                // escrita consola dos dados
                Console.WriteLine("Informacao contador {0}\n, informacao paragem {1}\n, nome paragem {2}\n",i,_selectedParagem.ID, _selectedParagem.NomeParagem);
                //


                //dummy location var restClient = new RestClient("http://localhost:61765");
                // server location
                var restClient = new RestClient("http://localhost:8080/WMB");
                //
                var req = new RestRequest("/api/bdata/c/value", Method.POST)
                {
                    RequestFormat = DataFormat.Json,
                    
                }.AddBody(new InfoDataBusVo
                {
                    DataHora = DateTime.UtcNow.ToString(CultureInfo.InvariantCulture),
                    Id = Guid.NewGuid().ToString(),
                    NomeParagem = _selectedParagem.NomeParagem,
                    Latitude = _selectedParagem.latitude,
                    Longitude = _selectedParagem.longitude

                });
                req.AddHeader("Accept", "application/json");

                //req.AddObject( new InfoDataBusVo
                //{
                //    DataHora = DateTime.UtcNow.ToString(CultureInfo.InvariantCulture),
                //    Id = Guid.NewGuid().ToString(),
                //    NomeParagem = _selectedParagem.NomeParagem,
                //    Latitude = _selectedParagem.latitude,
                //    Longitude = _selectedParagem.longitude
                    
                //});


                var response = restClient.ExecuteAsync(req, serverak => Console.WriteLine("resposta: {0}\n", serverak.Content));
                i++;
                Thread.Sleep(300000);
                
            }
            return "OK";
        }
        #endregion
    }
}
