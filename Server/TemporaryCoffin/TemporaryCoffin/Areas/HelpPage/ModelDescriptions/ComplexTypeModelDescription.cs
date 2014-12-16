using System.Collections.ObjectModel;

namespace TemporaryCoffin.Areas.HelpPage.ModelDescriptions
{
    /// <summary>
    /// 
    /// </summary>
    public class ComplexTypeModelDescription : ModelDescription
    {
        /// <summary>
        /// 
        /// </summary>
        public ComplexTypeModelDescription()
        {
            Properties = new Collection<ParameterDescription>();
        }

        public Collection<ParameterDescription> Properties { get; private set; }
    }
}