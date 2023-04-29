using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webforms_estetica.Classes;

namespace webforms_estetica.Views
{
    public partial class AtenderGuarderia : System.Web.UI.Page
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

            string qSelectEstancias = $@"SELECT ID_estancia, 
            (us.Nombre + ' ' + us.Apellido) AS Nombre_cliente, 
            Nombre_mascota,
            CONVERT(VARCHAR(10), Fecha_inicio, 103) AS Fecha_inicio, 
            CONVERT(VARCHAR(10), Fecha_fin, 103) AS Fecha_fin, 
            Estado
            FROM Guarderia AS gu
            JOIN Usuario AS us 
            ON gu.FK_Cliente = us.ID
            WHERE gu.Estado IN ('Agendada', 'En curso')";
            Query q = new Query();

            q.FetchData(qSelectEstancias);

            if (Globals.FoundTable == null || Globals.FoundTable.Rows.Count < 1)
            {
                promptMessage.Text = "No hay estancias agendadas en la base de datos :(";
                return;
            }

            rptEstancias.DataSource = Globals.FoundTable;
            rptEstancias.DataBind();
        }

        protected void rptEstancias_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Session["ID_guard"] = e.CommandArgument.ToString();
            Literal lit = (Literal)e.Item.FindControl("litEstado");
            if (lit.Text.Equals("Agendada"))
                Response.Redirect("RecibirGuarderia.aspx", true);
            else if (lit.Text.Equals("En curso"))
                Response.Redirect("ReporteGuarderia.aspx", true);
        }
    }
}