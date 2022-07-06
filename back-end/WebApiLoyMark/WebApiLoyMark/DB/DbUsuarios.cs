using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApiLoyMark.Modelos;

namespace WebApiLoyMark.DB
{
    public class DbUsuarios
    {
        public static bool UCreate(Usuarios dUsuario)
        {
            using (SqlConnection dConexion = new SqlConnection(DbConexion.S_Conexion))
            {
                SqlCommand cmd = new SqlCommand("create_u", dConexion);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@nombre", dUsuario.nombre);
                cmd.Parameters.AddWithValue("@apellido", dUsuario.apellido);
                cmd.Parameters.AddWithValue("@correo", dUsuario.correo);
                cmd.Parameters.AddWithValue("@fecha_de_nacimiento", dUsuario.fecha_de_nacimiento);
                cmd.Parameters.AddWithValue("@telefono", dUsuario.telefono);
                cmd.Parameters.AddWithValue("@pais", dUsuario.pais);
                cmd.Parameters.AddWithValue("p_info", dUsuario.p_info);


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


        public static bool UCpdate(Usuarios dUsuario)
        {
            using (SqlConnection dConexion = new SqlConnection(DbConexion.S_Conexion))
            {
                SqlCommand cmd = new SqlCommand("updated_u", dConexion);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", dUsuario.id);
                cmd.Parameters.AddWithValue("@nombre", dUsuario.nombre);
                cmd.Parameters.AddWithValue("@apellido", dUsuario.apellido);
                cmd.Parameters.AddWithValue("@correo", dUsuario.correo);
                cmd.Parameters.AddWithValue("@fecha_de_nacimiento", dUsuario.fecha_de_nacimiento);
                cmd.Parameters.AddWithValue("@telefono", dUsuario.telefono);
                cmd.Parameters.AddWithValue("@pais", dUsuario.pais);
                cmd.Parameters.AddWithValue("p_info", dUsuario.p_info);


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

        public static List<Usuarios> URead()
        {

            List<Usuarios> LUsuarios = new List<Usuarios>();

            using (SqlConnection bConexion = new SqlConnection(DbConexion.S_Conexion))
            {
                SqlCommand cmd = new SqlCommand("read_a", bConexion);

                cmd.CommandType = System.Data.CommandType.StoredProcedure;


                try
                {
                    bConexion.Open();
                    //  cmd.ExecuteNonQuery();

                    using (SqlDataReader sread = cmd.ExecuteReader())
                    {
                        while (sread.Read())
                        {
                            LUsuarios.Add(new Usuarios()
                            {
                                id = Convert.ToInt32(sread["id"]),
                                nombre = sread["nombre"].ToString(),
                                apellido = sread["apellido"].ToString(),
                                correo = sread["correo"].ToString(),
                                fecha_de_nacimiento = Convert.ToDateTime(sread["fecha_de_nacimiento"]),
                                telefono = sread["telefono"].ToString(),
                                pais = sread["pais"].ToString(),
                                p_info = Convert.ToInt32( sread["p_info"])

                            });
                        }

                    }
                    return LUsuarios;
                }
                catch (Exception e)
                {
                    return LUsuarios;
                }
            }


        }

        public static bool UDelete(Usuarios dUsuario)
        {
            using (SqlConnection dConexion = new SqlConnection(DbConexion.S_Conexion))
            {
                SqlCommand cmd = new SqlCommand("delete_a", dConexion);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", dUsuario.id);

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
    }
}