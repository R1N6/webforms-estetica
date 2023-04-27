using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace webforms_estetica.Classes
{
    public static class Encrypter
    {
        public static String Encrypt(string Input)
        {
            if (Input != null)
            {
                Byte[] protecteddata;
                protecteddata = System.Text.Encoding.ASCII.GetBytes(Input);
                Input = Convert.ToBase64String(protecteddata);
            }
            else
            {
                Input = "";
            }
            return Input;
        }

        public static String Decrypt(String Input)
        {

            Byte[] protecteddata;

            if (Input != null)
            {
                protecteddata = Convert.FromBase64String(Input);

                Input = System.Text.Encoding.ASCII.GetString(protecteddata);
            }
            else
            {
                Input = "";
            }
            return Input;
        }
    }
}