using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webforms_estetica.Classes;

namespace webforms_estetica.Views
{
    public partial class RecibirGuarderia : System.Web.UI.Page
    {
        string fecha_fin = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadDaycareData();
            }
        }

        protected void LoadDaycareData()
        {
            string idGuard = Session["ID_guard"].ToString();
            string qGetEstancia = $@"SELECT  
            (us.Nombre + ' ' + us.Apellido) AS Nombre_cliente, 
            Nombre_mascota,
            CONVERT(VARCHAR(10), Fecha_inicio, 103) AS Fecha_inicio,
            CONVERT(VARCHAR(10), Fecha_fin, 103) AS Fecha_fin
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
            fecha_fin = row["Fecha_fin"].ToString();

            if(!IsTodayAllowed())
                divBtnRecibir.Visible = false;
        }

        protected bool IsTodayAllowed()
        {
            DateTime fechaIni = Convert.ToDateTime(litStartDate.Text);
            DateTime fechaFin = Convert.ToDateTime(fecha_fin);

            if (DateTime.Today < fechaIni || DateTime.Today > fechaFin)
            {
                promptMessage.Text = "El día de hoy no está dentro de la fecha para recibir a la mascota";
                return false;
            }
            return true;
        }

        protected void BtnRecibirMascota_Click(object sender, EventArgs e)
        {
            string idGuard = Session["ID_guard"].ToString();

            string qUpdateGuard = @"UPDATE Guarderia SET Estado = @state WHERE ID_estancia = @id";

            SqlConnection conn = new SqlConnection(Globals.cnnString);

            try
            {
                conn.Open();
                SqlTransaction trans41 = conn.BeginTransaction();

                SqlCommand updateCMD = new SqlCommand(qUpdateGuard, conn)
                {
                    Transaction = trans41
                };

                updateCMD.Parameters.AddWithValue("@state", "En curso");
                updateCMD.Parameters.AddWithValue("@id", idGuard);

                try
                {
                    updateCMD.ExecuteNonQuery();
                    trans41.Commit();
                }
                catch (Exception ex)
                {
                    trans41.Rollback();
                    Console.WriteLine(ex.Message);
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                Response.Redirect("AtenderGuarderia.aspx", true);
            }
        }
    }
}