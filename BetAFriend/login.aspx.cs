using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Diagnostics;
using System.Net;
using System.IO;

namespace BetAFriend
{
    public partial class login : System.Web.UI.Page
    {
        const string bazaConnString = "Server=mysql.lrk.si; Port=3306; Database=artac_blaz_b3; User Id=artac_blaz; password=zatlok; Persist Security Info=True;";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void loginHandler(object src, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                MySqlConnection bazaPovezava = new MySqlConnection(bazaConnString);
                try
                {
                    bazaPovezava.Open();
                    Debug.Print("povezava na bazo uspesno odprta");
                    String SQLcommand = string.Format("SELECT * FROM user WHERE username='{0}' AND password='{1}';", loginName.Text, loginPwd.Text);
                    MySqlCommand bazaUkaz = new MySqlCommand(SQLcommand, bazaPovezava);
                    MySqlDataReader reader = bazaUkaz.ExecuteReader();
                    if (reader.HasRows)
                    {
                        Response.Cookies["UserCookie"]["User"] = loginName.Text;
                        Response.Cookies["UserCookie"].Expires = DateTime.Now.AddDays(1d);
                        Response.Redirect("Default.aspx?login=1");
                    }
                    else
                    {
                        errLoginLabel.Text = "Username or password doesn't exist. Please try again.";
                        //Response.Redirect("error-login.aspx");
                    }

                }
                catch (Exception exc)
                {
                    Debug.Print(exc.StackTrace.ToString());
                    Debug.Print("Prišlo je do napake pri branju baze.");
                }
                finally
                {
                    bazaPovezava.Close();
                }
            }
        }
    }
}