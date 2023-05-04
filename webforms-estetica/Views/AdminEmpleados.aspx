<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin.Master" AutoEventWireup="true" CodeBehind="AdminEmpleados.aspx.cs" Inherits="webforms_estetica.Views.AdminEmpleados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-empleados">
    <div class="row m-3 admin-empleados-titulo">
        <h2>Administrar empleados</h2>
    </div>
    
    <asp:GridView runat="server" ID="gvEmpleados" AutoGenerateColumns="false" OnRowDeleting="gvEmpleados_RowDeleting" OnRowEditing="gvEmpleados_RowEditing"
        OnRowUpdating="gvEmpleados_RowUpdating" OnRowCancelingEdit="gvEmpleados_RowCancelingEdit" CssClass="table table-striped">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HiddenField ID="hdnEmpId" runat="server" Value='<%#Eval("ID_usuario") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Nombre" HeaderText="Nombre(s)"/>
            <asp:BoundField DataField="Apellido" HeaderText="Apellido(s)"/>
            <asp:BoundField DataField="Correo" HeaderText="Correo electrónico"/>
            <asp:CommandField ShowEditButton="true" />
            <asp:CommandField ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>

    <div class="row mt-3">
        <div class="col">
            <h2 class="d-flex justify-content-center">
                <asp:Literal runat="server" ID="promptMessage"/>
            </h2>
        </div>
    </div>
        </div>
</asp:Content>
