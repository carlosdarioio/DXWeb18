<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Calendario.aspx.cs" Inherits="Calendario" %>

<%@ Register assembly="DevExpress.XtraScheduler.v18.1.Core, Version=18.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraScheduler" tagprefix="cc1" %>
<%@ Register assembly="DevExpress.Web.ASPxScheduler.v18.1, Version=18.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler" tagprefix="dxwschs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
     <div class="jumbotron">
      <div class="container">
        
          <div class="row" >

              <div class="col-md-9" >
                  <h1 class="city">Calendario</h1>  
                
              <div class="weather-info">
                  <p class="lead">Orden cronológico de actividades a organizar.
                  </p>
              </div>

              </div>   

              <div class="col-md-3" >
                  <img src="Images/mar1.png" class="img-thumbnail " />

                  

              </div>   

          </div>   

            
      </div>
    </div>
    <div class="container">

      <div class="row">
          <div class="col-12">
                 
             
              <!-------------------------------------------------------------------------------------->
        <dx:BootstrapScheduler ID="BootstrapScheduler2" runat="server"  AppointmentDataSourceID="SqlDataSource2Z" ClientIDMode="AutoID" ActiveViewType="Month"  > 
        <Views>
            <DayView Enabled="true" />
            <WorkWeekView Enabled="true" />
            <WeekView Enabled="true" />
            <MonthView Enabled="true" />
            <TimelineView Enabled="true" />
            <AgendaView Enabled="true">                
            </AgendaView>    
        </Views>                          
        <Storage>
        <Appointments AutoRetrieveId="true">
            <Mappings AppointmentId = "ID" Start = "StartTime" End = "EndTime" Subject = "Subject"
                Description = "Description" Location = "Location" />
        </Appointments>
        </Storage>                 
            </dx:BootstrapScheduler>          
           
<asp:SqlDataSource ID="SqlDataSource2Z" runat="server" 
ConnectionString="<%$ ConnectionStrings:alolaConnectionString %>"
SelectCommand="SELECT [ID], [StartTime], [EndTime], [Subject], [Description], [Location] FROM [CfCalEventSch]"
></asp:SqlDataSource>    
<!-------------------------------------------------------------------------------------------->    
              

             </div>       
     </div>

     </div>
   
</asp:Content>

