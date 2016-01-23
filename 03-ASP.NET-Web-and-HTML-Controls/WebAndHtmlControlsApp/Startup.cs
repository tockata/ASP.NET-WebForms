using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebAndHtmlControlsApp.Startup))]
namespace WebAndHtmlControlsApp
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
