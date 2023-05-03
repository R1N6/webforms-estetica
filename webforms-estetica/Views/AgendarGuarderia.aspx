<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Cliente.Master" AutoEventWireup="true" CodeBehind="AgendarGuarderia.aspx.cs" Inherits="webforms_estetica.Views.AgendarGuarderia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="agendar-cita">
    <div class="col-5 d-none d-md-block img">
            <img src="/Images/cliente-2.jpg" alt="Alternate Text" class="img-fluid "/>
        </div>
    <div class="col-md-7 d-flex align-items-center flex-column mt-3 text-center ">
        <h3> Agendar cita para guarderia</h3>
        <asp:Label runat="server" AssociatedControlID="txtPetName" CssClass="form-label form-label-lg">Nombre de mascota:</asp:Label>
        <asp:TextBox runat="server" ID="txtPetName" CssClass="form-control form-control-lg" />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPetName" ValidationGroup="valGuard" ErrorMessage="Este campo es requerido" 
            Display="Dynamic" CssClass="text-danger col-12"/>

        <asp:Label runat="server" AssociatedControlID="txtStartDate" CssClass="form-label form-label-lg mt-3">Fecha de inicio (día que nos dejas a tu mascota):</asp:Label>
        <asp:TextBox runat="server" ID="txtStartDate" CssClass="form-control form-control-lg" TextMode="Date" /> 
        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtStartDate" ValidationGroup="valGuard" ErrorMessage="Este campo es requerido"
            Display="Dynamic" CssClass="text-danger col-12" />

        <asp:Label runat="server" AssociatedControlID="txtEndDate" CssClass="form-label form-label-lg mt-3">Fecha de fin (día que recoges a tu mascota):</asp:Label>
        <asp:TextBox runat="server" ID="txtEndDate" CssClass="form-control form-control-lg" TextMode="Date" /> 
        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEndDate" ValidationGroup="valGuard" ErrorMessage="Este campo es requerido"
            Display="Dynamic" CssClass="text-danger col-12" />

        <asp:Button runat="server" ID="BtnAgendarGuard" OnClick="BtnAgendarGuard_Click" CssClass="btn btn-secondary mt-4" Text="Solicitar guardería"
            CausesValidation="true" ValidationGroup="valGuard"/>
    </div>
</div>
    <div class="row mt-3">
        <div class="col">
            <h2 class="d-flex justify-content-center">
                <asp:Literal runat="server" ID="promptMessage"/>
            </h2>
        </div>
    </div>

</asp:Content>
