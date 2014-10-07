using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TemporaryCoffin.Models.ValueObject
{
    /// <summary>
    /// 
    /// </summary>
    public class UtilizadorVo
    {
        public Guid IdUtilizador { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }

        public Guid ApiKey { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public DateTime? UltimoAccesso { get; set; }
    }
}