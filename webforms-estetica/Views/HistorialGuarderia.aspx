<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Cliente.Master" AutoEventWireup="true" CodeBehind="HistorialGuarderia.aspx.cs" Inherits="webforms_estetica.Views.HistorialGuarderia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="d-block">
        <div class=" text-center historial-guarderia ">
        <div class="">
            <h2>Historial de estancias de mascota</h2>

        </div>

    </div>

    <div class="list-group text-center">
        <asp:Repeater ID="rptGuardLinks" runat="server" OnItemCommand="rptGuardLinks_ItemCommand">
            <ItemTemplate>
                <asp:LinkButton runat="server" CssClass="list-group-item list-group-item-action"
                    CommandArgument='<%#Eval("ID_estancia") %>' CommandName="Inspect">
                    <%#Eval("Nombre_mascota") %> - (<%#Eval("Fecha_inicio") %> al <%#Eval("Fecha_fin") %> )
                    <span class='badge <%#Eval("Color_class") %>'><%#Eval("Estado") %></span>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <div class="  mt-3">
        <div class=" no-guarderia">
            <h2 class="">
                <asp:Literal runat="server" ID="promptMessage"/>
            </h2>
        </div>
    </div>
    </div>
    
</asp:Content>
