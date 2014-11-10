
namespace TemporaryCoffin.Models.ValueObject
{
    /// <summary>
    /// Value Object para conter os dados de coordenadas
    /// </summary>
    public class CoordinatesVo
    {
        public string ID { get; set; }
        public double LatPos { get; set; }
        public double LongPos { get; set; }
        public string NomeParagem { get; set; }
    }
}
