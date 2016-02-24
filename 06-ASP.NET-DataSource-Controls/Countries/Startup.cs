using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Countries.Startup))]
namespace Countries
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
