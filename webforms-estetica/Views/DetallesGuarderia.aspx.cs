using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webforms_estetica.Classes;

namespace webforms_estetica.Views
{
    public partial class DetallesGuarderia : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["AdminMode"] != null)
                this.MasterPageFile = "~/Views/Admin.Master";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID_guard"] == null)
                if(Globals.Role.Equals("Admin"))
                    Response.Redirect("~/Views/AdminGuarderia.aspx", true);
                else if(Globals.Role.Equals("Cliente"))
                    Response.Redirect("~/Views/HistorialGuarderia.aspx", true);

            if (!IsPostBack)
            {
                
                LoadGenData();
                BindReports();
            }
        }

        protected void LoadGenData()
        {
            string idGuard = Session["ID_guard"].ToString();
            string qGetEstancia = $@"SELECT  
            (us.Nombre + ' ' + us.Apellido) AS Nombre_cliente, 
            Nombre_mascota,
            CONVERT(VARCHAR(10), Fecha_inicio, 103) AS Fecha_inicio,
            CONVERT(VARCHAR(10), Fecha_fin, 103) AS Fecha_fin,
            Estado
            FROM Guarderia AS gu
            JOIN Usuario AS us 
            ON gu.FK_Cliente = us.ID
            WHERE ID_estancia = {idGuard}";

            Query q = new Query();
            q.FetchData(qGetEstancia);

            DataRow row = Globals.FoundTable.Rows[0];

            litPetName.Text = row["Nombre_mascota"].ToString();
            litOwnerName.Text = row["Nombre_cliente"].ToString();
            litStartDate.Text = row["Fecha_inicio"].ToString();
            litEndDate.Text = row["Fecha_fin"].ToString();
            litState.Text = row["Estado"].ToString();
        }

        protected void BindReports()
        {
            string idGuard = Session["ID_guard"].ToString();
            string qGetEstancias = $@"SELECT 
            CONVERT(VARCHAR(10), Fecha_reporte, 103) AS Fecha_reporte,
            Notas,
            (us.Nombre + ' ' + us.Apellido) AS Nombre_empleado
            FROM Reporte_guarderia AS gu
            JOIN Usuario AS us
            ON gu.FK_empleado = us.ID
            WHERE FK_Guarderia = {idGuard}";

            Query q = new Query();
            q.FetchData(qGetEstancias);

            if (Globals.FoundTable == null || Globals.FoundTable.Rows.Count < 1)
            {
                promptMessage.Text = "Aún no se han llenado reportes para este servicio de guardería";
                return;
            }

            rptReportes.DataSource = Globals.FoundTable;
            rptReportes.DataBind();
        }
    }
}