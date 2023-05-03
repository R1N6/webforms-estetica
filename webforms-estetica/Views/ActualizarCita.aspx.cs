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
    public partial class ActualizarCita : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID_corte"] == null)
                Response.Redirect("~/Views/AtenderCitas.aspx", true);
        }

        protected void BtnUpdateCita_Click(object sender, EventArgs e)
        {
            if (!chCorte.Checked && !chBanio.Checked && !chNails.Checked && !chCav.Checked)
                return;

            string idCorte = Session["ID_Corte"].ToString();
            string qInsertStatus = @"INSERT INTO Estatus (FK_Corte, Estatus) VALUES (@idCorte, @est)";
            string qUpdateCorte = @"UPDATE Corte SET Estado = 'Completado', IDTrabajador = @idEmpleado WHERE ID = @idCorte";

            SqlConnection conn = new SqlConnection(Globals.cnnString);
            try
            {
                conn.Open();
                SqlTransaction trans41 = conn.BeginTransaction();

                SqlCommand insertCMD = new SqlCommand(qInsertStatus, conn)
                {
                    Transaction = trans41
                };
                try
                {
                    if (chCorte.Checked)
                    {
                        insertCMD.Parameters.AddWithValue("@idCorte", idCorte);
                        insertCMD.Parameters.AddWithValue("@est", "Corte de pelo");
                        insertCMD.ExecuteNonQuery();
                        insertCMD.Parameters.Clear();
                    }

                    if (chBanio.Checked)
                    {
                        insertCMD.Parameters.AddWithValue("@idCorte", idCorte);
                        insertCMD.Parameters.AddWithValue("@est", "Baño");
                        insertCMD.ExecuteNonQuery();
                        insertCMD.Parameters.Clear();
                    }

                    if (chNails.Checked)
                    {
                        insertCMD.Parameters.AddWithValue("@idCorte", idCorte);
                        insertCMD.Parameters.AddWithValue("@est", "Corte de uñas");
                        insertCMD.ExecuteNonQuery();
                        insertCMD.Parameters.Clear();
                    }

                    if (chCav.Checked)
                    {
                        insertCMD.Parameters.AddWithValue("@idCorte", idCorte);
                        insertCMD.Parameters.AddWithValue("@est", "Limpieza de cavidades");
                        insertCMD.ExecuteNonQuery();
                        insertCMD.Parameters.Clear();
                    }

                    insertCMD.CommandText = qUpdateCorte;
                    insertCMD.Parameters.AddWithValue("@idEmpleado", Globals.UserID);
                    insertCMD.Parameters.AddWithValue("@idCorte", idCorte);
                    insertCMD.ExecuteNonQuery();

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
                Response.Redirect("~/Views/AtenderCitas.aspx", true);
            }


        }
    }
}