<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Telefonos.aspx.cs" Inherits="Telefonos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <div class="jumbotron">
      <div class="container">     
            <h1 class="city">Telefonos</h1>                  
              <div class="weather-info">
                  <p class="lead">Lista de todos los telefonos internos de la empresa.</p>
              </div>
      </div>
    </div>  
    <div class="container">        
            <!-- -->   

        <!---->
       
            <dx:BootstrapGridView ID="BootstrapGridView1"  runat="server">
             <Columns>
                 <dx:BootstrapGridViewCommandColumn VisibleIndex="0">
                 </dx:BootstrapGridViewCommandColumn>
                 <dx:BootstrapGridViewDataColumn FieldName="departamento" />    
                 <dx:BootstrapGridViewDataColumn FieldName="puesto" />
                 <dx:BootstrapGridViewDataColumn FieldName="numero" />
                 <dx:BootstrapGridViewDataColumn FieldName="nombre" />    
             </Columns>
             <SettingsSearchPanel Visible="True" />
            
            </dx:BootstrapGridView>         
     </div>
    <script type="text/javascript">
        $(document).ready(function ()
        { 

        });//document ready
	</script>

</asp:Content>

