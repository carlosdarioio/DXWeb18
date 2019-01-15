<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTest1.Master" AutoEventWireup="true" CodeBehind="NCxTienda.aspx.cs" Inherits="DXWeb18.Rpt.Vta.NCxTienda" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v18.1, Version=18.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <!--inicio-->

   <!-- Main content -->

    <section class="content">

      <div class="container-fluid">

        <!-- CONTENT EXAMPLE -->

        <div class="card card-default">

          <div class="card-header">

            <h3 class="card-title">NC x Tienda</h3>

             

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

                                        <dx:BootstrapDateEdit ID="Desde" ClientInstanceName="Desde" runat="server"></dx:BootstrapDateEdit>

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

                                            <ClientSideEvents Click="function(s, e) {  alert('Exportar');  }" />

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

                               <dx:PivotGridField ID="fieldCodigo"
                                   AreaIndex="1"  FieldName="Codigo" Name="fieldCodigo" 
                                  Options-ShowInFilter="True">
                              </dx:PivotGridField>

                              <dx:PivotGridField ID="fieldARTFAC"
                                   AreaIndex="8" 
                                   FieldName="ARTFAC" Name="fieldARTFAC" 
                                  Options-ShowInFilter="True">
                              </dx:PivotGridField>
                                <dx:PivotGridField ID="fieldARTNC"
                                   AreaIndex="5" 
                                   FieldName="ARTNC" Name="fieldARTNC" 
                                  Options-ShowInFilter="True">
                              </dx:PivotGridField>


 

                              <dx:PivotGridField ID="fieldSucursal" Area="ColumnArea" AreaIndex="0" FieldName="Sucursal" Name="fieldSucursal" Options-ShowInFilter="True">

                              </dx:PivotGridField>  

                              <dx:PivotGridField ID="fieldFECHA"

                                   Area="ColumnArea" AreaIndex="1"

                                   GroupInterval="DateYear" Caption="Year" 

                                  FieldName="FECHA" Name="fieldFECHA" visible="True" SortOrder="Descending">

                              </dx:PivotGridField>


                             



                             

                             

                             
                              

                              <dx:PivotGridField ID="fieldAsesor"
                                   AreaIndex="0" Area="RowArea"
                                   FieldName="Asesor" Name="fieldAsesor" 
                                  Options-ShowInFilter="True">
                              </dx:PivotGridField>

                              <dx:PivotGridField ID="fieldAutor"
                                   AreaIndex="1" Area="RowArea"
                                   FieldName="Autor" Name="fieldAutor" 
                                  Options-ShowInFilter="True">
                              </dx:PivotGridField>

                               <dx:PivotGridField ID="fieldNombre"
                                   AreaIndex="2" Area="RowArea"
                                   FieldName="Nombre" Name="fieldNombre" 
                                  Options-ShowInFilter="True">
                              </dx:PivotGridField>

                               <dx:PivotGridField ID="fieldFECHANC" CellFormat-FormatString="d" CellFormat-FormatType="DateTime"
                                   AreaIndex="3" Area="RowArea"
                                   FieldName="FECHANC" Name="fieldFECHANC" 
                                  Options-ShowInFilter="True">
                              </dx:PivotGridField>

 
                              <dx:PivotGridField ID="fieldNC"
                                   AreaIndex="4" Area="RowArea"
                                   FieldName="NC" Name="fieldNC" 
                                  Options-ShowInFilter="True">
                              </dx:PivotGridField>

                            

                               <dx:PivotGridField ID="fieldFECHAFAC"
                                   AreaIndex="6" Area="RowArea"
                                   FieldName="FECHAFAC" Name="fieldFECHAFAC" CellFormat-FormatString="d" CellFormat-FormatType="DateTime" 
                                  Options-ShowInFilter="True" ValueFormat-FormatString="d" ValueFormat-FormatType="DateTime">
                              </dx:PivotGridField>


                              <dx:PivotGridField ID="fieldFactura"
                                   AreaIndex="7" Area="RowArea"
                                   FieldName="Factura" Name="fieldFactura" 
                                  Options-ShowInFilter="True">
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