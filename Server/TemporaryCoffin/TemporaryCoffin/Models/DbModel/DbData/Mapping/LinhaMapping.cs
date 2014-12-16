using System.Data.Entity.ModelConfiguration;

namespace TemporaryCoffin.Models.DbModel.DbData.Mapping
{
    /// <summary>
    /// 
    /// </summary>
    public class LinhaMapping:EntityTypeConfiguration<Linha>
    {
        /// <summary>
        /// 
        /// </summary>
        public LinhaMapping()
        {
            HasKey(t => t.ID);

            Property(t => t.LatInicio).IsRequired();
            Property(t => t.LongInicio).IsRequired();
            Property(t => t.LatFim).IsRequired();
            Property(t => t.LongFim).IsRequired();
            Property(t => t.NomeLinha).IsRequired().HasMaxLength(50);

            ToTable("dadosLinha");
            Property(t => t.ID).HasColumnName("stamp");
            Property(t => t.LatInicio).HasColumnName("stampLinha");
            Property(t => t.LongInicio).HasColumnName("NomeParagem");
            Property(t => t.LatFim).HasColumnName("latitude");
            Property(t => t.LongFim).HasColumnName("longitude");
            Property(t => t.NomeLinha).HasColumnName("nomeLinha");
        }
    }
}