using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webforms_estetica.Classes;

namespace webforms_estetica.Views
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(logUname.Text) || string.IsNullOrEmpty(logPass.Text))
                return;
            string uName = logUname.Text, pass = logPass.Text, redirectPage = string.Empty;

            string qLogIn = $@"SELECT * FROM Usuario
                WHERE Correo = '{uName}'";
            Query q = new Query();
            q.FetchData(qLogIn);

            if (Globals.FoundTable.Rows.Count < 1)
            {
                promptMessage.Text = "Error, el usuario no está registrado en la aplicación";
                return;
            }
                
            string dePass = Globals.FoundTable.Rows[0]["Contrasena"].ToString();
            dePass = Encrypter.Decrypt(dePass);

            if(logPass.Text == dePass)
            {
                Globals.UserID = Convert.ToInt32(Globals.FoundTable.Rows[0]["ID"]);
                Globals.UserName = logUname.Text;
                Globals.Role = Globals.FoundTable.Rows[0]["Privilegios"].ToString();

                redirectPage = DetermineUserPage(Globals.Role);
                Response.Redirect(redirectPage, true);
            }
            else
            { promptMessage.Text = "Error, credenciales incorrectas"; }
        }

        protected string DetermineUserPage(string permissions)
        {
            string defaultPage = string.Empty;
            switch(permissions)
            {
                case "Cliente": 
;                   defaultPage = "~/Views/AgendarCita.aspx";
                    break;
                case "Empleado":
                    defaultPage = "~/Views/AtenderCitas.aspx";
                    break;
                case "Admin":
                    defaultPage = "~/Views/AdminCitas.aspx";
                    break;
            }

            return defaultPage;
        }
    }
}