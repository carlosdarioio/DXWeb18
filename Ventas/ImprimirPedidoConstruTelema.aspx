<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTest1.Master" AutoEventWireup="true" CodeBehind="ImprimirPedidoConstruTelema.aspx.cs" Inherits="DXWeb18.Ventas.ImprimirPedidoConstruTelema" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!--inicio-->
   <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- CONTENT EXAMPLE -->
        <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">Imprimir Pedido construcentro telemarketing</h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              <button type="button" class="btn btn-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
              Especificar numero de pedidos que imprimira. s
            <div class="row">
              <div class="col-md-12">
                   <!-- /.form-group -->
                <div class="form-group">  
                      <dx:BootstrapFormLayout ID="BootstrapFormLayout1" runat="server" CssClasses-Control="form-group row">
                         <Items>                          

                             

                        <dx:BootstrapLayoutItem Caption="Cantidad" ColSpanMd="8">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:BootstrapTextBox ID="numero" runat="server" Text="10" HelpText="Minimo:10 Maximo:50">
                                         <ValidationSettings ValidationGroup="Validation">
                                            <RequiredField IsRequired="true" ErrorText="Requiere Escecificar Cantidad" />
                                            <RegularExpression ValidationExpression="[0-9]{2}\b" ErrorText="Digitar Solo Numeros" />
                                        </ValidationSettings>    
                                        </dx:BootstrapTextBox>
                                    </dx:ContentControl>
                                </ContentCollection>
                         </dx:BootstrapLayoutItem>


                            <dx:BootstrapLayoutItem HorizontalAlign="Right" ShowCaption="False" ColSpanMd="3">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:BootstrapButton ID="btnOrdComb" runat="server" Text="Imprimir" SettingsBootstrap-RenderOption="Primary" AutoPostBack="true">
                                            <SettingsBootstrap RenderOption="Primary"></SettingsBootstrap>
                                            <ClientSideEvents Click="function(s, e) { e.processOnServer = ASPxClientEdit.ValidateGroup('Validation'); }" />
                                            <CssClasses Icon="fa fa-circle" />
                                        </dx:BootstrapButton>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem></Items>
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

            <small>La cantidad maxima de ordenes de combustible que se pueden imprimir son 50    </small>
                    <br>                    
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=""></dx:ASPxLabel>
          </div>
        </div>
        <!-- /.card -->



          <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">Pedidos Pendientes de Imprimir</h3>

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
                    <dx:BootstrapGridView ID="GridViewOrdCons" CssClasses-Control="table table-bordered table-striped" runat="server" KeyFieldName="CustomerID">
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
              <small>Activar impresora para imprimir los Pedidos  pendientes</small><br>
          </div>
        </div>
        <!-- /.card -->

          </div>

        </section>
    <!--Fin-->
</asp:Content>
