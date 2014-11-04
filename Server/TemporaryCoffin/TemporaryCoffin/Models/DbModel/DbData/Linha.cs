using System;

namespace TemporaryCoffin.Models.DbModel.DbData
{
    /// <summary>
    /// 
    /// </summary>
    public class Linha
    {
        public Guid ID { get; set; }
        public string NomeLinha { get; set; }
        public double LatInicio { get; set; }
        public double LongInicio { get; set; }
        public double LatFim { get; set; }
        public double LongFim { get; set; }
    }
}