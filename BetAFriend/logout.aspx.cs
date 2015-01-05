using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace BetAFriend
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["UserCookie"] != null)
            {
                Response.Cookies["UserCookie"].Expires = DateTime.Now.AddDays(-1);
                if (Request.Cookies["UserCookie"] != null)
                {
                    Debug.Print("ni zbrisan");
                }
                else
                {
                    Debug.Print("je zbrisan");
                }
            }
        }
    }
}