using FrontEnd.Modelos_fe;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FrontEnd
{
    public partial class ActividadesWeb : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarActividades();
        }

        protected async void cargarActividades()
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
            var url = "https://localhost:44398/api/Values/GetActividades";
            using (var httpClient = new HttpClient())
            {

                var respuestaString = await httpClient.GetStringAsync(url);
                List<Actividad> usuarios = JsonConvert.DeserializeObject<List<Actividad>>(respuestaString);
                System.Text.StringBuilder table = new StringBuilder();
                table.Append("<table border='1'>");
                table.Append("<th> fecha de actividad </th>");
                table.Append("<th> nombre completo </th>");
                table.Append("<th> detalle de actividad </th>");;
                table.Append("</tr>");
                foreach (var user in usuarios)
                {

                    table.Append("<tr>");
                    table.Append("<td>" + user.create_date.ToString() + "</td>");
                    table.Append("<td>" + user.id_usuario.ToString() + "</td>");
                    table.Append("<td>" + user.actividad.ToString() + "</td>");
                   
                    table.Append("</tr>");
                }
                table.Append("</table>");
                PlaceHolder1.Controls.Add(new Literal { Text = table.ToString() });
            }
        }
    }
}