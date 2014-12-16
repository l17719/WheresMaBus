using System;

namespace TemporaryCoffin.Models.DbModel.DbData
{
    /// <summary>
    /// 
    /// </summary>
    public class BusDataInformation
    {
        /// <summary>
        /// 
        /// </summary>
        public Guid ID { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public double Latitude { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public double Longitude { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public DateTime DataHora { get; set; }
    }
}