using System;

namespace TemporaryCoffin.Models.DbModel.DbData
{
    public class UserRequestInfo
    {
        public Guid Id { get; set; }
        public Guid IdLinha { get; set; }
        public DateTime? DataHoraPedido { get; set; }
        public double LongitudeUser { get; set; }
        public double LatitudeUser { get; set; }
    }
}