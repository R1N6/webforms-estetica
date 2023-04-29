<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Empleado.Master" AutoEventWireup="true" CodeBehind="ReporteGuarderia.aspx.cs" Inherits="webforms_estetica.Views.ReporteGuarderia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row text-center">
        <h2>Mascota: <asp:Literal runat="server" ID="litPetName"/></h2>
        <h2>Dueño: <asp:Literal runat="server" ID="litOwnerName"/></h2>
        <h2>Fecha de recibimiento: <asp:Literal runat="server" ID="litStartDate" /></h2>
        <h2>Fecha de salida:<asp:Literal runat="server" ID="litEndDate"/></h2>
    </div>

    
        
    <div class="row text-center" runat="server" id="divNotes" visible="false">
        <div class="input-group justify-content-center">
            <span class="input-group-text">Notas:</span>
            <asp:TextBox runat="server" ID="txtNotes" TextMode="MultiLine"
                CssClass="form-control form-control-lg" />
        </div>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNotes" 
        ErrorMessage="Es necesario llenar las notas"  CssClass="text-danger col-12 mb-3 text-center"
        ValidationGroup="valGuard"/>
    </div>
    
            
        

    <div class="row d-flex justify-content-center" runat="server" id="divOnCourse" visible="false">
        <asp:Button runat="server" ID="BtnInsertarReporte" OnClick="BtnInsertarReporte_Click" CssClass="btn btn-info col-3" Text="Llenar reporte" 
            CausesValidation="true" ValidationGroup="valGuard"/>
    </div>

    <div class="row d-flex justify-content-center" runat="server" id="divFinish" visible="false">
    <asp:Button runat="server" ID="BtnLiberarMascota" OnClick="BtnLiberarMascota_Click" CssClass="btn btn-info col-3" Text="Finalizar guardería" 
        CausesValidation="true" ValidationGroup="valGuard"/>
    </div>
    
     <div class="row mt-3">
        <div class="col">
            <h2 class="d-flex justify-content-center">
                <asp:Literal runat="server" ID="promptMessage"/>
            </h2>
        </div>
    </div>


</asp:Content>
