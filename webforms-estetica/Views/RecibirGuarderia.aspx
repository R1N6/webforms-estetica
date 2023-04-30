<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Empleado.Master" AutoEventWireup="true" CodeBehind="RecibirGuarderia.aspx.cs" Inherits="webforms_estetica.Views.RecibirGuarderia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row text-center">
        <h2>Mascota: <asp:Literal runat="server" ID="litPetName"/></h2>
        <h2>Dueño: <asp:Literal runat="server" ID="litOwnerName"/></h2>
        <h2>Fecha de recibimiento: <asp:Literal runat="server" ID="litStartDate" /></h2>
        
        <div class="col-12 d-flex justify-content-center" runat="server" id="divBtnRecibir">
            <asp:Button runat="server" ID="BtnRecibirMascota" OnClick="BtnRecibirMascota_Click" CssClass="btn btn-info" Text="Recibir mascota" />
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
