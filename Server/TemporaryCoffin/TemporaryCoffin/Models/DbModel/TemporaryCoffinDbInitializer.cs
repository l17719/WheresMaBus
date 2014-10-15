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
            return new List<Paragens>();
        }


        private static IEnumerable<BusDataInformation> GenerateBusData()
        {
            return new List<BusDataInformation>();
        } 
    }
}