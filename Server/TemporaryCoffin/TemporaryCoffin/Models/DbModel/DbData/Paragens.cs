using System;

namespace TemporaryCoffin.Models.DbModel.DbData
{
    /// <summary>
    /// 
    /// </summary>
    public class Paragens
    {
        /// <summary>
        /// 
        /// </summary>
        public Guid ID { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public Guid IdLinha { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public double latitude { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public double longitude { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string NomeParagem { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int Ordem { get; set; }
    }
}