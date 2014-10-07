using System;

namespace TemporaryCoffin.Models.DbModel.DbData
{
    /// <summary>
    /// 
    /// </summary>
    public class Utilizador
    {
        public Guid IdUtilizador { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public Guid ApiKey { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime? UltimoAccesso { get; set; }
    }
}