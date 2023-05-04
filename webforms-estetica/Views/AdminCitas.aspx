<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin.Master" AutoEventWireup="true" CodeBehind="AdminCitas.aspx.cs" Inherits="webforms_estetica.Views.AdminCitas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-citas">
    <div class="row mt-3 admin-citas-titulo">
        <h2>Historial de servicios en el negocio</h2>
    </div>
     <asp:Repeater runat="server" ID="rptHistorial" OnItemDataBound="rptHistorial_ItemDataBound">
        <ItemTemplate>
            <div class="row mt-5 admin-cita">
                <asp:HiddenField runat="server" Value='<% #Eval("IdCorte")%>' ID="hdnId"/>
                <asp:HiddenField runat="server" Value='<% #Eval("Estado")%>' ID="hdnState"/>
                <div class="col-lg-4 col-sm-12">
                    <h3>Nombre de la mascota:</h3>
                    <h4><%# Eval("NombreMascota")%></h4>
                </div>
                <div class="col-lg-4 col-sm-12">
                    <h3>Fecha de servicio:</h3>
                    <h4><%# Eval("FechaCorte")%></h4>
                </div>
                <div class="col-lg-4 col-sm-12">
                    <h3>Empleado asignado:</h3>
                    <h4><%# Eval("NomEmpleado")%></h4>
                </div>

                <ul class="list-group col-12" runat="server" id="listEstatus">
 
                    <asp:Repeater runat="server" ID="rptEstatus">
                        <ItemTemplate>
                            <li class="list-group-item"><%# Eval("Estatus") %></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <div class="row mt-3">
        <div class="col no-admmincitas">
            <h2 class="d-flex justify-content-center">
                <asp:Literal runat="server" ID="promptMessage"/>
            </h2>
        </div>
    </div>

  </div>
</asp:Content>
