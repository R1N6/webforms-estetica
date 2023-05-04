<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin.Master" AutoEventWireup="true" CodeBehind="AdminGuarderia.aspx.cs" Inherits="webforms_estetica.Views.AdminGuarderia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row text-center titulo-guarderia">
        <h2>Historial de estancias de mascota</h2>
    </div>

    <div class="list-group text-center admin-cita-guarderia">
        <asp:Repeater ID="rptGuardLinks" runat="server" OnItemCommand="rptGuardLinks_ItemCommand">
            <ItemTemplate>
                <asp:LinkButton runat="server" CssClass="list-group-item list-group-item-action"
                    CommandArgument='<%#Eval("ID_estancia") %>' CommandName="Inspect">
                   <%#Eval("Nombre_cliente")%>: <%#Eval("Nombre_mascota") %> - (<%#Eval("Fecha_inicio") %> al <%#Eval("Fecha_fin") %> )
                    <span class='badge <%#Eval("Color_class") %>'><%#Eval("Estado") %></span>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <div class="row mt-3">
        <div class="col">
            <h2 class="d-flex justify-content-center">
                <asp:Literal runat="server" ID="promptMessage"/>
            </h2>
        </div>
    </div>
</asp:Content>
