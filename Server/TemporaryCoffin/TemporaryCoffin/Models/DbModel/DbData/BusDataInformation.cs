using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TemporaryCoffin.Models.DbModel.DbData
{
    public class BusDataInformation
    {
        public Guid ID { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public DateTime DataHora { get; set; }
    }
}