﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Cliente.Master" AutoEventWireup="true" CodeBehind="HistorialCitas.aspx.cs" Inherits="webforms_estetica.Views.HistorialCitas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-block historial-citas">
        <div class=" text-center historial-guarderia ">
        <div class="row">
            <h2>Historial de estetica</h2>
        </div>
    </div>
    <asp:Repeater runat="server" ID="rptHistorial" OnItemDataBound="rptHistorial_ItemDataBound">
        <ItemTemplate>
            <div class="row cita">
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
                
                <ul class="list-group col-lg-12" runat="server" id="listEstatus">
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
        <div class="col">
            <h2 class="d-flex justify-content-center no-historial">
                <asp:Literal runat="server" ID="promptMessage"/>
            </h2>
        </div>
    </div>
        </div>
</asp:Content>
