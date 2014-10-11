using System.Data.Entity;

namespace TemporaryCoffin.Models.DbModel
{
    /// <summary>
    /// 
    /// </summary>
    public class TemporaryCoffinDbInitializer : IDatabaseInitializer<TemporaryCoffinModel>
    {
        public void InitializeDatabase(TemporaryCoffinModel context)
        {
            if (!context.Database.Exists())
            {
                context.Database.Create();
            }
        }

        
    }
}