using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webforms_estetica.Classes;

namespace webforms_estetica.Views
{
    public partial class AtenderCitas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindCitas();
            }
        }

        protected void BindCitas()
        {
            string qSelectCitas = $@"SELECT co.ID AS ID_Corte, 
                co.NombreMascota, 
                (us.Nombre + ' ' + us.Apellido) AS NombreCliente,
                CONVERT(VARCHAR(5), ho.Hora_horario) AS HoraCita
                FROM Corte AS co 
                JOIN Usuario AS us ON us.ID = co.FK_Cliente 
                JOIN Horarios AS ho ON ho.ID_horario = co.Horario
                WHERE co.Estado = 'Pendiente'
                AND Fecha = CONVERT(VARCHAR(10), GETDATE(), 126)";
            Query q = new Query();

            q.FetchData(qSelectCitas);

            if (Globals.FoundTable == null || Globals.FoundTable.Rows.Count < 1)
            {
                promptMessage.Text = "No hay citas agendadas para el día de hoy :(";
                return;
            }
                

            rptCitas.DataSource = Globals.FoundTable;
            rptCitas.DataBind();

        }

        protected void rptCitas_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Session["ID_Corte"] = e.CommandArgument.ToString();
            Response.Redirect("ActualizarCita.aspx", true);
        }
    }
}