using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using webforms_estetica.Classes;

namespace webforms_estetica
{
    public partial class ClienteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Globals.UserName))
            {
                LogOut();
                return;
            }
        }

        protected void LogOut()
        {
            Globals.UserID = 0;
            Globals.UserName = string.Empty;
            Globals.Role = string.Empty;
            FormsAuthentication.SignOut();

            this.Page.Response.Redirect("~/LandingPage.aspx", true);
        }

        protected void BtnLogOut_Click(object sender, EventArgs e)
        {
            LogOut();
        }
    }
}