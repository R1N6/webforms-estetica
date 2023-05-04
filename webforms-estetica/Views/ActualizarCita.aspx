<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Empleado.Master" AutoEventWireup="true" CodeBehind="ActualizarCita.aspx.cs" Inherits="webforms_estetica.Views.ActualizarCita" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="actualizar-cita">

        <div class="row d-flex flex-column align-items-center justify-content-center">
            <div class="col-8 rounded border-2 ">
                <h4>Servicios aplicados:</h4>
                <div class="form-check">
                    <input type="checkbox" runat="server" id="chCorte" class="form-check-input" />
                    <label for="chCorte" class="form-check-label">Corte de pelo</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" runat="server" id="chBanio" class="form-check-input" />
                    <label for="chBanio" class="form-check-label">Baño</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" runat="server" id="chNails" class="form-check-input" />
                    <label for="chNails" class="form-check-label">Corte de uñas</label>
                </div>

                <div class="form-check">
                    <input type="checkbox" runat="server" id="chCav" class="form-check-input" />
                    <label for="chCav" class="form-check-label">Limpieza de cavidades</label>
                </div>

                <div class="col-12 d-flex justify-content-center">
                    <asp:Button runat="server" ID="BtnUpdateCita" OnClick="BtnUpdateCita_Click" CssClass="btn btn-info" Text="Completar servicio" />
                </div>

            </div>
        </div>

    </div>
</asp:Content>
