
using System.Collections.Generic;

namespace TemporaryCoffin.Models.ValueObject
{
    /// <summary>
    /// 
    /// </summary>
    public class DataResponseVo
    {
        public string ResponseMessage { get; set; }
        public double TimeAvg { get; set; }
        public List<CoordinatesVo> ListaPontos { get; set; }  
    }
}