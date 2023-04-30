using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace webforms_estetica.Classes
{
    public class Query
    {
        public void FetchData(string selectQuery)
        {
            SqlConnection Conn = new SqlConnection(Globals.cnnString);
            try
            {
                Globals.FoundTable.Clear(); 
                Conn.Open();
                SqlCommand selectCMD = new SqlCommand(selectQuery, Conn);
                selectCMD.CommandTimeout = 30;

                SqlDataAdapter DA = new SqlDataAdapter();
                DA.SelectCommand = selectCMD;
                DA.Fill(Globals.FoundTable);
            }
            catch(Exception ex) 
            {
                HttpContext.Current.Session["Exception"] = ex;
                HttpContext.Current.Response.Redirect("Error.aspx", true);
            }
            finally 
            { 
                Conn.Close();
                Conn.Dispose();
            }
        }
    }
}