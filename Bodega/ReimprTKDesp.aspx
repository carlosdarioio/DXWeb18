<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTest1.Master" AutoEventWireup="true" CodeBehind="ReimprTKDesp.aspx.cs" Inherits="DXWeb18.Bodega.ReimprTKDesp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!--inicio-->
   <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- CONTENT EXAMPLE -->
        <div class="card card-default">
          <div class="card-header">
            <h3 class="box-title">REIMPRIMIR TICKET DESPACHO</h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              <button type="button" class="btn btn-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
              Seleccionar Impresora y Especificar numero Factura. 
            <div class="row">
              <div class="col-md-12">
                   <!-- /.form-group -->
                <div class="form-group">  
                     <!-- /.box-body -->
                <div class="box-body">
                    <dx:BootstrapFormLayout ID="BootstrapFormLayout1" runat="server" CssClasses-Control="form-group row">
                        <CssClasses Control="form-group row"></CssClasses>
                        <Items>
                            <dx:BootstrapLayoutItem Caption="Impresora" ColSpanMd="8" HelpText="Numeracion Que Ingresara">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:BootstrapComboBox ID="impresora" runat="server" SelectedIndex="0">
                                            <Items>
                                                <dx:BootstrapListEditItem Value="026TICKET" Text="TICKET BODEGA 026" />
                                                <dx:BootstrapListEditItem Value="081TICKET" Text="TICKET BODEGA 081" />
                                            </Items>
                                        </dx:BootstrapComboBox>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem>
                           

                            <dx:BootstrapLayoutItem Caption="Numero de Factura" ColSpanMd="8">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:BootstrapTextBox ID="numero" runat="server" Text="" MaskSettings-ErrorText="">
                                         <ValidationSettings ValidationGroup="Validation">
                                            <RequiredField IsRequired="true" ErrorText="No puede quedar Vacio" />
                                            <%--<RegularExpression ValidationExpression="[0-9]" ErrorText="Digitar Solo Numeros" />--%>
                                        </ValidationSettings>    
                                        </dx:BootstrapTextBox>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem>


                            <dx:BootstrapLayoutItem HorizontalAlign="Right" ShowCaption="False" ColSpanMd="3">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:BootstrapButton ID="BootstrapButton1" runat="server" Text="ReImprimir" SettingsBootstrap-RenderOption="Primary" AutoPostBack="true">
                                            <SettingsBootstrap RenderOption="Primary"></SettingsBootstrap>
                                            <ClientSideEvents Click="function(s, e) { e.processOnServer = ASPxClientEdit.ValidateGroup('Validation'); }" />
                                            <CssClasses Icon="fa fa-check" />
                                        </dx:BootstrapButton>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem>

                        </Items>
                    </dx:BootstrapFormLayout>
                </div>
                <!-- /fin .box-body -->
                     <div class="box-footer">
                    <small>Llenar todos los datos </small>
                    <br>                    
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=""></dx:ASPxLabel>
                </div>
                <!-- /.box-footer -->
            </div>
                                    
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
            <div class="box">
            <div class="box-header">
                <h3 class="box-title">Tickets Pendientes de Imprimir</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <%--<asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" runat="server"></asp:GridView>--%>
                <dx:BootstrapGridView ID="GridViewTKDesp" CssClasses-Control="table table-bordered table-striped" runat="server" KeyFieldName="CustomerID">
                </dx:BootstrapGridView>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <small>Activar impresora para imprimir los Tickets pendientes</small><br>
            </div>
        </div>
          </div>
        </div>
        <!-- /.card -->

          </div>

        </section>
    <!--Fin-->
</asp:Content>
