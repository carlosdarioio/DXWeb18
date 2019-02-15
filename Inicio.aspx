<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Inicio.aspx.cs" Inherits="Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <link rel="stylesheet" href="colorbox.css" />
    <script src="jquery.min.js"></script>
	<script src="jquery.colorbox.js"></script>
    <script>
			$(document).ready(function(){            //Size de ventana
			 $(".inline").colorbox({inline:true, width:"90%",height:"90%"});
			});
            
            function cv(y){            
            $(".inline").colorbox({inline:true, width:"90%",height:"90%"});
                $("#txt").html(y);
                }
		</script>


    <div class="row">
        <div class="col-md-12">

            <!-- -->
             <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
  </ol>
  <div class="carousel-inner">    
    <div class="carousel-item active">
      <img class="d-block w-100" src="Images/Portadilla%20Carrusel2.png" alt="Second slide"/>
    </div>
      <div class="carousel-item">
        <img src="Images/Portadilla%20Carrusel1.png" class="d-block w-100" />
    </div>

    <div class="carousel-item">
      <img class="d-block w-100" src="Images/Portadilla%20Carrusel3.png" alt="Third slide"/>
    </div>
      <div class="carousel-item">
      <img class="d-block w-100" src="Images/Portadilla%20Carrusel4.png" alt="Third slide"/>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Anterios</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Siguiente</span>
  </a>
</div>
            <!--            -->

        </div><!--Fin col10-->
        <!--Col-2-->
       <%-- <div class="col-md-3">
            
           <div class="jumbotron">
      <div class="container">
        

            <h1 class="city">Prevision </h1>  
                
              <div class="weather-info">
                <small id="location" class="temp"></small> <small class="country lead"></small>
                <h2 id="temperature" class="info lead">  
                    <span id="temperature-num"></span>                                  
                  <span id="temperature-scale" class="behavior">C</span>
                    <span>°</span>
                    
                </h2>
                <div id="weather-condition" class="info">Minimo:  <small id="min"></small>°C<br /><br /> Maximo: <small id="max"></small>°C   </div>
               <br /> <div id="weather-icon" class="info">Humedad: <small id="humedad"></small>%</div>
              </div>
      </div>
    </div>
        </div><!--Fin COl2-->--%>
    </div><!--Fin Row-->
    <script>

        $("document").ready(function() {

            if (navigator.geolocation) {

                navigator.geolocation.getCurrentPosition(function(position) {

                    //var status = "https://fcc-weather-api.glitch.me/api/current?lon= " + position.coords.longitude + "&lat=" + position.coords.latitude;
                    var status = "https://fcc-weather-api.glitch.me/api/current?lon=-88.021029&lat=15.507560";
                    $.getJSON(status).then(function(info) {
                        
                        var country = info.sys.country;
                        var city = info.name;                        
                        var temp = info.main.temp;
                        var min = info.main.temp_min;
                        var max =info.main.temp_max;
                        var humedad = info.main.humidity
                        
                        $(".country").html(country);
                        $("#location").html(city);
                        $("#temperature-num").html(temp);

                        $("#min").html(min);
                        $("#max").html(max);
                        $("#humedad").html(humedad);
                            

                        //}

                    });

                });

            }

        })
    </script>


    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-lg-4">
          <h2>Calendario</h2>
            <a href="Calendario.aspx">
            <img src="Images/Subpagina1.png" class="img-fluid" />   
                </a>       
        </div>
        <div class="col-lg-4">
          <h2>Frase</h2>
            <a href="http://10.1.201.5/INFINITY/Images/nav2.PNG">
          <img src="Images/nav2 - copia.png" class=" img-fluid " />
                </a>
       </div>
        <div class="col-lg-4">
          <h2>Ganemos el Mes</h2>
            <a href="VendedoresDelMes.aspx">
          <img src="Images/Subpagina3.png" class=" img-thumbnail" />
                </a>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-4">
          <h2>Denuncia</h2>
            <a href="Denuncia.aspx">
          <img src="Images/Subpagina5.png" class=" img-fluid" />
                </a>
        </div>
        <div class="col-lg-4">
          <h2>Cumpleañeros del Mes</h2>
            <a class='inline' href="#inline_content" onclick="cv('Feliz Cumpleaños')">
          <img src="Images/img42 - copia.png" class=" img-fluid" with="100%" height="100%"/>
                </a>
       </div>
        <div class="col-lg-4">
          <h2>Solicitudes</h2>
            <a href="http://10.1.201.5:8080/Soporte">
          <img src="Images/Cover Solcitudes-01.png" class=" img-fluid" />
                </a>
        </div>
      </div>
     </div>




    <!------------------------>
    
	
		<!-- Div content-->
		<div style='display:none'>
			<div id='inline_content' style='padding:10px; background:#fff;'>
			<p>
               <strong id="txt">
                     <!-- <% //document.write(contenido);%>-->
               </strong>
                <img src="Images/img42.png" class=" img-thumbnail" />            
            </p>			
			</div>
        </div>
           <!-- fin Div content --> 

</asp:Content>

