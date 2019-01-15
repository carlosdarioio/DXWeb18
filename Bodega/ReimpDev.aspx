<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTest1.Master" AutoEventWireup="true" CodeBehind="ReimpDev.aspx.cs" Inherits="DXWeb18.Bodega.ReimpDev" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        //<ClientSideEvents KeyDown="function(s, e) { DoProcessEnterKey(e.htmlEvent); }" />
        function DoProcessEnterKey(htmlEvent) {
            if (htmlEvent.keyCode == 13) {
                ASPxClientUtils.PreventEventAndBubble(htmlEvent);
                //EstadoGuia();
                btnBuscar.click();
            }
        }
    </script>
     <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- CONTENT EXAMPLE -->
        <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">IMPRIMIR DEVOLUCION</h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              <button type="button" class="btn btn-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
              Especificar fecha de la devolucion y numeracion 
            <div class="row">
              <div class="col-md-12">
                   <!-- /.form-group -->
                <div class="form-group">      
                     <dx:BootstrapFormLayout ID="BootstrapFormLayout1" runat="server" CssClasses-Control="form-group row">
                        <CssClasses Control="form-group row"></CssClasses>
                        <Items>

                            <dx:BootstrapLayoutItem Caption="Formato" ColSpanMd="8" HelpText="Numeracion Que Ingresara">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:BootstrapComboBox ID="Formato" runat="server" SelectedIndex="0">
                                            <Items>
                                                <dx:BootstrapListEditItem Text="Devolucion" Value="D" />
                                                <dx:BootstrapListEditItem Selected="True" Text="Factura" Value="F" />
                                            </Items>
                                            <ClientSideEvents KeyDown="function(s, e) { DoProcessEnterKey(e.htmlEvent); }" />
                                        </dx:BootstrapComboBox>

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem>

                            <dx:BootstrapLayoutItem Caption="Fecha Devolucion" ColSpanMd="8" HelpText="Formato AnyoMesDia: 20180514">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:BootstrapTextBox ID="Fecha" runat="server" Text=""  MaskSettings-ErrorText="" >
                                            <ValidationSettings ValidationGroup="Validation">
                                            <RequiredField IsRequired="true" ErrorText="No puede quedar Vacio Debe ser AnyoMesDia: 20180514" />
                                            <%--<RegularExpression ValidationExpression="   " ErrorText="Digitar Solo Numeros en formato AnyoMesDia: 20180514" />--%>
                                        </ValidationSettings> 
                                         <ClientSideEvents KeyDown="function(s, e) { DoProcessEnterKey(e.htmlEvent); }" />
                                        </dx:BootstrapTextBox>

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem>

                            <dx:BootstrapLayoutItem Caption="Numero de Factura" ColSpanMd="8">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:BootstrapTextBox ID="numero" runat="server" Text="" MaskSettings-ErrorText="">
                                         <ValidationSettings ValidationGroup="Validation">
                                            <RequiredField IsRequired="true" ErrorText="No puede quedar Vacio" />
                                            <%--<RegularExpression ValidationExpression="[0-9]{10}\b" ErrorText="Digitar Solo Numeros" />--%>
                                        </ValidationSettings>    
                                            <ClientSideEvents KeyDown="function(s, e) { DoProcessEnterKey(e.htmlEvent); }" />
                                        </dx:BootstrapTextBox>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem>


                            <dx:BootstrapLayoutItem HorizontalAlign="Right" ShowCaption="False" ColSpanMd="3">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <%--<dx:BootstrapButton ID="BootstrapButton1" runat="server" Text="Imprimir" SettingsBootstrap-RenderOption="Primary" AutoPostBack="true">
                                            <SettingsBootstrap RenderOption="Primary"></SettingsBootstrap>
                                            <ClientSideEvents Click="function(s, e) { e.processOnServer = ASPxClientEdit.ValidateGroup('Validation'); }" />
                                            <CssClasses Icon="fa fa-check" />
                                        </dx:BootstrapButton>--%>
                                        <button type="button" class="btn btn-primary dxbs-button" id="btnBuscar" onclick="ReimprimirDev()"><li class="fa fa-check"></li> Imprimir</button>                                         
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem>

                        </Items>
                    </dx:BootstrapFormLayout>            
                </div>
                <!-- /.form-group -->                
               
              </div>
              <!-- /.FIN col-md-12 -->
              
              <!-- /.col -->
            </div>
            <!-- /.row -->
          </div>
          <!-- /.card-body -->
          <div class="card-footer">
            <small>Llenar todos los datos </small>
                    <br>                    
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="ASPxLabel"></dx:ASPxLabel>
          </div>
        </div>
        <!-- /.card -->


          <!-- CONTENT EXAMPLE -->
        <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">Devoluciones Pendientes de Imprimir               </h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              <button type="button" class="btn btn-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <div class="row">
              <div class="col-md-12">
                   <!-- /.form-group -->
                <div class="form-group">   
                     <dx:BootstrapGridView ID="BootstrapGridView1" ClientInstanceName="BootstrapGridView1" CssClasses-Control="table table-bordered table-striped" runat="server" KeyFieldName="CustomerID">
                </dx:BootstrapGridView>
                </div>
                <!-- /.form-group -->                
               
              </div>
              <!-- /.FIN col-md-12 -->
              
              <!-- /.col -->
            </div>
            <!-- /.row -->
          </div>
          <!-- /.card-body -->
          <div class="card-footer">
            <small>Activar impresora para imprimir las devoluciones pendientes</small><br>
          </div>
        </div>
        <!-- /.card -->

          </div>

        </section>
    <!--Fin-->
     <script type="text/javascript">
         function ReimprimirDev() {
             BootstrapGridView1.Refresh();
            // alert('listo');
         }
    </script>
</asp:Content>
