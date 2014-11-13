using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace TemporaryCoffin.Models.DbModel.DbData.Mapping
{
    /// <summary>
    /// 
    /// </summary>
    public class ParagensMapping:EntityTypeConfiguration<Paragens>
    {
        /// <summary>
        /// ctor
        /// </summary>
        public ParagensMapping()
        {
            HasKey(t => t.ID);

            
            Property(t => t.ID).IsRequired();
            Property(t => t.IdLinha).IsRequired();
            Property(t => t.NomeParagem).IsRequired();
            Property(t => t.latitude).IsRequired();
            Property(t => t.longitude).IsRequired();
            Property(t => t.Ordem).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
            ToTable("Paragens");
            Property(t => t.ID).HasColumnName("stamp");
            Property(t => t.IdLinha).HasColumnName("stampLinha");
            Property(t => t.NomeParagem).HasColumnName("NomeParagem");
            Property(t => t.latitude).HasColumnName("latitude");
            Property(t => t.longitude).HasColumnName("longitude");
            Property(t => t.Ordem).HasColumnName("Ordem");

        }
    }
}