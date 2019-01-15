<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTest1.Master" AutoEventWireup="true" CodeBehind="1rptblanco.aspx.cs" Inherits="DXWeb18.Rpt._1rptblanco" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <!--inicio-->

    <script type="text/javascript">
        //<ClientSideEvents KeyDown="function(s, e) { DoProcessEnterKey(e.htmlEvent); }" />
        function DoProcessEnterKey(htmlEvent) {
            if (htmlEvent.keyCode == 13) {
                ASPxClientUtils.PreventEventAndBubble(htmlEvent);                
                GridViewXX.Refresh();
            }
        }
    </script>
   <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- CONTENT EXAMPLE -->
        <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">TEMA</h3>

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
                                        <dx:BootstrapComboBox ID="Tipo" ClientInstanceName="Tipo" runat="server"></dx:BootstrapComboBox>
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
                                        <dx:BootstrapButton ID="btnExportar" ClientInstanceName="btnExportar" runat="server" AutoPostBack="false" Text="Exportar">
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
                    <dx:BootstrapGridView ID="GridViewXX" ClientInstanceName="GridViewXX" CssClasses-Control="table table-bordered table-striped" runat="server">
                        <Columns>                                                                       
                            <dx:BootstrapGridViewDataColumn FieldName="xx" />
                            <dx:BootstrapGridViewHyperLinkColumn FieldName="xx2"   CssClasses-HeaderCell="table-striped"  HeaderBadge-CssClass=" alert-danger ">   
                            <DataItemTemplate>
                                    <a onclick="getDocEntry(<%# Eval("DocEntry") %>,<%# Eval("xx2") %>,'<%# Eval("CLIENTE") %>')" class="alert-link"><%# Eval("xx2") %></a>
                            </DataItemTemplate>                    
                        </dx:BootstrapGridViewHyperLinkColumn>
                        </Columns>
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
