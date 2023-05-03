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
    public partial class AdminEmpleados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                BindGvEmpleados();
        }

        protected void BindGvEmpleados()
        {
            string qGetEmpleados = $@"SELECT ID AS ID_usuario, Nombre, Apellido, Correo 
                FROM Usuario WHERE Privilegios = 'Empleado'";

            Query q = new Query();
            q.FetchData(qGetEmpleados);

            if (Globals.FoundTable == null || Globals.FoundTable.Rows.Count < 1)
            {
                promptMessage.Text = "No hay empleados registrados para administrar :(";
                return;
            }

            gvEmpleados.DataSource = Globals.FoundTable;
            gvEmpleados.DataBind();
        }

        protected void gvEmpleados_RowEditing(object sender, GridViewEditEventArgs e)
        {
            promptMessage.Text = string.Empty;
            gvEmpleados.EditIndex = e.NewEditIndex;
            BindGvEmpleados();
        }

        protected void gvEmpleados_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            promptMessage.Text = string.Empty;
            GridViewRow gvRow = (GridViewRow)gvEmpleados.Rows[e.RowIndex];
            HiddenField hdn = (HiddenField)gvRow.FindControl("hdnEmpId");
            TextBox txtNombre = (TextBox)gvRow.Cells[1].Controls[0];
            TextBox txtApellido = (TextBox)gvRow.Cells[2].Controls[0];
            TextBox txtCorreo = (TextBox)gvRow.Cells[3].Controls[0];


            string qUpdateEmployee = "UPDATE Usuario SET Nombre = @nom, Apellido = @ap, Correo = @co WHERE ID = @id";

            SqlConnection conn = new SqlConnection(Globals.cnnString);
            try
            {
                conn.Open();

                SqlTransaction trans41 = conn.BeginTransaction();

                SqlCommand insertCMD = new SqlCommand(qUpdateEmployee, conn)
                {
                    Transaction = trans41
                };

                insertCMD.Parameters.AddWithValue("@nom", txtNombre.Text);
                insertCMD.Parameters.AddWithValue("@ap", txtApellido.Text);
                insertCMD.Parameters.AddWithValue("@co", txtCorreo.Text);
                insertCMD.Parameters.AddWithValue("@id", hdn.Value);

                try
                {
                    insertCMD.ExecuteNonQuery();
                    trans41.Commit();
                    promptMessage.Text = "Empleado actualizado exitosamente :D";
                }
                catch (Exception ex)
                {
                    trans41.Rollback();
                    promptMessage.Text = "Ocurrió un error al actualizar la fila del empleado :(";
                    Console.WriteLine(ex.Message);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally 
            {
                gvEmpleados.EditIndex = -1;
                BindGvEmpleados();
                conn.Dispose();
                conn.Close(); 
            }
        }

        protected void gvEmpleados_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEmpleados.EditIndex = -1;
            BindGvEmpleados();
        }

        protected void gvEmpleados_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            promptMessage.Text = string.Empty;
            GridViewRow gvRow = (GridViewRow)gvEmpleados.Rows[e.RowIndex];
            HiddenField hdn = (HiddenField)gvRow.FindControl("hdnEmpId");

            string qUpdateEmployee = "DELETE FROM Usuario WHERE ID = @id";

            SqlConnection conn = new SqlConnection(Globals.cnnString);
            try
            {
                conn.Open();

                SqlTransaction trans41 = conn.BeginTransaction();

                SqlCommand insertCMD = new SqlCommand(qUpdateEmployee, conn)
                {
                    Transaction = trans41
                };

                insertCMD.Parameters.AddWithValue("@id", hdn.Value);

                try
                {
                    insertCMD.ExecuteNonQuery();
                    trans41.Commit();
                    promptMessage.Text = "Empleado eliminado exitosamente.";
                }
                catch (Exception ex)
                {
                    trans41.Rollback();
                    promptMessage.Text = "Ocurrió un error al tratar de eliminar el registro de empleado.";
                    Console.WriteLine(ex.Message);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                gvEmpleados.EditIndex = -1;
                BindGvEmpleados();
                conn.Dispose();
                conn.Close();
            }
        }
    }
}