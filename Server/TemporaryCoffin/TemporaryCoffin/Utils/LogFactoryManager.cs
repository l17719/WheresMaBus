using System;
using System.Diagnostics;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Logging;
namespace TemporaryCoffin.Utils
{
    /// <summary>
    /// 
    /// </summary>
    public class LogFactoryManager
    {
        #region ClassVars

        private static LogFactoryManager _instance;
        private static LogWriterFactory _logFactory;

        private static IConfigurationSource _configurationSource;
        private LogEntry _logEntry;

        #endregion

        #region Ctor

        private LogFactoryManager()
        {
        }

        #region DeclaracaoSingleton
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static LogFactoryManager GetInstance()
        {
            return _instance ?? (_instance = new LogFactoryManager());
        }
        #endregion
        #endregion

        #region Metodos

        /// <summary>
        ///     metodos para escrever no logfile
        /// </summary>
        public void InitializeLog()
        {
            _configurationSource = ConfigurationSourceFactory.Create();
            _logFactory = new LogWriterFactory(_configurationSource);
            Logger.SetLogWriter(new LogWriterFactory().Create());
        }

        /// <summary>
        /// escrita de warning
        /// </summary>
        /// <param name="valueId"></param>
        /// <param name="valueMessage"></param>
        public void WriteWarning(int valueId, string valueMessage)
        {
            // instacia uma nova classe
            _logEntry = new LogEntry
            {
                Title = "TCoffin Warning",
                EventId = valueId,
                Message = valueMessage,
                Priority = 1,
                Severity = TraceEventType.Warning,
                MachineName = Environment.MachineName
            };
            // adiciona a categoria
            _logEntry.Categories.Add("Warning");

            // escreve a entrada no log
            Logger.Write(_logEntry);
            //
        }

        /// <summary>
        /// escrita de info
        /// </summary>
        /// <param name="valueId"></param>
        /// <param name="valueMessage"></param>
        public void WriteInfo(int valueId, string valueMessage)
        {
            // instacia uma nova classe
            _logEntry = new LogEntry
            {
                Title = "TCoffin  Info",
                EventId = valueId,
                Message = valueMessage,
                Priority = 1,
                Severity = TraceEventType.Information,
                MachineName = Environment.MachineName

            };
            // adiciona a categoria
            _logEntry.Categories.Add("WriteInfo");

            // escreve a entrada no log

            Logger.Write(_logEntry);
        }

        /// <summary>
        /// escrita de erro
        /// </summary>
        /// <param name="valueId"></param>
        /// <param name="valueMessage"></param>
        public void WriteError(int valueId, string valueMessage)
        {
            // instacia uma nova classe
            _logEntry = new LogEntry
            {
                Title = "TCoffin  Service Error",
                EventId = valueId,
                Message = valueMessage,
                Priority = -1,
                Severity = TraceEventType.Error,
                MachineName = Environment.MachineName,
            };
            // adiciona uma categoria
            _logEntry.Categories.Add("Error");
            //
            //escreve a entrada
            Logger.Write(_logEntry);
            //

        }

        #endregion
    }
}