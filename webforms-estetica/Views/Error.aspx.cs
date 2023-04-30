using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using webforms_estetica.Classes;

namespace webforms_estetica.Views
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LogOut();
            Exception ex = (Exception)Session["Exception"];
            typePrompt.Text =$"Tipo de error: {ex.GetType().ToString()}";
            messagePrompt.Text = $"Mensaje de error: {ex.Message}";

        }

        protected void LogOut()
        {
            Globals.UserID = 0;
            Globals.UserName = string.Empty;
            Globals.Role = string.Empty;
            FormsAuthentication.SignOut();
        }

    }
}