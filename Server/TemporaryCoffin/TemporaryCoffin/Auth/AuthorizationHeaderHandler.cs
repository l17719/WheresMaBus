using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using TemporaryCoffin.Utils;

namespace TemporaryCoffin.Auth
{
    public class AuthorizationHeaderHandler:DelegatingHandler
    {
        #region Classvars

        private static readonly Utilities Instance = Utilities.GetInstance();
        #endregion
        #region metodos
        protected override Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
        {


            //var key = HttpUtility.ParseQueryString(request.RequestUri.Query).Get("apiKey");

            IEnumerable<string> apikeyValues;
            if (!request.Headers.TryGetValues("X-ApiKey", out apikeyValues))
                return SendError("A chave nao e valida",
                    HttpStatusCode.Forbidden);
            var key = apikeyValues.First();


            if (string.IsNullOrWhiteSpace(key))
            {
                return SendError("Nao e possivel aceder ao servico sem uma chave autenticacao valida",
                    HttpStatusCode.Forbidden);
            }

            var tmpTask = Task.Run(() => Instance.IsUserValid(key), cancellationToken);

            if (tmpTask.Result)
            {
                return base.SendAsync(request, cancellationToken);
            }




            //if (key == "4D7A0A5C-19FA-4A8A-8C47-DCC4BA1834AC")
            //{
            //    return base.SendAsync(request, cancellationToken);

            //}

            return SendError("A chave fornecida nao se encontra registada ou nao e valida",
                HttpStatusCode.Forbidden);
            //

            //if (string.IsNullOrWhiteSpace(key))
            //{
            //    return SendError("Nao e possivel aceder ao servico sem uma chave autenticacao valida",
            //        HttpStatusCode.Forbidden);
            //}
            // test code to delete




            //var tmpTask = Task.Run(() => Instance.IsUserValid(key), cancellationToken);

            //if (tmpTask.Result)
            //{
            //    return base.SendAsync(request, cancellationToken);
            //}
        }


        private static Task<HttpResponseMessage> SendError(string valueError, HttpStatusCode valueCode)
        {
            var respone = new HttpResponseMessage { Content = new StringContent(valueError), StatusCode = valueCode };

            return Task<HttpResponseMessage>.Factory.StartNew(() => respone);
        }
        #endregion
    }
}