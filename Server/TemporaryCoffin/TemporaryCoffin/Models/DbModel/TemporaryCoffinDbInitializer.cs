using System;
using System.Collections.Generic;
using System.Data.Entity;
using TemporaryCoffin.Models.DbModel.DbData;

namespace TemporaryCoffin.Models.DbModel
{
    /// <summary>
    /// Classe para conter o inicializador da base de dados e "seed" dos dados
    /// </summary>
    public class TemporaryCoffinDbInitializer : CreateDatabaseIfNotExists<TemporaryCoffinModel>
    {
        protected override void Seed(TemporaryCoffinModel context)
        {


            var tmpInfoLinha = new Linha
            {
                ID = new Guid("41297aff-fa85-4194-a3fd-a2e52606b04c"),
                NomeLinha = "LinhaAzul",
                LatInicio = 38.5653476,
                LongInicio = -7.909456999999975,
                LatFim = 38.5690676,
                LongFim = -7.917530299999953
            };

            var tmpDadosParagem = GenerateParagens();
            foreach (var item in tmpDadosParagem)
            {

                context.DadosParagens.Add(item);
            }
            var tmpDadosBus = GenerateBusData();

            foreach (var itembus in tmpDadosBus)
            {
                context.DadosBus.Add(itembus);
            }


            base.Seed(context);
        }

        private static IEnumerable<Paragens> GenerateParagens()
        {
            var resultado= new List<Paragens>
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
                    NomeParagem = 
                }
            };
        }


        private static IEnumerable<BusDataInformation> GenerateBusData()
        {
            return new List<BusDataInformation>();
        } 
    }
}