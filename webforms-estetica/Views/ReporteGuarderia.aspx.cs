﻿using System;
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
    public partial class ReporteGuarderia : System.Web.UI.Page
    {
        private string idGuard = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID_guard"] == null)
                Response.Redirect("~/Views/AtenderGuarderia.aspx", true);

            if(!IsPostBack)
                ManageControls();

        }

        protected bool CheckReportExistence()
        {
            idGuard = Session["ID_guard"].ToString();
            string fechaHoy = DateTime.Now.ToString("yyyy-MM-dd");
            string qGetReportes = $@"SELECT Fecha_reporte 
            FROM Reporte_guarderia
            WHERE FK_Guarderia = {idGuard}
            AND Fecha_reporte = '{fechaHoy}'";

            Query q = new Query();
            q.FetchData(qGetReportes);

            if (Globals.FoundTable.Rows.Count > 0)
            {
                promptMessage.Text = "Ya se llenó un reporte de estancia por el día de hoy";
                return true;
            }
             
            else
                return false;
        }

        protected void ManageControls()
        {
            idGuard = Session["ID_guard"].ToString();
            string fechaHoy = DateTime.Now.ToString("dd/MM/yyyy");
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
            litEndDate.Text = row["Fecha_fin"].ToString();

            if (CheckReportExistence())
                return;

            if (!IsTodayAllowed())
                return;

            if (fechaHoy.Equals(litEndDate.Text))
            {
                divFinish.Visible = true;
            }
            else
            {
                divOnCourse.Visible = true;
                divNotes.Visible = true;
            }
                

        }

        protected bool IsTodayAllowed()
        {
            DateTime fechaIni = Convert.ToDateTime(litStartDate.Text);
            DateTime fechaFin = Convert.ToDateTime(litEndDate.Text);

            if(DateTime.Today < fechaIni || DateTime.Today > fechaFin)
            {
                promptMessage.Text = "El día de hoy no está dentro de la fecha para generar reportes";
                return false;
            }
            return true;
        }

        protected void BtnLiberarMascota_Click(object sender, EventArgs e)
        {
            idGuard = Session["ID_guard"].ToString();
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

                updateCMD.Parameters.AddWithValue("@state", "Finalizada");
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
            catch (Exception ex)
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

        protected void BtnInsertarReporte_Click(object sender, EventArgs e)
        {
            idGuard = Session["ID_guard"].ToString();
            string fechaHoy = DateTime.Now.ToString("yyyy-MM-dd");
            string qInsertReporte = @"INSERT INTO Reporte_guarderia
                (FK_guarderia, FK_Empleado, Fecha_reporte, Notas)
                VALUES (@fk_g, @fk_e, @fecha, @notes)";

            SqlConnection conn = new SqlConnection(Globals.cnnString);
            try
            {
                conn.Open();
                SqlTransaction trans41 = conn.BeginTransaction();

                SqlCommand insertCMD = new SqlCommand(qInsertReporte, conn)
                {
                    Transaction = trans41
                };

                try
                {
                    insertCMD.Parameters.AddWithValue("@fk_g", idGuard);
                    insertCMD.Parameters.AddWithValue("@fk_e", Globals.UserID);
                    insertCMD.Parameters.AddWithValue("@fecha", fechaHoy);
                    insertCMD.Parameters.AddWithValue("@notes", txtNotes.Text);

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
                Response.Redirect("AtenderGuarderia.aspx", true);
            }
        }
    }
}