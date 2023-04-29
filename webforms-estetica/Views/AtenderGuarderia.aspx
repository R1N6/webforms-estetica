<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Empleado.Master" AutoEventWireup="true" CodeBehind="AtenderGuarderia.aspx.cs" Inherits="webforms_estetica.Views.AtenderGuarderia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Repeater ID="rptEstancias" runat="server" OnItemCommand="rptEstancias_ItemCommand">
        <ItemTemplate>
            <div class="row mt-3">
                <div class="col-2 text-center">
                    <h4>Nombre de mascota:</h4>
                    <p><%# Eval("Nombre_mascota") %></p>
                </div>
                <div class="col-3 text-center">
                    <h4>Nombre de dueño:</h4>
                    <p><%# Eval("Nombre_cliente") %></p>
                </div>
                <div class="col-2 text-center">
                    <h4>Fecha de inicio:</h4>
                    <p><%# Eval("Fecha_inicio") %></p>
                </div>
                <div class="col-2 text-center">
                    <h4>Fecha de fin:</h4>
                    <p><%# Eval("Fecha_fin") %></p>
                </div>
                <div class="col-2 text-center">
                    <h4>Estado:</h4>
                    <p>
                        <asp:Literal runat="server" ID="litEstado" Text='<%#Eval("Estado")%>' />
                    </p>
                </div>
                <div class="col-1 text-center d-flex align-items-center">
                    <asp:Button runat="server" CssClass="btn btn-secondary" CommandArgument='<%# Eval("ID_estancia") %>'
                        CommandName="Atender" Text="Atender"/>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <div class="row mt-3">
        <div class="col">
            <h2 class="d-flex justify-content-center">
                <asp:Literal runat="server" ID="promptMessage"/>
            </h2>
        </div>
    </div>
</asp:Content>
