﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiLoyMark.Modelos
{
    public class Actividad
    {
        public int id { get; set; }
        public DateTime create_date { get; set; }
        public string id_usuario { get; set; }
        public string actividad { get; set; }
    }
}