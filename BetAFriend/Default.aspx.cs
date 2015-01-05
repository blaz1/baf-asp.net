using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Diagnostics;

namespace BetAFriend
{
    public partial class _Default : Page
    {
        const string bazaConnString = "Server=mysql.lrk.si; Port=3306; Database=artac_blaz_b3; User Id=artac_blaz; password=zatlok; Persist Security Info=True;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["UserCookie"] != null)
            {
                mainPageLinksToggle.Text = "<a href='create-bet.aspx'>Create</a><p>or</p><a class='floatRight' href='browse-bets.aspx'>Browse</a>";
            }
            else
            {
                mainPageLinksToggle.Text = "<a id='browseOnly' href='browse-bets.aspx'>Browse</a>";
            }
            Debug.Print("izvajamo pageload");
            MySqlConnection bazaPovezava = new MySqlConnection(bazaConnString);
            try
            {
                bazaPovezava.Open();
                Debug.Print("povezava na bazo uspesno odprta");
                //System.Response.Write("<h1>povezava na bazo uspesno odprta</h1>");
                string SQLcommand = "SELECT * FROM user;";
                MySqlCommand bazaUkaz = new MySqlCommand(SQLcommand, bazaPovezava);
                MySqlDataReader reader = bazaUkaz.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        String username = reader.GetString("username");
                        //String str = "ja" + reader.GetInt32(0);
                        Debug.Print(username);
                    }
                }

            }
            catch (Exception)
            {
                Debug.Print("Prišlo je do napake pri branju baze.");
            }
            finally
            {
                bazaPovezava.Close();
            }
        }
    }
}
