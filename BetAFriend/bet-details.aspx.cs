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
    public partial class bet_details : System.Web.UI.Page
    {
        const string bazaConnString = "Server=mysql.lrk.si; Port=3306; Database=artac_blaz_b3; User Id=artac_blaz; password=zatlok; Persist Security Info=True;";
        protected void Page_Load(object sender, EventArgs e)
        {
            String betId = "";
            if (Request.QueryString["betid"] != null)
            {
                betId = Request.QueryString["betid"];

                MySqlConnection bazaPovezava = new MySqlConnection(bazaConnString);
                try
                {
                    bazaPovezava.Open();
                    Debug.Print("povezava na bazo uspesno odprta");
                    String SQLcommand = String.Format("SELECT * FROM bets where id_bets='{0}'", betId);
                    MySqlCommand bazaUkaz = new MySqlCommand(SQLcommand, bazaPovezava);
                    MySqlDataReader reader = bazaUkaz.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            betName.Text = reader.GetString("name");
                            betDesc.Text = reader.GetString("description");
                            betStart.Text = reader.GetString("start_time");
                            betEnd.Text = reader.GetString("end_time");
                            betReward.Text = reader.GetString("reward");
                            //String str = "ja" + reader.GetInt32(0);
                            //Debug.Print("bet name: "+username);
                        }
                    }
                }
                catch (Exception exc)
                {
                    Debug.Print(exc.StackTrace.ToString());
                    Debug.Print("Prišlo je do napake pri pisanju v bazo.");
                }
                finally
                {
                    bazaPovezava.Close();
                }
            }
        }
    }
}