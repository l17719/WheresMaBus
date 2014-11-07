using System.Data.Entity.ModelConfiguration;

namespace TemporaryCoffin.Models.DbModel.DbData.Mapping
{
    /// <summary>
    /// 
    /// </summary>
    public class BusDataInformationMapping : EntityTypeConfiguration<BusDataInformation>
    {
        public BusDataInformationMapping()
        {
            HasKey(t => t.ID);

            Property(t => t.Latitude).IsRequired();
            Property(t => t.Longitude).IsRequired();
            Property(t => t.DataHora).IsRequired();


            ToTable("BusInfo");
            Property(t => t.ID).HasColumnName("stamp");
            Property(t => t.Latitude).HasColumnName("latbusposition");
            Property(t => t.Longitude).HasColumnName("longbusposition");
            Property(t => t.DataHora).HasColumnName("dataHoraBus");
        }
    }
}