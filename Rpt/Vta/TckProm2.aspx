<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTest1.Master" AutoEventWireup="true" CodeBehind="TckProm2.aspx.cs" Inherits="DXWeb18.Rpt.Vta.TckProm2" %>
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
            <h3 class="card-title">Ticket Promedio2</h3>
              
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

                              <dx:PivotGridField ID="fieldTipo" AreaIndex="1" FieldName="Tipo" Name="fieldTipo" Options-ShowInFilter="True">
                              </dx:PivotGridField>


                              
                              <dx:PivotGridField ID="fieldVenta" Area="DataArea" AreaIndex="0"
                                    Caption="Venta" FieldName="Venta" Name="fieldVenta">
                              </dx:PivotGridField>

                              <dx:PivotGridField ID="fieldTicket" Area="DataArea" AreaIndex="1"
                                    Caption="Ticket" 
                                   FieldName="Ticket" Name="fieldTicket">
                              </dx:PivotGridField>

                              <dx:PivotGridField ID="fieldTicketPromedio" Area="DataArea" AreaIndex="2"
                                    Caption="TicketPromedio" FieldName="TicketPromedio" Name="fieldTicketPromedio">
                              </dx:PivotGridField>

                              <dx:PivotGridField ID="fieldArticulos" Area="DataArea" AreaIndex="4"
                                    Caption="#Articulos" FieldName="#Articulos" Name="fieldArticulos">
                              </dx:PivotGridField>

                              

                              

                             

                              
                              
                              <dx:PivotGridField ID="fieldFECHA" Area="RowArea"
                                   AreaIndex="0" FieldName="FECHA" Name="fieldFECHA" Options-ShowInFilter="True">
                              </dx:PivotGridField> 
                              

                              <dx:PivotGridField ID="fieldSucursal" Area="ColumnArea" AreaIndex="0" FieldName="Sucursal" Name="fieldSucursal" Options-ShowInFilter="True">
                              </dx:PivotGridField>   
                              
                              <dx:PivotGridField ID="fieldFECHA2" Area="ColumnArea" GroupInterval="DateYear" AreaIndex="1" FieldName="FECHA" Name="fieldFECHA2" Options-ShowInFilter="True">
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
