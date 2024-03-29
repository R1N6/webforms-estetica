﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Cliente.Master" AutoEventWireup="true" CodeBehind="DetallesGuarderia.aspx.cs" Inherits="webforms_estetica.Views.DetallesGuarderia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-block detalles">
        <h2 class="titulo-detalles">Detalles personales de la cita</h2>
         
        <div class="row detalles-dueno">
            <h2>Mascota:
                <asp:Literal runat="server" ID="litPetName" /></h2>
            <h2>Dueño:
                <asp:Literal runat="server" ID="litOwnerName" /></h2>
            <h2>Fecha de recibimiento:
                <asp:Literal runat="server" ID="litStartDate" /></h2>
            <h2>Fecha de salida:
                <asp:Literal runat="server" ID="litEndDate" /></h2>
            <h2>Estado:
                <asp:Literal runat="server" ID="litState" /></h2>
        </div>

        <asp:Repeater runat="server" ID="rptReportes">
            <ItemTemplate>
                <div class="row mt-4 justify-content-center detalles-empleado ">
                    <div class="col-lg-12  ">
                        <h4>Empleado que elaboró reporte: <%#Eval("Nombre_empleado") %></h4>
                        <h4>Fecha de reporte: <%#Eval("Fecha_reporte") %></h4>
                        <h4>Notas:</h4>
                        <p><%#Eval("Notas") %></p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <div class="row mt-4">
            <div class="col-12 no-detalles-empleado">
                <h2 class="d-flex justify-content-center">
                    <asp:Literal runat="server" ID="promptMessage" />
                </h2>
            </div>
        </div>
    </div>
</asp:Content>
