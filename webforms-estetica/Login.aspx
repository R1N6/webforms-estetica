<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="webforms_estetica.Views.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Iniciar sesión</title>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link href="~/Content/Login.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" Path="~/Scripts/bootstrap.bundle.min.js"/>
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>
        <div class="container">
            
            <div class="row text-center">
                <h1>
                    Iniciar sesión
                </h1>
            </div>
            <div class="row mt-5 d-flex justify-content-center flex-nowrap">
                <div class="col-8">
                    <div class="input-group mb-3">
                        <i class=" fa fa-regular fa-envelope"></i>
                        <asp:TextBox runat="server" ID="logUname" CssClass="form-control" placeholder="Correo Electronico"></asp:TextBox>
                    </div>
                    <div class="input-group mb-3">
                        <i class=" fa fa-solid fa-lock"></i>
                        <asp:TextBox runat="server" ID="logPass" CssClass="form-control"
                            TextMode="Password" placeholder="Contraseña"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col d-flex justify-content-center flex-nowrap">
                    <asp:Button runat="server" CssClass="btn btn-primary btn-lg" 
                    OnClick="btnLogin_Click" ID="btnLogin" Text="Acceder"/>
                </div>
            </div>
            
            <div class="row mt-3">
                <div class="col">
                    <h2 class="d-flex justify-content-center">
                        <asp:Literal runat="server" ID="promptMessage"/>
                    </h2>
                </div>
            </div>

            <div class="row justify-content-end">
                <a href="/LandingPage.aspx">Inicio</a>
            </div>

        </div>
    </form>
    
</body>
</html>
