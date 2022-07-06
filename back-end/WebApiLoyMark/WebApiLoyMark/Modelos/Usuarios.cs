﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiLoyMark.Modelos
{
    public class Usuarios
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string correo { get; set; }
        public DateTime fecha_de_nacimiento { get; set; }
        public string telefono { get; set; }
        public string pais { get; set; }
        public int p_info { get; set; }
    }
}