using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace webforms_estetica.Classes
{
    public class Globals
    {
        public static string cnnString
        {
            get { return (string)HttpContext.Current.Session["cnnString"]; }
            set { HttpContext.Current.Session["cnnString"] = value; }
        }

        public static DataSet dSet
        {
            get { return (DataSet)HttpContext.Current.Session["dSet"]; }
            set { HttpContext.Current.Session["dSet"] = value; }
        }

        public static int UserID
        {
            get { return (int)HttpContext.Current.Session["UserID"]; }
            set { HttpContext.Current.Session["UserID"] = value; }
        }

        public static string Role
        {
            get { return (string)HttpContext.Current.Session["Role"]; }
            set { HttpContext.Current.Session["Role"] = value; }
        }

        public static string UserName
        {
            get { return (string)HttpContext.Current.Session["UserName"]; }
            set { HttpContext.Current.Session["UserName"] = value; }
        }
    }
}