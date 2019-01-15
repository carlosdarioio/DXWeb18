<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTest1.Master" AutoEventWireup="true" CodeBehind="ImpOrdComb.aspx.cs" Inherits="DXWeb18.Bodega.ImpOrdComb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--inicio-->
   <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- CONTENT EXAMPLE -->
        <div class="card card-default">
          <div class="card-header">
            <h3 class="box-title">IMPRIMIR ORDEN DE COMBUSTIBLE</h3>

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
                    <!----->
                     <!-- Default box -->
        <div class="box">            
            <div class="box-body">
                Especificar CANTIDAD
            <div class="form-horizontal">
                <!-- /.box-body -->
                <div class="box-body">
                    <dx:BootstrapFormLayout ID="BootstrapFormLayout1" runat="server" CssClasses-Control="form-group row">
                         <Items>
                            

                             <dx:BootstrapLayoutItem Caption="Formato" ColSpanMd="8" HelpText="Seleccionar Formato Que Imprimira    ">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:BootstrapComboBox ID="Impresora" runat="server" SelectedIndex="0">
                                            <Items>                                                
                                                <dx:BootstrapListEditItem Text="FEMOSA" Value="OCFM" Selected="True" />
                                                <dx:BootstrapListEditItem  Text="TRANSPORTES" Value="OCTM" />
                                                
                                            </Items>
                                        </dx:BootstrapComboBox>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem>

                        <dx:BootstrapLayoutItem Caption="Cantidad" ColSpanMd="8">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:BootstrapTextBox ID="numero" runat="server" Text="10" HelpText="Minimo:1 Maximo:50">
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
                                       <%-- <dx:BootstrapButton ID="btnOrdComb" runat="server" Text="Imprimir" SettingsBootstrap-RenderOption="Primary" AutoPostBack="true">
                                            <SettingsBootstrap RenderOption="Primary"></SettingsBootstrap>
                                            <ClientSideEvents Click="function(s, e) { e.processOnServer = ASPxClientEdit.ValidateGroup('Validation'); }" />
                                            <CssClasses Icon="fa fa-circle" />
                                        </dx:BootstrapButton>--%>
                                        <button type="button" class="btn btn-primary dxbs-button" onclick="OrdComb()"><li class="fa fa-check"></li> Imprimir</button>                                         
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem></Items>
                    </dx:BootstrapFormLayout>
                </div>
                <!-- /fin .box-body -->

                <div class="box-footer">
                    <small>La cantidad maxima de ordenes de combustible que se pueden imprimir son 50    </small>
                    <br>                    
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=""></dx:ASPxLabel>
                </div>
                <!-- /.box-footer -->
            </div>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->

       
                    <!----->              
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
                <h3 class="box-title">Ordenes de Combustible Pendientes de Imprimir</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">                
                <dx:BootstrapGridView ID="GridViewOrdComb" ClientInstanceName="GridViewOrdComb" CssClasses-Control="table table-bordered table-striped" runat="server" KeyFieldName="CustomerID">
                </dx:BootstrapGridView>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <small>Activar impresora para imprimir las Ordenes de combustible pendientes</small><br>
            </div>
        </div>
        <!-- /.box -->
          </div>
        </div>
        <!-- /.card -->

          </div>

        </section>
    <!--Fin-->
    
    <script type="text/javascript">
        function OrdComb() {
            GridViewOrdComb.Refresh();
        }
    </script>
</asp:Content>
