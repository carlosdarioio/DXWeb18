<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTest1.Master" AutoEventWireup="true" CodeBehind="ReimpEntxGuia.aspx.cs" Inherits="DXWeb18.Bodega.ReimpEntxGuia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script type="text/javascript">
          //<ClientSideEvents KeyDown="function(s, e) { DoProcessEnterKey(e.htmlEvent); }" />
          function DoProcessEnterKey(htmlEvent) {
              if (htmlEvent.keyCode == 13) {
                  ASPxClientUtils.PreventEventAndBubble(htmlEvent);
                  wFCT();
                  //btnBuscar.click();
              }
          }
    </script>
      <!--inicio-->
   <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- CONTENT EXAMPLE -->
        <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">Reimprimir Entrega x Guia</h3>
              <small>Para reimprimir Entrega poner numero de guia y dar clic en el numero que deseen imprmir al hacerlo les saldra un mensaje confirmando la impresion.</small>

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

                       <dx:BootstrapFormLayout ID="BootstrapFormLayout1" runat="server" CssClasses-Control="form-group row">
                        <CssClasses Control="form-group row"></CssClasses>
                        <Items>                                                       

                            <dx:BootstrapLayoutItem Caption="Numero de Guia" ColSpanMd="8">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:BootstrapTextBox ID="numero" runat="server" Text="" HelpText="Ejemplo: 3247" MaskSettings-ErrorText="">
                                         <ValidationSettings ValidationGroup="Validation">
                                            <RequiredField IsRequired="true" ErrorText="No puede quedar Vacio" />                                            
                                        </ValidationSettings>   
                                            <ClientSideEvents KeyDown="function(s, e) { DoProcessEnterKey(e.htmlEvent); }" /> 
                                        </dx:BootstrapTextBox>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem>


                            <dx:BootstrapLayoutItem HorizontalAlign="Right" ShowCaption="False" ColSpanMd="3">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:BootstrapButton ID="BootstrapButton1" ClientInstanceName="btnBuscar" runat="server" Text="Buscar" SettingsBootstrap-RenderOption="Primary" AutoPostBack="true" OnClick="BootstrapButton1_Click">
                                            <SettingsBootstrap RenderOption="Primary"></SettingsBootstrap>
                                            <ClientSideEvents Click="function(s, e) { e.processOnServer = ASPxClientEdit.ValidateGroup('Validation'); wFCT(); } " />
                                            <CssClasses Icon="fa fa-check" />
                                        </dx:BootstrapButton>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem>

                        </Items>
                    </dx:BootstrapFormLayout>    
                      <!--FIN FORMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-->

                  </div>

                  </div>
                      <!-- /.form-group -->
                  <br />

                  <div class="col-md-12">
                <!-- /.form-group -->
                <div class="form-group">                  
                  <dx:BootstrapGridView ID="GridViewEntGuias" ClientInstanceName="GridViewEntGuias" CssClasses-Control="table table-bordered table-striped" runat="server" KeyFieldName="GUIA">
                      <Columns>     
                          <dx:BootstrapGridViewDataColumn FieldName="Guia"  />                                                   
                          <dx:BootstrapGridViewDataColumn FieldName="Camion" />
                        <dx:BootstrapGridViewHyperLinkColumn FieldName="Entrega"   CssClasses-HeaderCell="table-striped" >   
                            <DataItemTemplate>
                                    <a onclick="Reimprimir('<%# Eval("Entrega") %>','<%# Eval("Fecha") %>','<%# Eval("Impresora") %>')"><%# Eval("Entrega") %></a>
                            </DataItemTemplate>                    
                        </dx:BootstrapGridViewHyperLinkColumn>                                                                                         
                        <dx:BootstrapGridViewDataColumn FieldName="Cliente" />                                                                              
                        <dx:BootstrapGridViewDataColumn FieldName="Usuario" /> 
                          <dx:BootstrapGridViewDataColumn FieldName="Fecha" />                                                                             
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
            <small>Activar impresora para imprimir las Entregas pendientes</small><br>
              <a id="aaa" data-toggle="modal" data-target="#modal-default"></a>
              <h1>Skull</h1>
               <dx:BootstrapGridView ID="GridViewDR" ClientInstanceName="GridViewDR" CssClasses-Control="table table-bordered table-striped" runat="server" KeyFieldName="CustomerID">
                </dx:BootstrapGridView>
          </div>
        </div>
        <!-- /.card -->

          </div>

        </section>
    <!--Fin-->

    <script type="text/javascript">

        function wFCT() {
            GridViewEntGuias.Refresh();
        }


        var guia1 = $('#input').val();
        function Reimprimir(entrega, fecha, impresora) {
            
            $.ajax({
                type: 'POST',
                cache: 'false',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                url: 'ReimpEntxGuia.aspx/GetData',
                data: JSON.stringify({ Entrega: entrega, Fecha: fecha, Impresora: impresora }),
                success: function (response) {
                    var result = JSON.parse(response.d);
                    GridViewDR.Refresh();
                    //alert(result["1"]);
                },
                error: function (response) {
                    alert("error2 " + response.d);
                }
            });

        }


 </script>
        
   <script type="text/javascript">
       $(document).ready(function () {
           $('#example1').DataTable();
       });
	</script>
</asp:Content>
