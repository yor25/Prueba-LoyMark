<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="FrontEnd.Index" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <title></title>
</head>
<body>
    <div class="topnav">
  <a class="home" href="Index.aspx">usuarios</a>
  <a href="ActividadesWeb.aspx">Actividades</a>
</div>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="LlblId" runat="server" Text="ID"></asp:Label>
         <asp:TextBox ID="TxtId" runat="server" OnTextChanged="TxtId_TextChanged"></asp:TextBox><br />
            <asp:Label ID="Lblname" runat="server" Text="nombre"></asp:Label>
        <asp:TextBox ID="TxtNombre" runat="server"></asp:TextBox><br />
            <asp:Label ID="LblApe" runat="server" Text="Apellidos"></asp:Label>
        <asp:TextBox ID="TxtApellido" runat="server"></asp:TextBox><br />
            <asp:Label ID="LblMail" runat="server" Text="Correo"></asp:Label>
        <asp:TextBox ID="TxtCorreo" runat="server" Height="22px"></asp:TextBox><br />
            <asp:Label ID="LblFecha" runat="server" Text="Fecha De Nacimiento"></asp:Label>
        <input type="datetime-local" id="dtFecha" runat="server" /><br />
            <asp:Label ID="LblTelefono" runat="server" Text="Telefono"></asp:Label>
         <asp:TextBox ID="TxtTelefono" runat="server"></asp:TextBox><br />
            <asp:Label ID="LblPais" runat="server" Text="Pais"></asp:Label>
        <asp:DropDownList ID="DropDownPais" runat="server" DataTextField="Value" DataValueField="Key"></asp:DropDownList><br />
            <asp:Label ID="LblQuestion" runat="server" Text="¿Desea recibir información?"></asp:Label>
            <fieldset> 
                <label>
            <input type="radio" id="RadioSi" name="Radio" value="Si" runat="server"   /> Si
        </label>
        <label>
            <input type="radio" id="RadioNo" name="Radio" value="No" runat="server" /> No
        </label>
           
            </fieldset>
         
        </div>

        <asp:Button ID="Btn_create" runat="server" Text="Create" OnClick="Btn_create_Click" />
        <asp:Button ID="Btn_Read" runat="server" Text="Read" OnClick="Btn_Read_Click" />
        <asp:Button ID="Btn_Update" runat="server" Text="Update" OnClick="Btn_Update_Click" />
        <asp:Button ID="Btn_Delete" runat="server" Text="Delete" OnClick="Btn_Delete_Click" OnDataBinding="Btn_Delete_DataBinding" />

        <div>


        </div>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    </form>
</body>
</html>
