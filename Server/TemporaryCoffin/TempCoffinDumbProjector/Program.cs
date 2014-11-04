﻿using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RestSharp;
using TempCoffinDumbProjector.Model;

namespace TempCoffinDumbProjector
{
    public class Program
    {

        private static List<Paragens> Listaparagens;
        private static Paragens SelectedParagem;
        static void Main(string[] args)
        {
            Listaparagens = GeraListaParagens();
        }

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


        private static async Task<String> GenerateData()
        {
            var restClient = new RestClient("");

            var i = 0;
            while (true)
            {
                if (SelectedParagem == null)
                {
                    SelectedParagem = Listaparagens[i];
                    i++;
                }
                if (i == Listaparagens.Count)
                {
                    i = 0;
                    SelectedParagem = Listaparagens[i];
                }


                restClient = new RestClient("");
                var req = new RestRequest("api/NomeController/", Method.POST);
                req.AddParameter("application/json", new InfoDataBusVo
                {
                    DataHora = DateTime.UtcNow.ToShortDateString(),
                    Id = Guid.NewGuid().ToString(),
                    NomeParagem = SelectedParagem.NomeParagem,
                    Latitude = SelectedParagem.latitude,
                    Longitude = SelectedParagem.longitude
                    
                }, ParameterType.RequestBody);

                var response =  restClient.Execute(req);
                
                await Task.Delay(2000);
            }
        }
    }
}
