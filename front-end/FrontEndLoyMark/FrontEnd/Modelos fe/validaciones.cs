using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace FrontEnd.Modelos_fe
{
    public class validaciones
    {

        public string validar(string nombre, string apellido, string correo, ref string telefono)
        {
            Regex texto = new Regex(@"([0-9])+");//([a-zA-Z])\w+
            Regex texto2 = new Regex(@"([a-zA-Z])\w+");
            Regex email = new Regex(@"\w+([-+.’]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
            bool nombreV = texto.IsMatch(nombre);
            bool apellidoV = texto.IsMatch(apellido);
            bool emailV = email.IsMatch(correo);
            bool telefonoV = texto.IsMatch(telefono);
            if (!telefonoV)
            {
                telefono = "";
            }
            

            if (nombreV)
            {
                return "Solo se permiten letras en el nombre sin espacios";
            }
            else if (apellidoV)
            {
                return "Solo se permiten letras en el primer apellido";
            }
            else if (!emailV)
            {
                return "Correo mal escrito";
            }
            else
            {
                return "exito";
            }
        }
    }
}