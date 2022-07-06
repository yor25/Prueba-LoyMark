<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActividadesWeb.aspx.cs" Inherits="FrontEnd.ActividadesWeb" Async="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
        <div class="topnav">
  <a class="Index.aspx" href="Index.aspx">Usuarios</a>
  <a href="ActividadesWeb.aspx">Actividades</a>
</div>
    <form id="form1" runat="server">
        <div>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </div>
    </form>
</body>
</html>
