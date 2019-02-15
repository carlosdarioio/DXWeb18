<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Denuncia.aspx.cs" Inherits="Denuncia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <script>
        function onFilesUploadStart(s, e) {
            dxbsDemo.uploadedFilesContainer.hide();
        }
        function onFileUploadComplete(s, e) {
            if (e.callbackData) {
                var fileData = e.callbackData.split('|');
                var fileName = fileData[0],
                    fileUrl = fileData[1],
                    fileSize = fileData[2];
                dxbsDemo.uploadedFilesContainer.addFile(s, fileName, fileUrl, fileSize);
            }
        }

    </script>
    <div class="jumbotron">
      <div class="container">
        
          <div class="row" >

              <div class="col-md-9" >
                  <h1 class="city">Denuncia</h1>                  
              <div class="weather-info">
                  <p class="lead">Denuncia es la acción y efecto de denunciar 
                      (avisar, noticiar, declarar la irregularidad o ilegalidad de algo, delatar).
                       La denuncia puede realizarse ante cualquier accion indevida que requiera ser revisada.
                  </p>
              </div>
              </div>  

              <div class="col-md-3" >
                  <img src="Images/Subpagina5.png" class=" img-thumbnail " />
              </div>   

          </div>   

            
      </div>
    </div>

    <div class="container">
        <h1 class="text-xl-center" style="color:red;">   <asp:Label Text="" ID="txts" CssClass="lead" runat="server" />  </h1>
        
        <dx:BootstrapFormLayout ID="BootstrapFormLayout1" runat="server">
    <Items>
      
        <dx:BootstrapLayoutGroup Caption="Formulario de Denuncia">
            <Items>
                <dx:BootstrapLayoutItem Caption="Nombre" ColSpanMd="6">
                    <ContentCollection>
                        <dx:ContentControl>
                            <dx:BootstrapTextBox ID="Nombre" ClientInstanceName="Nombre" runat="server" Text="" autocomplete="off" />
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:BootstrapLayoutItem>

                <dx:BootstrapLayoutItem Caption="Ubicacion" ColSpanMd="6">
                    <ContentCollection>
                        <dx:ContentControl EnableViewState="false">
                            <dx:BootstrapTextBox ID="Ubicacion" ClientInstanceName="Ubicacion" runat="server" Text=""  autocomplete="off"  HelpTextSettings-EnablePopupAnimation="false"/>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:BootstrapLayoutItem>

                <dx:BootstrapLayoutItem Caption="Telefono" ColSpanMd="6">
                    <ContentCollection>
                        <dx:ContentControl>
                            <dx:BootstrapTextBox ID="Telefono" ClientInstanceName="Telefono" runat="server" Text="" />
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:BootstrapLayoutItem>
                <dx:BootstrapLayoutItem Caption="Descripcion" ColSpanMd="12">
                    <ContentCollection>
                        <dx:ContentControl>
                            <dx:BootstrapMemo ID="Descripcion" ClientInstanceName="Descripcion" runat="server" Rows="4"
                                Text="" />
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:BootstrapLayoutItem>               


                <dx:BootstrapLayoutItem Caption="Adjuntar" ColSpanMd="12">
                    <ContentCollection>
                        <dx:ContentControl>
                           <asp:FileUpload ID="fileUploader" runat="server" />
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:BootstrapLayoutItem>




            </Items>
        </dx:BootstrapLayoutGroup>
        <dx:BootstrapLayoutItem HorizontalAlign="Right" ShowCaption="False" ColSpanMd="12">
            <ContentCollection>
                <dx:ContentControl>
                    <dx:BootstrapButton ID="bttn_Send" runat="server" Text="Enviar" SettingsBootstrap-RenderOption="Primary" AutoPostBack="true" OnClick="bttn_Send_Click" />                    

                    <!--<asp:Button  Text="Submit" runat="server"  class="btn" />-->
                </dx:ContentControl>
            </ContentCollection>
        </dx:BootstrapLayoutItem>
    </Items>
</dx:BootstrapFormLayout>

     </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#BootstrapGridView1').DataTable();

            /*prueba*/
            /*
            $('#btnSubmit').on('click', function () {
                var nombre = $('#Nombre').val();
                var fecha = $('#Fecha').val();
                var descripcion = $('#Descripcion').val();
                var fil = $('#Filed');
                var data = {
                    Nombre: nombre,
                    Fecha: fecha,
                    Descripcion: descripcion,
                    file:fil,
                };

                if (contactus == 0) {
                    $.ajax({
                        type: "POST",
                        url: "Denuncia.aspx/sentMail",
                        data: data,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        //--------------------noiba
                        success: function(data) { // data contains server's response

                            alert('Mensaje enviado');

                    },

                    // Error callback fires if there was an issue communicating with the server
                    // Or a non-200 HTTP status is returned
                    error: function(data) { // data contains server's response

                        alert('Error');

                    }
                    //*****************************
                    })
                } else if (contactus == 1)
                    return false;
                
            });
            */
            /*fi ptorueb*/

        });
	</script>
</asp:Content>

