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
    public partial class register : System.Web.UI.Page
    {
        protected TextBox regName;
        protected TextBox regMail;
        protected TextBox regPwd1;
        protected TextBox regPwd2;

        const string bazaConnString = "Server=mysql.lrk.si; Port=3306; Database=artac_blaz_b3; User Id=artac_blaz; password=zatlok; Persist Security Info=True;";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void registerHandler(object src, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                MySqlConnection bazaPovezava = new MySqlConnection(bazaConnString);
                String lastInsertedId = "";
                try
                {
                    bazaPovezava.Open();
                    Debug.Print("povezava na bazo uspesno odprta");
                    String creationDate = String.Format("{0:yyyy-MM-dd HH:mm:ss}", DateTime.Now);
                    string SQLcommand = string.Format("INSERT INTO artac_blaz_b3.user (username, email, password, creation_time) values ('{0}',' {1}', '{2}', '{3}')", regName.Text, regMail.Text, regPwd1.Text, creationDate);
                    Debug.Print(SQLcommand);
                    MySqlCommand bazaUkaz = new MySqlCommand(SQLcommand, bazaPovezava);
                    bazaUkaz.ExecuteNonQuery();
                    lastInsertedId += bazaUkaz.LastInsertedId;
                    String n = bazaUkaz.LastInsertedId.ToString();
                    Debug.Print(n);
                }
                catch (Exception exc)
                {
                    Debug.Print(exc.StackTrace.ToString());
                    Debug.Print("Prišlo je do napake pri pisanju v bazo.");
                }
                finally
                {
                    //Response.Redirect("login.aspx");
                    bazaPovezava.Close();
                }
            }
        }

        public void validatePasswordMatching(Object sender, ServerValidateEventArgs e)
        {
            String pwd1 = e.Value;
            String pwd2 = regPwd2.Text;
            if (pwd1.Equals(pwd2))
            {
                e.IsValid = true;
            }
            else
            {
                e.IsValid = false;
            }
        }
    }
}