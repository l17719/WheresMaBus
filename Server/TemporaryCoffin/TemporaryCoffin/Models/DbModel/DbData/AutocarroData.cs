using System;

namespace TemporaryCoffin.Models.DbModel.DbData
{
    public class AutocarroData
    {
        public Guid Id { get; set; }
        public Guid IdAutocarro { get; set; }
        public double Longitude { get; set; }
        public double Latitude { get; set; }
       
        public DateTime? DataAcesso { get; set; }
    }
}