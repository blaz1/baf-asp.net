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
    public partial class create_bet : System.Web.UI.Page
    {
        /*protected TextBox newFormName;
        protected TextBox newFormDesc;
        protected TextBox newFormStart;
        protected TextBox newFormEnd;
        protected TextBox newFormReward;
        protected Button createBetButton;
        protected Label izpis;*/

        const string bazaConnString = "Server=mysql.lrk.si; Port=3306; Database=artac_blaz_b3; User Id=artac_blaz; password=zatlok; Persist Security Info=True;";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void createBetHandler(object src, EventArgs e)
        {
            MySqlConnection bazaPovezava = new MySqlConnection(bazaConnString);
            String lastInsertedId = "";
            try
            {
                bazaPovezava.Open();
                Debug.Print("povezava na bazo uspesno odprta");
                String creationDate = String.Format("{0:yyyy-MM-dd HH:mm:ss}", DateTime.Now);
                //string SQLcommand = string.Format("INSERT INTO artac_blaz_b3.bets (name, description, create_time, start_time, end_time, reward, owner_id) values ({0}, {1}, {2}, {3}, {4}, {5}, {6}, 1)", newFormName.Text, newFormDesc.Text, creationDate.ToString(), newFormStart.Text, newFormEnd.Text, newFormReward.Text);
                string SQLcommand = string.Format("INSERT INTO artac_blaz_b3.bets (name, description, create_time, start_time, end_time, reward, owner_id) values ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '1')", newFormName.Text, newFormDesc.Text, creationDate.ToString(), newFormStart.Text, newFormEnd.Text, newFormReward.Text);
                Debug.Print(SQLcommand);
                //string SQLcommand1 = "INSERT INTO artac_blaz_b3.bets (name, description, create_time, start_time, end_time, reward, opponents, owner_id) values ('$betName', '$betDesc', '$create_time', '$betStart', '$betEnd', '$betReward', '$opponents', '$id_user')";
                MySqlCommand bazaUkaz = new MySqlCommand(SQLcommand, bazaPovezava);
                bazaUkaz.ExecuteNonQuery();
                lastInsertedId += bazaUkaz.LastInsertedId;
            }
            catch (Exception exc)
            {
                Debug.Print(exc.StackTrace.ToString());
                Debug.Print("Prišlo je do napake pri pisanju v bazo.");
            }
            finally
            {
                bazaPovezava.Close();
                String redirect = "bet-details.aspx?betid=" + lastInsertedId;
                Response.Redirect(redirect);
            }
        }

        public void addNewRule(object src, EventArgs e)
        {
            Label rule = new Label();
            Debug.Print(addRule.Text);
            rule.Text = addRule.Text;
            addRuleUpdatePanel.ContentTemplateContainer.Controls.Add(rule);
        }

        public void getRewards(Object src, EventArgs e)
        {
            String[] rewards = {"bluetooth speaker", "Iphone 6", "Audi A6", "Bicycle"};
            for (int i = 0; i < rewards.Length; i++) {
                Label r = new Label();
                r.CssClass = "rewardLabel";
                r.Text = rewards[i];
                RewardUpdatePanel.ContentTemplateContainer.Controls.Add(r);
            }
        }

       /* public void newFormDesc_ServerValidate(Object sender, ServerValidateEventArgs e)
        {
            //<asp:CustomValidator runat="server" ID="descValidator" ControlToValidate="newFormDesc" OnServerValidate="newFormDesc_ServerValidate" ErrorMessage="This has to be atleast 20 characters long!" />
            System.Diagnostics.Debug.Write("delaa");
            if (e.Value.Length >= 20)
            {
                e.IsValid = true;

            }
            else
                e.IsValid = false;
        }*/
    }
}