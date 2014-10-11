using System;

namespace TemporaryCoffin.Models.ValueObject
{
    /// <summary>
    /// 
    /// </summary>
    public class RequestVO
    {
        public string IdUtilizador { get; set; }
        public double Longitude { get; set; }
        public double Latitude { get; set; }
        public string DataHora { get; set; }

    }
}