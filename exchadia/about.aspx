<%@ Page Language="C#" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About exCHADia</title>
    <link href="Styles/search.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="container">
    <div id="header">
    <h1>exCHADia</h1>
    </div>
    <div id="nav">
    <ul>
        <li><a href="searchFlights.aspx">Search Flights</a></li>
        <li><asp:LoginStatus ID="LoginStatus1" runat="server" LoginText="Login" /></li>
        <li><a href="registerUser.aspx">Register</a></li>
        <li><a href="account.aspx">My Account</a></li>
        <li><a href="about.aspx">About exCHADia</a></li>
    </ul>
    </div>
    <div id="results">
    <p>exCHADia.com is an ASP.NET sample application created by Chad Wilcomb as the final project for the .NET Application Development Intensive course at New York University School of Continuing and Professional Studies. This sample application includes SQL Server tables, views and stored procedures, ASP.NET controls, event handlers and security, ADO.NET data binding, AJAX validation and calendar controls and CSS style and layout control.  </p>

    
    </div>
    </div>
    </form>
</body>
</html>
