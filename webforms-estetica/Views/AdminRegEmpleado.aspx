<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin.Master" AutoEventWireup="true" CodeBehind="AdminRegEmpleado.aspx.cs" Inherits="webforms_estetica.Views.AdminRegEmpleado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid mt-3 reg-admin">
         <div class="row text-center d-flex justify-content-center">
            <h1>
                Registrar nuevo empleado
            </h1>
        </div>

        <div class="row mt-5 d-flex justify-content-center flex-nowrap">
            <div class="col-6">
                <div class="input-group">
                    <i class=" fa fa-user "></i>
                    <asp:TextBox runat="server" ID="regName" CssClass="form-control" placeholder="Nombre"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator CssClass="text-danger col-12" runat="server" ControlToValidate="regName" ErrorMessage="Este campo es requerido"
                        Display="Dynamic" ValidationGroup="valReg"/>

                <div class="input-group mt-3">
                    <i class=" fa fa-user "></i>
                    <asp:TextBox runat="server" ID="regLastName" CssClass="form-control" placeholder="Apellido"/>
                </div>
                <asp:RequiredFieldValidator runat="server" CssClass="text-danger col-12" ControlToValidate="regLastName" ErrorMessage="Este campo es requerido"
                        Display="Dynamic" ValidationGroup="valReg"/>

                <div class="input-group mt-3">
                    <i class=" fa fa-regular fa-envelope"></i>
                    <asp:TextBox runat="server" ID="regEmail" CssClass="form-control" placeholder="Correo Electronico"/>
                </div>
                <asp:RequiredFieldValidator runat="server" CssClass="text-danger col-12" ControlToValidate="regLastName" ErrorMessage="Este campo es requerido"
                        Display="Dynamic" ValidationGroup="valReg"/>

                <div class="input-group mt-3">
                    <i class=" fa fa-solid fa-lock"></i>
                    <asp:TextBox runat="server" ID="regPass" CssClass="form-control" placeholder="Contraseña"
                        TextMode="Password" />
                </div>
                <asp:RequiredFieldValidator runat="server" CssClass="text-danger col-12" ControlToValidate="regPass" ErrorMessage="Este campo es requerido"
                        Display="Dynamic" ValidationGroup="valReg"/>

                <div class="input-group mt-3">
                    <i class=" fa fa-solid fa-lock"></i>
                    <asp:TextBox runat="server" ID="regPass2" CssClass="form-control" placeholder="Confirmar contraseña"
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
</asp:Content>
