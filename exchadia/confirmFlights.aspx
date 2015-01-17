<%@ Page Language="C#" AutoEventWireup="true" CodeFile="confirmFlights.aspx.cs" Inherits="confirmFlights" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/search.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="container">
    <form id="form1" runat="server">
    <div id="header">
    <h1>exCHADia</h1>
    </div>
    <div id="nav">
    <ul>
        <li><a href="searchFlights.aspx">Search Flights</a></li>
        <li><asp:LoginStatus ID="LoginStatus1" runat="server" /></li>
        <li><a href="registerUser.aspx">Register</a></li>
        <li><a href="account.aspx">My Account</a></li>
        <li><a href="about.aspx">About exCHADia</a></li>
    </ul>
    </div>
    <div id="results">
        <p>You have selected the following flights:</p><br />
        <asp:Label ID="lblErr" runat="server"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            CellPadding="3" CssClass="searchResults" GridLines="None"
            HorizontalAlign="Center" ShowFooter="True" OnRowDataBound="GridView1_DataBound"  >
            <AlternatingRowStyle CssClass="altRow" />
            <Columns>
                <asp:ImageField DataImageUrlField="imagePath">
                </asp:ImageField>
                <asp:BoundField DataField="Airline" HeaderText="Airline" />
                <asp:BoundField DataField="FlightNumber" HeaderText="Flight #" />
                <asp:BoundField DataField="DepartCode" HeaderText="From" />
                <asp:BoundField DataField="DepartTime" HeaderText="Departing" 
                    DataFormatString="{0:g}" SortExpression="Departing" />
                <asp:BoundField DataField="ArriveCode" HeaderText="To" />
                <asp:BoundField DataField="ArriveTime" HeaderText="Arriving" 
                    DataFormatString="{0:g}" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" DataFormatString="{0:c}" />
                <asp:BoundField DataField="UniqueFlightID" HeaderText="UniqueFlightID" 
                    Visible="False" />
            </Columns>
            <HeaderStyle CssClass="headRow" />
            <RowStyle CssClass="regRow" />
            <FooterStyle CssClass="footRow" />
        </asp:GridView> 
        <br />
        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                <asp:Button ID="btnLogin" runat="server" Text="Click here to Log In" 
            onclick="btnLogin_Click" CssClass="button" />
            </AnonymousTemplate>
            <LoggedInTemplate>
                <asp:Button ID="btnPurchase" runat="server" Text="Purchase Flights" 
            onclick="btnPurchase_Click" CssClass="button"  />
            </LoggedInTemplate>
        </asp:LoginView>
        <asp:Button ID="btnClear" runat="server" Text="Clear and Search Again" CssClass="button" 
            onclick="btnClear_Click" />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>
    </form>
    </div>
</body>
</html>
