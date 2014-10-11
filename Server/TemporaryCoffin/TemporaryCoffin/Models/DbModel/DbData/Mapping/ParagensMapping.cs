using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Web;

namespace TemporaryCoffin.Models.DbModel.DbData.Mapping
{
    public class ParagensMapping:EntityTypeConfiguration<Paragens>
    {
        public ParagensMapping()
        {
            HasKey(t => t.ID);

            
            Property(t => t.ID).IsRequired();
            Property(t => t.IdLinha).IsRequired();
            Property(t => t.NomeParagem).IsRequired();
            Property(t => t.latitude).IsRequired();
            Property(t => t.longitude).IsRequired();

            ToTable("Paragens");
            Property(t => t.ID).HasColumnName("stamp");
            Property(t => t.IdLinha).HasColumnName("stampLinha");
            Property(t => t.NomeParagem).HasColumnName("NomeParagem");
            Property(t => t.latitude).HasColumnName("latitude");
            Property(t => t.longitude).HasColumnName("longitude");

        }
    }
}