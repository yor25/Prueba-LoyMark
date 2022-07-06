using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApiLoyMark.Modelos;

namespace WebApiLoyMark.Controllers
{
    public class ValuesController : ApiController
    {
        // GET api/values
        public List<Usuarios> Get()
        {
            return DB.DbUsuarios.URead();
        }

        // METODO GET ACTIVIDADES
        [HttpGet]
        [Route("api/values/GetActividades")]
        public List<Actividad> GetActividad()
        {
            return DB.DBactividades.ARead();
        }

        // POST api/values
        public bool Post([FromBody] Usuarios Ousuario)
        {
            return DB.DbUsuarios.UCreate(Ousuario);
        }

        // PUT api/values/5
        public bool Put([FromBody] Usuarios Ousuario)
        {
            return DB.DbUsuarios.UCpdate(Ousuario);
        }


        // DELETE api/values/5
        public bool Delete(int id)
        {
            Usuarios OUsuarios = new Usuarios();
            OUsuarios.id = id;
            return DB.DbUsuarios.UDelete(OUsuarios);
        }
    }
}
