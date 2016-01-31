using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Data_Binding_App.Startup))]
namespace Data_Binding_App
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
