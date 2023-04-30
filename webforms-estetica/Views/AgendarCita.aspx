<%@ Page Title="" Language="C#" MasterPageFile="Cliente.Master" AutoEventWireup="true" CodeBehind="AgendarCita.aspx.cs" Inherits="webforms_estetica.Views.AgendarCita" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-12 d-flex align-items-center flex-column mt-3 text-center">
            <asp:Label runat="server" AssociatedControlID="txtPetName" CssClass="form-label form-label-lg">Nombre de mascota:</asp:Label>
            <asp:TextBox runat="server" ID="txtPetName" CssClass="form-control form-control-lg" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPetName" ValidationGroup="valCitas" ErrorMessage="Este campo es requerido" 
                Display="Dynamic" CssClass="text-danger col-12"/>

            <asp:Label runat="server" AssociatedControlID="txtDate" CssClass="form-label form-label-lg">Fecha:</asp:Label>
            <asp:TextBox runat="server" ID="txtDate" CssClass="form-control form-control-lg" TextMode="Date" AutoPostBack="true"/> 
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDate" ValidationGroup="valCitas" ErrorMessage="Este campo es requerido"
                Display="Dynamic" CssClass="text-danger col-12" />

            <asp:Label runat="server" AssociatedControlID="ddlHorarios" CssClass="form-label form-label-lg">Horarios disponibles:</asp:Label>
            <asp:DropDownList runat="server" ID="ddlHorarios" CssClass="form-select form-select-lg"></asp:DropDownList>

            <asp:Button runat="server" ID="BtnAgendarCita" OnClick="BtnAgendarCita_Click" CssClass="btn btn-primary mt-3" Text="Agendar cita"
                CausesValidation="true" ValidationGroup="valCitas"/>
        </div>

        <div class="row mt-3">
        <div class="col">
            <h2 class="d-flex justify-content-center">
                <asp:Literal runat="server" ID="promptMessage"/>
            </h2>
        </div>
    </div>
</asp:Content>
