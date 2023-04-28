<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Empleado.Master" AutoEventWireup="true" CodeBehind="AtenderCitas.aspx.cs" Inherits="webforms_estetica.Views.AtenderCitas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Repeater ID="rptCitas" runat="server" OnItemCommand="rptCitas_ItemCommand">
        <ItemTemplate>
            <div class="row mt-3">
                <div class="col-4 text-center">
                    <h4>Nombre de mascota:</h4>
                    <p><%# Eval("NombreMascota") %></p>
                </div>
                <div class="col-4 text-center">
                    <h4>Nombre de dueño:</h4>
                    <p><%# Eval("NombreCliente") %></p>
                </div>
                <div class="col-3 text-center">
                    <h4>Horario agendado:</h4>
                    <p><%# Eval("HoraCita") %></p>
                </div>
                <div class="col-1 text-center d-flex align-items-center">
                    <asp:Button runat="server" CssClass="btn btn-secondary" CommandArgument='<%# Eval("ID_Corte") %>'
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
