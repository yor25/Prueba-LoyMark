using FrontEnd.Modelos_fe;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Windows;
using System.Net.Http.Formatting;
using System.Text.Json;

namespace FrontEnd
{
    public partial class Index : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarDropDown();
            
        }

        private void LlenarDropDown()
        {
            if(!IsPostBack)
                {
                paises listaP = new paises();
                List<string> Npais = new List<string>();
                //Npais = listaP.Codpaises().Keys.ToList<string>();
                DropDownPais.DataSource = listaP.Codpaises();
                //DropDownPais.DataTextField = "Key";
                //DropDownPais.SelectedValue = "Value";
                DropDownPais.DataBind();
                DropDownPais.Items.Insert(0, new ListItem("[seleccionar]", "0"));
            }
            
        }

        
        protected async void Btn_create_Click(object sender, EventArgs e)
        {


            //decirle a la conexión hacia el servidor que NO les interesa verificar el
            //contenido del certificado de gmail. Para ello, inserten las siguientes
            //líneas ANTES de la llamada

            ServicePointManager.ServerCertificateValidationCallback =

                        delegate (object s

                            , X509Certificate certificate

                            , X509Chain chain

                            , SslPolicyErrors sslPolicyErrors)

                        { return true; };
            var url = "https://localhost:44398/api/Values";
            using (var httpClient = new HttpClient())
            {
                Usuarios usuario = new Usuarios();
                validaciones validar = new validaciones();
                string telefono = TxtTelefono.Text.Trim();
                string sResult = validar.validar(TxtNombre.Text, TxtApellido.Text, TxtCorreo.Text, ref telefono);
                TxtTelefono.Text = telefono;
                if (TxtNombre.Text.ToString().Equals("") || TxtApellido.Text.ToString().Equals("") || TxtCorreo.Text.ToString().Equals("") || dtFecha.Value.ToString().Equals("") || DropDownPais.Text.ToString().Equals("") || DropDownPais.SelectedValue.ToString().Equals("0"))
                {

                    MessageBox.Show("Hay campos vacios");
                } else if (!sResult.Equals("exito"))
                {
                    MessageBox.Show(sResult);
                }
                else
                {
                    usuario.nombre = TxtNombre.Text.Trim();
                    usuario.apellido = TxtApellido.Text.Trim();
                    usuario.correo = TxtCorreo.Text.Trim();
                    usuario.pais = DropDownPais.SelectedValue.ToString();
                    usuario.fecha_de_nacimiento = Convert.ToDateTime(dtFecha.Value.ToString());
                    usuario.telefono = TxtTelefono.Text.Trim();
                    //dateTimePicker1.Value.ToString("MM/dd/yyyy")
                    if (RadioSi.Checked)
                    {
                        usuario.p_info = 1;
                    }
                    else if (RadioNo.Checked)
                    {
                        usuario.p_info = 0;
                    }
                    else
                    {
                        MessageBox.Show("Hay campos vacios");
                    }


                    var personaSerializada = System.Text.Json.JsonSerializer.Serialize(usuario);
                    var content = new StringContent(personaSerializada, Encoding.UTF8, "application/JSON");
                    var respuesta = await httpClient.PostAsync(url, content);
                }
               //var respuesta = await httpClient.PostAsJsonAsync("api/AgentCollection", usuario);
                

            }

        }

        protected async void Btn_Read_Click(object sender, EventArgs e)
        {
            
            
            //decirle a la conexión hacia el servidor que NO les interesa verificar el
            //contenido del certificado de gmail. Para ello, inserten las siguientes
            //líneas ANTES de la llamada

            ServicePointManager.ServerCertificateValidationCallback =

                        delegate (object s

                            , X509Certificate certificate

                            , X509Chain chain

                            , SslPolicyErrors sslPolicyErrors)

                        { return true; };

            List<Usuarios> lista = new List<Usuarios>();
            var url = "https://localhost:44398/api/Values";
            using (var httpClient = new HttpClient())
            {
                
                var respuestaString = await httpClient.GetStringAsync(url);
                List<Usuarios> usuarios = JsonConvert.DeserializeObject<List<Usuarios>>(respuestaString);
                StringBuilder table = new StringBuilder();
                table.Append("<table border='1'>");
                table.Append(" <tr> <th>id </th>");
                table.Append("<th> nombre </th>");
                table.Append("<th> apellido </th>");
                table.Append("<th> correo </th>");
                table.Append("<th> fecha de nacimiento </th>");
                table.Append("<th> telefono </th>");
                table.Append("<th> pais </th>");
                table.Append("<th> informacion </th>");
                table.Append("</tr>");
                string respuesta;
                foreach (var user in usuarios)
                {
                   
                    table.Append("<tr>");
                    table.Append("<td>" + user.id.ToString() + "</td>");
                    table.Append("<td>" + user.nombre.ToString() + "</td>");
                    table.Append("<td>" + user.apellido.ToString() + "</td>");
                    table.Append("<td>" + user.correo.ToString() + "</td>");
                    table.Append("<td>" + user.fecha_de_nacimiento.ToString() + "</td>");
                    table.Append("<td>" + user.telefono.ToString() + "</td>");
                    table.Append("<td>" + user.pais.ToString() + "</td>");
                    if (user.p_info==1)
                    {
                        respuesta = "SI";
                    }
                    else
                    {
                        respuesta = "NO";
                    }
                    table.Append("<td>" + respuesta + "</td>");
                    table.Append("</tr>");
                }
                table.Append("</table>");
                PlaceHolder1.Controls.Add( new Literal { Text = table.ToString() });
            }

           
        }

        protected async void Btn_Update_Click(object sender, EventArgs e)
        {
            //decirle a la conexión hacia el servidor que NO les interesa verificar el
            //contenido del certificado de gmail. Para ello, inserten las siguientes
            //líneas ANTES de la llamada

            ServicePointManager.ServerCertificateValidationCallback =

                        delegate (object s

                            , X509Certificate certificate

                            , X509Chain chain

                            , SslPolicyErrors sslPolicyErrors)

                        { return true; };
            var url = "https://localhost:44398/api/values";
            using (var httpClient = new HttpClient())
            {
                Usuarios usuario = new Usuarios();
                validaciones validar = new validaciones();
                string telefono = TxtTelefono.Text.Trim();
                string sResult = validar.validar(TxtNombre.Text, TxtApellido.Text, TxtCorreo.Text, ref telefono);
                TxtTelefono.Text = telefono;

                if (TxtId.Text.ToString().Equals("") || TxtNombre.Text.ToString().Equals("") || TxtApellido.Text.ToString().Equals("") || TxtCorreo.Text.ToString().Equals("") || dtFecha.Value.ToString().Equals("") || DropDownPais.Text.ToString().Equals("") || DropDownPais.SelectedValue.ToString().Equals("0"))
                {
                    MessageBox.Show("Hay campos vacios");
                }
                else if (!sResult.Equals("exito"))
                {
                    MessageBox.Show(sResult);
                }
                else
                {
                    usuario.id = Convert.ToInt32( TxtId.Text.Trim());
                    usuario.nombre = TxtNombre.Text.Trim();
                    usuario.apellido = TxtApellido.Text.Trim();
                    usuario.correo = TxtCorreo.Text.Trim();
                    usuario.pais = DropDownPais.SelectedValue.ToString();
                    usuario.fecha_de_nacimiento = Convert.ToDateTime(dtFecha.Value.ToString());
                    usuario.telefono = TxtTelefono.Text.Trim();
                    //dateTimePicker1.Value.ToString("MM/dd/yyyy")
                    if (RadioSi.Checked)
                    {
                        usuario.p_info = 1;
                    }
                    else if (RadioNo.Checked)
                    {
                        usuario.p_info = 0;
                    }
                    else 
                    {
                        MessageBox.Show("Hay campos vacios");
                    }
                    await httpClient.PutAsJsonAsync($"{url}/{usuario.id}", usuario);
                }
                //var respuesta = await httpClient.PostAsJsonAsync("api/AgentCollection", usuario);


            }
        }

        protected async void Btn_Delete_Click(object sender, EventArgs e)
        {
            //decirle a la conexión hacia el servidor que NO les interesa verificar el
            //contenido del certificado de gmail. Para ello, inserten las siguientes
            //líneas ANTES de la llamada

            ServicePointManager.ServerCertificateValidationCallback =

                        delegate (object s

                            , X509Certificate certificate

                            , X509Chain chain

                            , SslPolicyErrors sslPolicyErrors)

                        { return true; };
            var url = "https://localhost:44398/api/Values";
            using (var httpClient = new HttpClient())
            {

                if (TxtId.Text.ToString().Equals(""))
                {
                    MessageBox.Show("Para eliminar un usuario debe ingresar un id");
                }
                else
                {
                    Usuarios usuarios = new Usuarios();

                    usuarios.id = Convert.ToInt32(TxtId.Text.Trim());
                    await httpClient.DeleteAsync($"{url}/{usuarios.id}");
                }
                //var respuesta = await httpClient.PostAsJsonAsync("api/AgentCollection", usuario);
                

            }
        }

        protected void TxtId_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void Btn_Delete_DataBinding(object sender, EventArgs e)
        {

        }
    }
}