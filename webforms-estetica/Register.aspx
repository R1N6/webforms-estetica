<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="webforms_estetica.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registrarse</title>
    <webopt:bundlereference runat="server" path="~/Content/css" />
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
                    Registrarse
                </h1>
            </div>
            <div class="row mt-5 d-flex justify-content-center flex-nowrap">
                <div class="col-4">
                    <div class="input-group">
                        <span class="input-group-text">Nombre</span>
                        <asp:TextBox runat="server" ID="regName" CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator CssClass="text-danger col-12" runat="server" ControlToValidate="regName" ErrorMessage="Este campo es requerido"
                            Display="Dynamic" ValidationGroup="valReg"/>

                    <div class="input-group mt-3">
                        <span class="input-group-text">Apellido</span>
                        <asp:TextBox runat="server" ID="regLastName" CssClass="form-control"/>
                    </div>
                    <asp:RequiredFieldValidator runat="server" CssClass="text-danger col-12" ControlToValidate="regLastName" ErrorMessage="Este campo es requerido"
                            Display="Dynamic" ValidationGroup="valReg"/>

                    <div class="input-group mt-3">
                        <span class="input-group-text">Correo</span>
                        <asp:TextBox runat="server" ID="regEmail" CssClass="form-control"/>
                    </div>
                    <asp:RequiredFieldValidator runat="server" CssClass="text-danger col-12" ControlToValidate="regLastName" ErrorMessage="Este campo es requerido"
                            Display="Dynamic" ValidationGroup="valReg"/>

                    <div class="input-group mt-3">
                        <span class="input-group-text">Contraseña</span>
                        <asp:TextBox runat="server" ID="regPass" CssClass="form-control"
                            TextMode="Password" />
                    </div>
                    <asp:RequiredFieldValidator runat="server" CssClass="text-danger col-12" ControlToValidate="regPass" ErrorMessage="Este campo es requerido"
                            Display="Dynamic" ValidationGroup="valReg"/>

                    <div class="input-group mt-3">
                        <span class="input-group-text">Confirmar contraseña</span>
                        <asp:TextBox runat="server" ID="regPass2" CssClass="form-control"
                            TextMode="Password" />
                    </div>
                    <asp:RequiredFieldValidator runat="server" CssClass="text-danger col-12" ControlToValidate="regPass" ErrorMessage="Este campo es requerido"
                            Display="Dynamic" ValidationGroup="valReg"/>
                        <asp:CompareValidator runat="server" CssClass="text-danger col-12" ControlToCompare="regPass" ControlToValidate="regPass2" 
                            ErrorMessage="Las contraseñas no coinciden" Operator="Equal" Display="Dynamic" ValidationGroup="valReg"/>

                </div>
            </div>

            <div class="row mt-3">

                <div class="col d-flex justify-content-center flex-nowrap">
                    <asp:Button runat="server" CssClass="btn btn-primary btn-lg" 
                    OnClick="btnRegister_Click" ID="btnRegister" Text="Enviar" ValidationGroup="valReg" CausesValidation="true"/>
                </div>

            </div>

            <div class="row mt-3">
                <div class="col">
                    <h2 class="d-flex justify-content-center">
                        <asp:Literal runat="server" ID="promptMessage"/>
                    </h2>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
