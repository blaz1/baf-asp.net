using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BetAFriend.Startup))]
namespace BetAFriend
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
