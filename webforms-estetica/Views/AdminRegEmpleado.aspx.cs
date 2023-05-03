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
    public partial class AdminRegEmpleado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string qInsertEmployee = "INSERT INTO Usuario VALUES (@name, @lName, @email, @pass, @role)";

            SqlConnection conn = new SqlConnection(Globals.cnnString);
            try
            {
                conn.Open();
                SqlTransaction trans41 = conn.BeginTransaction();

                SqlCommand insertCMD = new SqlCommand(qInsertEmployee, conn)
                {
                    Transaction = trans41
                };

                insertCMD.Parameters.AddWithValue("@name", regName.Text);
                insertCMD.Parameters.AddWithValue("@lName", regLastName.Text);
                insertCMD.Parameters.AddWithValue("@email", regEmail.Text);
                insertCMD.Parameters.AddWithValue("@pass", Encrypter.Encrypt(regPass.Text));
                insertCMD.Parameters.AddWithValue("@role", "Empleado");

                try
                {
                    insertCMD.ExecuteNonQuery();
                    trans41.Commit();
                    promptMessage.Text = "Empleado registrado exitosamente :D";
                }
                catch (Exception ex)
                {
                    trans41.Rollback();
                    promptMessage.Text = "Ocurrió un error al realizar el registro :(";
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
            }
        }
    }
}