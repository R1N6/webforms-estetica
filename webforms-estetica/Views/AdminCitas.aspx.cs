using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using webforms_estetica.Classes;

namespace webforms_estetica.Views
{
    public partial class AdminCitas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindCitas();
        }

        protected void BindCitas()
        {
            string qSelectCitas = $@"SELECT 
                NombreMascota, 
                CONVERT(VARCHAR(10), Fecha, 103)  AS FechaCorte,
                co.ID AS IdCorte, 
                co.Estado,
                CASE
                    WHEN IDTrabajador IS NULL THEN 'No hay un trabajador asignado aún.'
                    WHEN IDTrabajador IS NOT NULL THEN us.Nombre + ' ' + us.Apellido
                END AS NomEmpleado
                FROM Corte AS co
                LEFT JOIN Usuario AS us 
                ON co.IDTrabajador = us.ID";

            Query q = new Query();
            q.FetchData(qSelectCitas);

            if (Globals.FoundTable == null || Globals.FoundTable.Rows.Count < 1)
            {
                promptMessage.Text = "No hay servicios registrados en la base de datos :(";
                return;
            }


            DataTable dtCitas = Globals.FoundTable.Copy();
            rptHistorial.DataSource = dtCitas;
            rptHistorial.DataBind();
        }

        protected void rptHistorial_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            HtmlGenericControl lEstatus = (HtmlGenericControl)e.Item.FindControl("listEstatus");
            HiddenField hdnId = (HiddenField)e.Item.FindControl("hdnId");
            HiddenField hdnSt = (HiddenField)e.Item.FindControl("hdnState");
            Repeater rp = (Repeater)lEstatus.FindControl("rptEstatus");

            if (!hdnSt.Value.Equals("Pendiente"))
            {
                string qGetEstatus = $@"SELECT Estatus FROM dbo.Estatus WHERE FK_Corte = {hdnId.Value}";
                Query q = new Query();
                q.FetchData(qGetEstatus);

                rp.DataSource = Globals.FoundTable;
                rp.DataBind();
            }
        }
    }
}