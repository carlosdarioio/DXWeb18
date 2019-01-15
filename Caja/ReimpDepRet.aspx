<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTest1.Master" AutoEventWireup="true" CodeBehind="ReimpDepRet.aspx.cs" Inherits="DXWeb18.Caja.ReimpDepRet" %>
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
            <h3 class="card-title">Reimprimir Retiro / Deposito</h3>
              <small>Para reimprimir Retiro/Deposito dar clic en el numero que deseen imprmir al hacerlo les saldra un mensaje confirmacion la impresion.</small>

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

                            <dx:BootstrapLayoutItem Caption="Numero de X/Z" ColSpanMd="8">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:BootstrapTextBox ID="numero" runat="server" Text="" HelpText="Ejemplo: FMSPS01-504" MaskSettings-ErrorText="">
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
                  <dx:BootstrapGridView ID="GridViewGuias" ClientInstanceName="GridViewGuias" CssClasses-Control="table table-bordered table-striped" runat="server" KeyFieldName="GUIA">
                      <Columns>     
                          <dx:BootstrapGridViewDataColumn FieldName="Tipo"  >                           
                        </dx:BootstrapGridViewDataColumn>
                                           
                        <dx:BootstrapGridViewHyperLinkColumn FieldName="NUM"   CssClasses-HeaderCell="table-striped" >   
                            <DataItemTemplate>
                                    <a onclick="Reimprimir(<%# Eval("NUM") %>,'<%# Eval("Tipo") %>','<%# Eval("FECHA", "{0:yyyyMMdd}") %>')"><%# Eval("NUM") %></a>
                            </DataItemTemplate>                    
                        </dx:BootstrapGridViewHyperLinkColumn>                                                                 
                        <%--<dx:BootstrapGridViewDataColumn FieldName="" />--%>
                        <dx:BootstrapGridViewDataColumn FieldName="FECHA" />
                        <dx:BootstrapGridViewDataColumn FieldName="TOTAL" />                                                                              
                        <dx:BootstrapGridViewDataColumn FieldName="USUARIO" />                                                                              
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
            <small>Activar impresora para imprimir lOs Deposito/Retiros pendientes</small><br>
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
            GridViewGuias.Refresh();            
        }


        var guia1 = $('#input').val();
        function Reimprimir(num, tp,f) {
            //alert(num);
            //alert(tp);
           // alert(f);
            
                $.ajax({
                type: 'POST',
                cache: 'false',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                url: 'ReimpDepRet.aspx/GetData',                
                data: JSON.stringify({ Tipo: tp, Factura:num,Fecha:f }),
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
