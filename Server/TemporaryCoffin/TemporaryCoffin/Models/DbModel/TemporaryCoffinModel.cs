using System.Data.Entity;
using TemporaryCoffin.Models.DbModel.DbData;
using TemporaryCoffin.Models.DbModel.DbData.Mapping;

namespace TemporaryCoffin.Models.DbModel
{
    /// <summary>
    /// 
    /// </summary>
    public class TemporaryCoffinModel:DbContext
    {

        public DbSet<Linha> DadosLinha { get; set; }
        public DbSet<BusDataInformation> DadosBus { get; set; }
        public DbSet<Paragens> DadosParagens { get; set; }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="connection"></param>
        public TemporaryCoffinModel(string connection)
            : base(connection)
        {
            Database.SetInitializer<TemporaryCoffinModel>(null);
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