using System.Data.Entity;
using TemporaryCoffin.Models.DbModel.DbData;
using TemporaryCoffin.Models.DbModel.DbData.Mapping;

namespace TemporaryCoffin.Models.DbModel
{
    /// <summary>
    /// Classe que funciona como definicao do modelo de dados
    /// </summary>
    public class TemporaryCoffinModel:DbContext
    {

        /// <summary>
        /// Propriedade para conter
        /// </summary>
        public DbSet<Linha> DadosLinha { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public DbSet<BusDataInformation> DadosBus { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public DbSet<Paragens> DadosParagens { get; set; }

        /// <summary>
        /// Ctor da class
        /// </summary>
        /// <param name="connection"></param>
        public TemporaryCoffinModel(string connection)
            : base(connection)
        {
            Database.SetInitializer(new TemporaryCoffinDbInitializer());
        }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {

            
            base.OnModelCreating(modelBuilder);
           
            
            modelBuilder.Configurations.Add(new LinhaMapping());
            modelBuilder.Configurations.Add(new BusDataInformationMapping());
            modelBuilder.Configurations.Add(new ParagensMapping());
        }
    }
}