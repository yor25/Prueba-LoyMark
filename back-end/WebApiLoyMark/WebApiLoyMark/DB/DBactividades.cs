using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApiLoyMark.Modelos;

namespace WebApiLoyMark.DB
{
    public class DBactividades
    {
        public static bool ACreate(Actividad DActividad)
        {
            using (SqlConnection dConexion = new SqlConnection(DbConexion.S_Conexion))
            {
                SqlCommand cmd = new SqlCommand("create_a", dConexion);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@create_date", DActividad.create_date);
                cmd.Parameters.AddWithValue("@id_usuario", DActividad.id_usuario);
                cmd.Parameters.AddWithValue("@actividad", DActividad.actividad);
                try
                {
                    dConexion.Open();
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }
            }

        }

        public static List<Actividad> ARead()
        {

            List<Actividad> LActividades = new List<Actividad>();

            using (SqlConnection bConexion = new SqlConnection(DbConexion.S_Conexion))
            {
                SqlCommand cmd = new SqlCommand("READ_ACTIVIDAD", bConexion);

                cmd.CommandType = System.Data.CommandType.StoredProcedure;


                try
                {
                    bConexion.Open();
                    //  cmd.ExecuteNonQuery();

                    using (SqlDataReader sread = cmd.ExecuteReader())
                    {
                        while (sread.Read())
                        {
                            LActividades.Add(new Actividad()
                            {
                           //     id = Convert.ToInt32(sread["id_actividad"]),
                                create_date = Convert.ToDateTime(sread["create_date"]),
                                id_usuario = Convert.ToString(sread["nombreU"]),
                                actividad = sread["actividad"].ToString()

                            });
                        }

                    }
                    return LActividades;
                }
                catch (Exception e)
                {
                    return LActividades;
                    ;
                }
            }


        }
    }
}