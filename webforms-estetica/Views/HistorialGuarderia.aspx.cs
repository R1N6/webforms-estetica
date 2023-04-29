using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webforms_estetica.Classes;

namespace webforms_estetica.Views
{
    public partial class HistorialGuarderia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindEstancias();    
            }
        }

        protected void BindEstancias()
        {
           string qGetEstancias = $@"SELECT ID_estancia, 
            Nombre_mascota,
            CONVERT(VARCHAR(10), Fecha_inicio, 103) AS Fecha_inicio, 
            CONVERT(VARCHAR(10), Fecha_fin, 103) AS Fecha_fin, 
            Estado,
            CASE
            WHEN Estado = 'Agendada' THEN 'text-bg-warning'
            WHEN Estado = 'En curso' THEN 'text-bg-primary'
            WHEN Estado = 'Finalizada' THEN 'text-bg-success'
            END AS Color_class
            FROM Guarderia
            WHERE FK_Cliente = {Globals.UserID}";

            Query q = new Query();
            q.FetchData(qGetEstancias);

            if (Globals.FoundTable == null || Globals.FoundTable.Rows.Count < 1)
            {
                promptMessage.Text = "No has agendado ningún servicio de guardería hasta ahora :(";
                return;
            }

            rptGuardLinks.DataSource = Globals.FoundTable;
            rptGuardLinks.DataBind();
        }

        protected void rptGuardLinks_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}