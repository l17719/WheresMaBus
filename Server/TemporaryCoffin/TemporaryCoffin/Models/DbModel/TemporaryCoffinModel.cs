using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using TemporaryCoffin.Models.DbModel.DbData;

namespace TemporaryCoffin.Models.DbModel
{
    public class TemporaryCoffinModel:DbContext
    {
        public DbSet<Utilizador> DataUtilizadores { get; set; }


        public TemporaryCoffinModel(string connection)
            : base(connection)
        {
            Database.SetInitializer<TemporaryCoffinModel>(null);
        }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {


            base.OnModelCreating(modelBuilder);

        }
    }
}