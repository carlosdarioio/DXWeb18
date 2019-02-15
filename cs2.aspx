<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs2.aspx.cs" Inherits="cs2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<title>Careers</title>
</head>

<body>
<form id="form2" runat="server">

<div class="form-group">
<label for="exampleInputName">Name</label>
<asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
</div>


<div class="form-group">
<label for="exampleInputFile">Upload Resume</label>
<asp:FileUpload ID="fileUploader" runat="server" />
</div>

<asp:Button ID="bttn_Send" Text="Submit" runat="server" OnClick="bttn_Send_Click" class="btn" />
</form>
</body>

</html>