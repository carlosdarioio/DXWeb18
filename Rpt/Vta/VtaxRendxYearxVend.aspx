<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTest1.Master" AutoEventWireup="true" CodeBehind="VtaxRendxYearxVend.aspx.cs" Inherits="DXWeb18.Rpt.Vta.VtaxRendxYearxVend" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v18.1, Version=18.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <!--inicio-->

    <script type="text/javascript">
        //<ClientSideEvents KeyDown="function(s, e) { DoProcessEnterKey(e.htmlEvent); }" />
        /*function DoProcessEnterKey(htmlEvent) {
            if (htmlEvent.keyCode == 13) {
                ASPxClientUtils.PreventEventAndBubble(htmlEvent);                
                GridViewXX.Refresh();
            }
        }*/
    </script>
   <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- CONTENT EXAMPLE -->
        <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">Rendimiento x Vendedor</h3>
              
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
                     <!--FORM---------------------------------------------->
                       <dx:BootstrapFormLayout ID="FormLayout" runat="server" CssClasses-Control="form-group row">
                        <CssClasses Control="form-group row"></CssClasses>
                        <Items>
                            <dx:BootstrapLayoutItem Caption="Tipo" ColSpanMd="3">
                                <ContentCollection>
                                    <dx:ContentControl>                                        
                                        <dx:BootstrapComboBox ID="Tipo2" TextField="Code" ValueField="Code" runat="server"></dx:BootstrapComboBox>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem>

                            <dx:BootstrapLayoutItem Caption="Desde" ColSpanMd="3">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:BootstrapDateEdit ID="Desde" ClientInstanceName="Desde"  runat="server" EditFormat="Date"></dx:BootstrapDateEdit>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem>   
                            
                             <dx:BootstrapLayoutItem Caption="Hasta" ColSpanMd="3">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:BootstrapDateEdit ID="Hasta" ClientInstanceName="Hasta" runat="server"></dx:BootstrapDateEdit>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem>                                                    

                            <dx:BootstrapLayoutItem HorizontalAlign="Right" ShowCaption="False" ColSpanMd="3">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:BootstrapButton ID="btnBuscar" ClientInstanceName="btnBuscar" runat="server" Text="Buscar" SettingsBootstrap-RenderOption="Primary" AutoPostBack="False">
                                            <SettingsBootstrap RenderOption="Primary"></SettingsBootstrap>
                                                <ClientSideEvents Click="function(s, e) { wFCT(); }" />
                                            <CssClasses Icon="fa fa-check" />
                                        </dx:BootstrapButton>
                                        <dx:BootstrapButton ID="btnExportar" ClientInstanceName="btnExportar" runat="server" AutoPostBack="false" Text="Exportar" OnClick="btnExportar_Click">
                                            <ClientSideEvents Click="function(s, e) {    }" />
                                        </dx:BootstrapButton>
                                        
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem>

                        </Items>
                    </dx:BootstrapFormLayout>    
                      <!--FIN FORMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-->               
                </div>
                <!-- /.form-group -->                

                  <!-- /.form-group -->                
                  <div class="form-group">    
                        <!--Options-ShowInFilter="True"-->
                      <!--x aqui vas asele el conecioc sting conectalo y `pmerñe valore osea     here  DataSourceID="SqlDataSource1" CssClass="table table-bordered table-striped"-->
                      <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" ASPxPivotGridID="PivotGridViewXX" OptionsPrint-PrintRowFieldValues="False"   runat="server"></dx:ASPxPivotGridExporter>
                      <dx:ASPxPivotGrid ID="PivotGridViewXX"  ClientInstanceName="PivotGridViewXX"  runat="server"
                           ClientIDMode="AutoID" Width="100%" EnableTheming="True" Theme="Glass"
                           OptionsView-ShowColumnGrandTotals="False" OptionsView-ShowColumnTotals="False" 
                          OptionsView-ShowColumnGrandTotalHeader="False"  OptionsDataField-Area="RowArea"     >
                          
                          <Fields>

                              <dx:PivotGridField ID="fieldTipo" AreaIndex="0" FieldName="Tipo" Name="fieldTipo" Options-ShowInFilter="True">
                              </dx:PivotGridField>

                              <dx:PivotGridField ID="fieldTipoAlmacen"  AreaIndex="1" FieldName="TipoAlmacen" Name="fieldTipoAlmacen" Options-ShowInFilter="True">
                              </dx:PivotGridField>

                              <dx:PivotGridField ID="fieldTipoSucursal"  AreaIndex="2" FieldName="TipoSucursal" Name="fieldTipoSucursal" Options-ShowInFilter="True">
                              </dx:PivotGridField>

                              <dx:PivotGridField ID="fieldRado" AreaIndex="2" FieldName="Rado" Name="fieldRado" Options-ShowInFilter="True">
                              </dx:PivotGridField>
                              


                            

                              
                              
                              <dx:PivotGridField ID="fieldMonth" Area="ColumnArea" AreaIndex="0"
                                   GroupInterval="DateMonth" Caption="Month" 
                                   FieldName="FECHA" Name="fieldMonth" Visible="True">
                              </dx:PivotGridField>  
                              
                                <dx:PivotGridField ID="fieldFECHA2" Area="ColumnArea" AreaIndex="1"
                                    GroupInterval="DateYear" Caption="Year"
                                     FieldName="FECHA" Name="fieldFECHA2">
                              </dx:PivotGridField>                             

                              

                              <dx:PivotGridField ID="fieldVendedorFinal" Area="RowArea" AreaIndex="0" FieldName="VendedorFinal" Name="fieldVendedorFinal" Options-ShowInFilter="True">
                              </dx:PivotGridField>                           
                              
                              <dx:PivotGridField ID="fieldVenta" Area="DataArea" AreaIndex="0" FieldName="Venta" Name="fieldVenta" Options-ShowInFilter="True">
                              </dx:PivotGridField>
                              
                          </Fields>
                      </dx:ASPxPivotGrid>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RLAS400SyncSAPConnectionString %>" SelectCommand="CFVentaDeTiendaxRado" SelectCommandType="StoredProcedure">
                          <SelectParameters>
                              <asp:Parameter Name="Sucursal" Type="String" />
                              <asp:Parameter DbType="Date" Name="Desde" />
                              <asp:Parameter DbType="Date" Name="Hasta" />
                          </SelectParameters>
                      </asp:SqlDataSource>
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
            <h1><asp:Label ID="error" runat="server" Text=""></asp:Label></h1>
          </div>
        </div>
        <!-- /.card -->
          </div>

        </section>
    <!--Fin-->
    <script type="text/javascript">          
        function wFCT() {            GridViewXX.Refresh();        }
    </script>

</asp:Content>
