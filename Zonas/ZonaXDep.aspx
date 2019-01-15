<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTest1.Master" AutoEventWireup="true" CodeBehind="ZonaXDep.aspx.cs" Inherits="DXWeb18.Zonas.ZonaXDep" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script type="text/javascript">
        var lastCountry = null;

       
       

    </script>

 

     <section class="content">
      <div class="container-fluid">
        <!-- CONTENT EXAMPLE -->
        <div class="card card-default">
          <div class="card-header">
            <h3 class="box-title">Zonas x Departamentos</h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              <button type="button" class="btn btn-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
              Especificar Departamento
            <div class="row">
              <div class="col-md-12">
                   <!-- /.form-group -->
                <div class="form-group">     
                     <dx:BootstrapFormLayout ID="BootstrapFormLayout1" runat="server" CssClasses-Control="form-group row">
                        <CssClasses Control="form-group row"></CssClasses>
                        <Items>
                            <dx:BootstrapLayoutItem Caption="Departamentos" ColSpanMd="8" HelpText="Seleccionar/Especificar Departamento">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:BootstrapComboBox ID="tipo"  TextField="Name" ValueField="Name" runat="server" SelectedIndex="0">                                           
                                        </dx:BootstrapComboBox>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem>

                            <dx:BootstrapLayoutItem HorizontalAlign="Right" ShowCaption="False" ColSpanMd="3">
                                <ContentCollection>
                                    <dx:ContentControl>
<%--                                        <dx:BootstrapButton ID="BootstrapButton1" runat="server" Text="Buscar" SettingsBootstrap-RenderOption="Primary" AutoPostBack="false"   ClientSideEvents-Click="myFunction()">
                                            <SettingsBootstrap RenderOption="Primary"></SettingsBootstrap>
                                            <ClientSideEvents Click="function(s, e) { e.processOnServer = ASPxClientEdit.ValidateGroup('Validation');myFunction() }" />
                                            <CssClasses Icon="fa fa-check" />
                                        </dx:BootstrapButton>--%>
                                          <button type="button" class="btn btn-primary dxbs-button" onclick="myFunction()"><li class="fa fa-check"></li> Buscar</button>                                         
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
            <small>Especificar todos los datos </small>
                    <br>                    
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=""></dx:ASPxLabel>
          </div>
        </div>
        <!-- /.card -->

          </div>





          <div class="container-fluid">
        <!-- CONTENT EXAMPLE -->
        <div class="card card-default">
          <div class="card-header">
            <h3 class="box-title">Zonas y ciudades asignadas al Departamento seleccionado</h3>

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
                     <dx:BootstrapGridView ID="GridViewReimpEntre" ClientInstanceName="GridViewReimpEntre" CssClasses-Control="table table-bordered table-striped" runat="server" KeyFieldName="CustomerID">
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
            <small>Si la Zona no aparece en la Departamento seleccionado es porque no esta asignado a dicho Departamento</small><br>
            
          </div>
        </div>
        <!-- /.card -->

          </div>

        </section>
    <!--Fin-->

       <script type="text/javascript">     
           function myFunction()
           {                        
                GridViewReimpEntre.Refresh();
           }
    </script>
</asp:Content>
