using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TempCoffinDumbProjector.Model
{
   public class Paragens
    {
        public Guid ID { get; set; }
        public Guid IdLinha { get; set; }
        public double latitude { get; set; }
        public double longitude { get; set; }
        public string NomeParagem { get; set; }
    }
}
