<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTest1.Master" AutoEventWireup="true" CodeBehind="CEGuia.aspx.cs" Inherits="DXWeb18.Bodega.CEGuia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content">
            <!--lllllllllllllllllllllllllllllll--->
            <div class="box">
            <div class="box-header">
                <h3 class="box-title">CAMBIAR ESTADO GUIA   </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <%--NavigateUrlFormatString="~\VerDxF.aspx?Id={0}" --%>
                <dx:BootstrapGridView ID="GridViewGuias" ClientInstanceName="GridViewGuias" CssClasses-Control="table table-bordered table-striped" runat="server" KeyFieldName="GUIA">
                      <Columns>                        
                        <dx:BootstrapGridViewHyperLinkColumn FieldName="GUIA"   CssClasses-HeaderCell="table-striped" >   
                            <DataItemTemplate>
                                    <a onclick="CGuia(<%# Eval("GUIA") %>)"><%# Eval("GUIA") %></a>
                            </DataItemTemplate>                    
                        </dx:BootstrapGridViewHyperLinkColumn>                                                                 
                        <dx:BootstrapGridViewDataColumn FieldName="CAMION"  >                           
                        </dx:BootstrapGridViewDataColumn>
                        <dx:BootstrapGridViewDataColumn FieldName="Motorista" />
                        <dx:BootstrapGridViewDataColumn FieldName="FECHA" />
                        <dx:BootstrapGridViewDataColumn FieldName="EstadoGuia" />                                                                              
                   </Columns>
                </dx:BootstrapGridView>
            </div>
                <div class="box-footer">            
            <a id="aaa" data-toggle="modal" data-target="#modal-default"></a>
        </div>            
        </div>
        <!-- /.box -->
            <!--1111111111111111111111111111111111-->




            <div class="row">      
      </div>
        <div class="modal fade" id="modal-default">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Retroceder Guia</h4>
              </div>
              <div class="modal-body">
                  <p class="lead" id="tem"></p>
                  <small>Cualquier guia retrocedida tendra que volver a ser autorizada &hellip;</small>
                  <div><input type="hidden" id="one" value="999999"></div>
                  <br>                  
                  <div class="btn btn-block btn-primary" onclick="UpdateG(0)">Abierta (Entregas Guia)</div>
                  <button type="button" class="btn btn-block btn-success" onclick="UpdateG(2)">Realizar Recoleccion/Picking(Entregas En Guia)</button>
              </div>
              <div class="modal-footer">               
                <button type="button" id="cls" class="btn btn-block btn-warning pull-left" data-dismiss="modal">Cerrar</button>                
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
       <!-------------------------------------------->


<!-- fin tableeeeeeeeeeeeeeeeeeee-->
    </section>

 <script type="text/javascript">

     function ALOLA() {
         alert("hoy compro el iphone8 ");
     }
     var guia1 = $('#input').val();
     function CGuia(gu) {
         $.ajax({
             type: 'POST',
             cache: 'false',
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             url: 'CEGuia.aspx/GetData',
             // data: { guia: '20' },
             data: JSON.stringify({ guia: gu }),
             success: function (response) {
                 var names = response.d;
                 //var names = '';
                 var result = JSON.parse(response.d);

                 $("#one").val(result["1"]);
                 $("#tem").html(result["1"]);
                 $("#aaa").click();

                 /*alert(names);
                 alert(result["1"]);
                 alert(result["2"]);*/
             },
             error: function (response) {
                 alert("error2 " + response);
             }
         });

     }

     function UpdateG(estado1) {
         //alert(gu);
         //alert($("#one").val());
         var gia = $("#one").val();
         $.ajax({
             type: 'POST',
             cache: 'false',
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             url: 'CEGuia.aspx/UpdateData',
             // data: { guia: '20' },
             data: JSON.stringify({ guia: gia, estado: estado1 }),
             success: function (response) {
                 // window.location.reload(); // This is not jQuery but simple plain ol' JS  
                 $("#cls").click();
                 GridViewGuias.Refresh();
             },
             error: function (response) {
                 alert("error2 " + response);
             }
         });
     }
     //});
 </script>
        
   <script type="text/javascript">
       $(document).ready(function () {
           $('#example1').DataTable();
       });
	</script>
</asp:Content>
