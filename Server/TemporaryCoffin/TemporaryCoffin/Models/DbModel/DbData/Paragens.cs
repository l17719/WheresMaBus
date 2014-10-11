using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TemporaryCoffin.Models.DbModel.DbData
{
    /// <summary>
    /// 
    /// </summary>
    public class Paragens
    {
        public Guid ID { get; set; }
        public Guid IdLinha { get; set; }
        public double latitude { get; set; }
        public double longitude { get; set; }
        public string NomeParagem { get; set; }
    }
}