<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="webforms_estetica.Views.LandingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <webopt:bundlereference runat="server" path="~/Content/css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" Path="~/Scripts/bootstrap.bundle.min.js"/>
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>

         <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
          <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-start" id="navbarSupportedContent">
                

                <div class="dropdown">
                  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-user"></i>
                  </button>
                  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <li><a class="dropdown-item" href="Login.aspx">Iniciar sesión</a></li>
                    <li><a class="dropdown-item" href="Register.aspx">Registrarse</a></li>
                  </ul>
                </div>
            
            </div>
          </div>
        </nav>

        <div class="w-100 d-flex justify-content-center align-items-center servicios mb-5  ">
            <div class="row row-cols-2 w-100 justify-content-around ">
                <div class=" col-md-12 text-center">
                    <h2 class="mt-5">Servicios</h2>
                </div>

                <div class="col-md-5 text-center mx-5 servicio">
                    <img src="/Images/scissors.png" width="150" height="150" alt="Estetica" />
                    <h4>Estetica</h4>
                    <p>
                        Servicio de corte/deslanado, baño y corte de uñas.
                    </p>
                </div>

                <div class="col-md-5 text-center mx-5 servicio">
                        <img src="/Images/shield.png" width="150" height="150" alt="Guarderia" />
                        <h4>Guarderia</h4>
                        <p>
                            Cuidamos de tu mascota por un intervalo de 1-7 días.
                        </p>
                </div>

            </div>
        </div>

        <div class="container preguntas mt-5">
            <div class="row w-100 ">
                <div class="col-md-12 text-center">
                    <h2>Preguntas Frecuentes</h2>
                </div>
                <hr />
            </div>

            <div class="accordion accordion-flush " id="accordionFlushExample">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Lorem ipsum?
                        </button>
                    </h2>
                    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">

                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam non velit sit amet nulla finibus consequat. Proin tincidunt sapien
                            at lacus lobortis, vel eleifend nunc accumsan. In id lorem lobortis, fermentum justo ac, sagittis velit. Sed scelerisque molestie
                            nunc sed molestie. Phasellus tempus diam sed lorem rhoncus blandit in euismod mi. Vestibulum scelerisque justo et accumsan mattis
                            . Cras imperdiet interdum est, tincidunt viverra quam. Nullam nunc leo, interdum fringilla leo et,
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Lorem ipsum?
                        </button>
                    </h2>
                    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam non velit sit amet nulla finibus consequat. Proin tincidunt sapien
                            at lacus lobortis, vel eleifend nunc accumsan. In id lorem lobortis, fermentum justo ac, sagittis velit. Sed scelerisque molestie
                            nunc sed molestie. Phasellus tempus diam sed lorem rhoncus blandit in euismod mi. Vestibulum scelerisque justo et accumsan mattis. Cras imperdiet interdum est, tincidunt viverra quam. Nullam nunc leo, interdum fringilla leo et,
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Lorem ipsum?
                        </button>
                    </h2>
                    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam non velit sit amet nulla finibus consequat. Proin tincidunt sapien
                            at lacus lobortis, vel eleifend nunc accumsan. In id lorem lobortis, fermentum justo ac, sagittis velit. Sed scelerisque molestie
                            nunc sed molestie. Phasellus tempus diam sed lorem rhoncus blandit in euismod mi. Vestibulum scelerisque justo et accumsan mattis
                            . Cras imperdiet interdum est, tincidunt viverra quam. Nullam nunc leo, interdum fringilla leo et,
                        </div>

                    </div>
                </div>
            </div>

        </div>


        <div class="w-100 d-flex justify-content-center align-items-center mapa mt-5 border-top">
            <div class="row row w-100 justify-content-around  ">
                <div class=" col-md-12 text-center mt-3">
                    <h2>Ubicacion</h2>
                </div>

                <div class=" col-md-12 w-100 mt-3 google-map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3733.361640135258!2d-103.32763838507364!3d20.654861086202057!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8428b23a9bbba80d%3A0xdacdb7fd592feb90!2sCentro%20Universitario%20de%20Ciencias%20Exactas%20e%20Ingenier%C3%ADas!5e0!3m2!1ses-419!2smx!4v1679280723522!5m2!1ses-419!2smx"  height="500" width="100" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>
        </div>

        <div class="w-100 d-flex justify-content-center align-items-center mapa mt-5 border-top">
            <div class="contenedor-horario mt-5">
                <div class="row row-cols-2 w-100 justify-content-around  contenedor-horario2">
                    <div class=" col-md-12 w-100 text-center mt-3">
                        <h2>Horario</h2>
                    </div>

                    <div class=" col-md-5  mt-3 text-center">
                        <h4>Lunes a Viernes</h4>
                        <p>Lorem ipsum</p>
                    </div>

                    <div class=" col-md-5  mt-3 text-center">
                        <h4> Fines de semana</h4>
                        <p>Lorem ipsum</p>
                    </div>
                </div>
        
            </div>
        </div>

    </form>
</body>
</html>
