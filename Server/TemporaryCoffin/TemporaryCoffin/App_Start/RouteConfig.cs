using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;

namespace TemporaryCoffin
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            //routes.MapHttpRoute("users", "api/users/{action}/{id}", new { controller = "Users", id = UrlParameter.Optional });
            //routes.MapHttpRoute("pedidos", "api/pedido/{id}", new { controller = "Pedidos", id = UrlParameter.Optional });
            routes.MapHttpRoute("BusData", "api/bdata/{action}/{id}", new { controller = "DadosBus", id = UrlParameter.Optional });

            routes.MapHttpRoute("echo", "api/echo/{id}", new { controller = "Echo", id = UrlParameter.Optional });
            routes.MapRoute("Default", "{controller}/{action}/{id}", new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
