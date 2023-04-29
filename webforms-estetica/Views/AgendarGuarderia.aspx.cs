using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webforms_estetica.Classes;

namespace webforms_estetica.Views
{
    public partial class AgendarGuarderia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAgendarGuard_Click(object sender, EventArgs e)
        {
            DateTime dateIni = Convert.ToDateTime(txtStartDate.Text);
            DateTime dateFin = Convert.ToDateTime(txtEndDate.Text);

            if(dateIni < DateTime.Today)
            {
                promptMessage.Text = "No puedes agendar una guardería para un día anterior a hoy";
                return;
            }
            else if((dateFin - dateIni).Days > 7)
            {
                promptMessage.Text = "El periodo de estancia no debe de superar los 7 días";
                return;
            }
            else if ((dateFin - dateIni).Days < 1)
            {
                promptMessage.Text = "El periodo de estancia debe de ser de al menos 1 día";
                return;
            }

            string fechaInicio = Convert.ToDateTime(txtStartDate.Text).ToString("yyyy-MM-dd");
            string fechaFin = Convert.ToDateTime(txtEndDate.Text).ToString("yyyy-MM-dd");

            string qInsertGuard = @"INSERT INTO Guarderia (FK_Cliente, Nombre_mascota, Fecha_inicio, Fecha_fin, Estado)
                VALUES (@userID, @petName, @sDate, @eDate, @state)";


            SqlConnection conn = new SqlConnection(Globals.cnnString);
            try
            {
                conn.Open();
                SqlTransaction trans41 = conn.BeginTransaction();

                SqlCommand insertCMD = new SqlCommand(qInsertGuard, conn)
                {
                    Transaction = trans41
                };

                try
                {
                    insertCMD.Parameters.AddWithValue("@userID", Globals.UserID);
                    insertCMD.Parameters.AddWithValue("@petName", txtPetName.Text);
                    insertCMD.Parameters.AddWithValue("@sDate", fechaInicio);
                    insertCMD.Parameters.AddWithValue("@eDate", fechaFin);
                    insertCMD.Parameters.AddWithValue("@state", "Agendada");

                    insertCMD.ExecuteNonQuery();
                    insertCMD.Parameters.Clear();

                    trans41.Commit();
                }
                catch(Exception ex)
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
                Response.Redirect("HistorialGuarderia.aspx", true);
            }
        }
    }
}