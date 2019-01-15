<%@ Page Title="" Language="C#" MasterPageFile="~/SiteTest1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DXWeb18.Rpt.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Reportes</h1>

    <% try
        {  %>
    <a target="_blank" href="Vta/VtaXRado.aspx?user=<%:HttpContext.Current.Request.Url.Query.Split('=')[1].ToString() %>">Venta X Rado</a><br />

    <a target="_blank" href="Comprs/VtaXProvXCanal.aspx?user=<%:HttpContext.Current.Request.Url.Query.Split('=')[1].ToString() %>">Venta X Proveedor</a><br />

    <a target="_blank" href="Fora/VtaXRutXCl.aspx?user=<%:HttpContext.Current.Request.Url.Query.Split('=')[1].ToString() %>">Venta X Ruta</a><br />

    <a target="_blank" href="Vta/TckProm.aspx?user=<%:HttpContext.Current.Request.Url.Query.Split('=')[1].ToString() %>">Ticket Promemdio</a><br />

    <a target="_blank" href="Vta/VtaXCartDeVendedor.aspx?user=<%:HttpContext.Current.Request.Url.Query.Split('=')[1].ToString() %>">Venta X Cartera De Vendedor</a><br />

    <a target="_blank" href="Vta/VtaxTiendxTpDescDado.aspx?user=<%:HttpContext.Current.Request.Url.Query.Split('=')[1].ToString() %>">Venta x Tiend x Tipo De Descuento</a><br />
    
    <a target="_blank" href="Vta/VtaxRendxYearxVend.aspx?user=<%:HttpContext.Current.Request.Url.Query.Split('=')[1].ToString() %>">Rendimiento x Year x Vendedor</a><br />

    <a target="_blank" href="Vta/VtaXRentaXVndor.aspx?user=<%:HttpContext.Current.Request.Url.Query.Split('=')[1].ToString() %>">Renta X Vendedor</a><br />

    <a target="_blank"href="Vta/TckProm2.aspx?user=<%:HttpContext.Current.Request.Url.Query.Split('=')[1].ToString() %>">Ticket Promedio V2</a><br />
    <% 
        }
        catch (Exception e)
        {
            error.Text = "Usuario no establecido ";

        }
         %>
    
    
     <div class="card-footer">
            <h1><asp:Label ID="error" runat="server" Text=""></asp:Label></h1>
          </div>
    
</asp:Content>

