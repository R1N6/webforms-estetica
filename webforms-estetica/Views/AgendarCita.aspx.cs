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
    public partial class AgendarCita : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
            BindHorariosDisponibles();
        }

        protected void BindHorariosDisponibles()
        {
            string fecha = Convert.ToDateTime(txtDate.Text).ToString("yyyy-MM-dd");
            string qGetDisponibles = $@"SELECT ID_horario, 
                CONVERT(VARCHAR(5), Hora_horario) AS Horario FROM Horarios
                WHERE ID_horario NOT IN (SELECT Horario FROM Corte WHERE Fecha = '{fecha}')";
            Query selHorarios = new Query();
            selHorarios.FetchData(qGetDisponibles);

            ddlHorarios.DataSource = Globals.FoundTable;
            ddlHorarios.DataValueField= "ID_horario";
            ddlHorarios.DataTextField = "Horario";
            ddlHorarios.DataBind();
        }

        protected void BtnAgendarCita_Click(object sender, EventArgs e)
        {
            string fecha = Convert.ToDateTime(txtDate.Text).ToString("yyyy-MM-dd");
            string qInsertCita = @"INSERT INTO Corte (NombreMascota, Fecha, FK_Cliente, Horario, Estado) 
                VALUES (@nom, @fecha, @id_cliente, @id_horario, 'Pendiente')";

            SqlConnection conn = new SqlConnection(Globals.cnnString);
            try
            {
                conn.Open();
                SqlTransaction trans41 = conn.BeginTransaction();

                SqlCommand insertCMD = new SqlCommand(qInsertCita, conn)
                {
                    Transaction = trans41
                };

                insertCMD.Parameters.AddWithValue("@nom", txtPetName.Text);
                insertCMD.Parameters.AddWithValue("@fecha", fecha);
                insertCMD.Parameters.AddWithValue("@id_cliente", Globals.UserID);
                insertCMD.Parameters.AddWithValue("@id_horario", ddlHorarios.SelectedValue);
                try
                {
                    insertCMD.ExecuteNonQuery();
                    trans41.Commit();
                }
                catch (Exception ex)
                {
                    trans41.Rollback();
                    Console.WriteLine(ex.Message);
                }
            }
            catch (Exception ex) 
            {
                Console.WriteLine(ex.Message);
            }
            finally 
            { 
                conn.Close();
                conn.Dispose();
                Response.Redirect("~/Views/CitasAgendadas.aspx", true);
            }
        }
    }
}