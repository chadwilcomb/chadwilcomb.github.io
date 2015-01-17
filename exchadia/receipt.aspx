<%@ Page Language="C#" AutoEventWireup="true" CodeFile="receipt.aspx.cs" Inherits="receipt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Confirmation Receipt</title>
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
        <li><asp:LoginStatus ID="LoginStatus1" runat="server" /></li>
        <li><a href="registerUser.aspx">Register</a></li>
        <li><a href="account.aspx">My Account</a></li>
        <li><a href="about.aspx">About exCHADia</a></li>
    </ul>
    </div>
    <div id="results">
    <div class="receipt">
        <asp:DetailsView ID="DetailsView1" runat="server"  
            AutoGenerateRows="False" BorderStyle="None">
            <Fields>
                <asp:TemplateField HeaderText="Order Details" ItemStyle-CssClass="receiptHead" HeaderStyle-CssClass="receiptHead">
                </asp:TemplateField>
                <asp:BoundField DataField="username" HeaderText="User Name:" 
                    HeaderStyle-CssClass="receiptLabel" ItemStyle-CssClass="receiptBody" >
                </asp:BoundField>
                <asp:BoundField DataField="confNumber" HeaderText="Confirmation #:" 
                    HeaderStyle-CssClass="receiptLabel" ItemStyle-CssClass="receiptBody" >
                </asp:BoundField>
                <asp:TemplateField HeaderText="Flight #1" ItemStyle-CssClass="receiptHead" HeaderStyle-CssClass="receiptHead">
                </asp:TemplateField>
                <asp:BoundField DataField="depAirline" HeaderText="Airline:" 
                    HeaderStyle-CssClass="receiptLabel" ItemStyle-CssClass="receiptBody" >
                </asp:BoundField>
                <asp:BoundField DataField="depFltNum" HeaderText="Flight Number:" 
                    HeaderStyle-CssClass="receiptLabel" ItemStyle-CssClass="receiptBody" >
                </asp:BoundField>
                <asp:BoundField DataField="depDepCode" HeaderText="From:" 
                    HeaderStyle-CssClass="receiptLabel" ItemStyle-CssClass="receiptBody" >
                </asp:BoundField>
                <asp:BoundField DataField="depArrCode" HeaderText="To:" 
                    HeaderStyle-CssClass="receiptLabel" ItemStyle-CssClass="receiptBody" >
                </asp:BoundField>
                <asp:BoundField DataField="depDepTime" HeaderText="Departing:" 
                    HeaderStyle-CssClass="receiptLabel" ItemStyle-CssClass="receiptBody" 
                    DataFormatString="{0:g}" >
                </asp:BoundField>
                <asp:BoundField DataField="depArrTime" HeaderText="Arriving:" 
                    HeaderStyle-CssClass="receiptLabel" ItemStyle-CssClass="receiptBody" 
                    DataFormatString="{0:g}" >
                </asp:BoundField>
                <asp:BoundField DataField="depCost" DataFormatString="{0:c}" 
                    HeaderText="Cost:" HeaderStyle-CssClass="receiptLabel" 
                    ItemStyle-CssClass="receiptBody" >
                </asp:BoundField>
                <asp:TemplateField HeaderText="Flight #2" ItemStyle-CssClass="receiptHead" HeaderStyle-CssClass="receiptHead">
                </asp:TemplateField>
                <asp:BoundField DataField="retAirline" HeaderText="Airline:" 
                    HeaderStyle-CssClass="receiptLabel" ItemStyle-CssClass="receiptBody" >
                </asp:BoundField>
                <asp:BoundField DataField="retFltNum" HeaderText="Flight Number:" 
                    HeaderStyle-CssClass="receiptLabel" ItemStyle-CssClass="receiptBody" >
                </asp:BoundField>
                <asp:BoundField DataField="retDepCode" HeaderText="From:" 
                    HeaderStyle-CssClass="receiptLabel" ItemStyle-CssClass="receiptBody" >
                </asp:BoundField>
                <asp:BoundField DataField="retArrCode" HeaderText="To:" 
                    HeaderStyle-CssClass="receiptLabel" ItemStyle-CssClass="receiptBody" >
                </asp:BoundField>
                <asp:BoundField DataField="retDepTime" HeaderText="Departing:" 
                    HeaderStyle-CssClass="receiptLabel" ItemStyle-CssClass="receiptBody" 
                    DataFormatString="{0:g}" >
                </asp:BoundField>
                <asp:BoundField DataField="retArrTime" HeaderText="Arriving:" 
                    HeaderStyle-CssClass="receiptLabel" ItemStyle-CssClass="receiptBody" 
                    DataFormatString="{0:g}" >
                </asp:BoundField>
                <asp:BoundField DataField="retCost" DataFormatString="{0:c}" 
                    HeaderText="Cost:" HeaderStyle-CssClass="receiptLabel" 
                    ItemStyle-CssClass="receiptBody" >
                </asp:BoundField>
                <asp:BoundField DataField="TotalCost" DataFormatString="{0:c}" 
                    HeaderText="Total Cost:" ItemStyle-CssClass="receiptHead" HeaderStyle-CssClass="receiptHead" >
                </asp:BoundField>
            </Fields>
        </asp:DetailsView>
    </div>    
    </div>
    </div>
    </form>
</body>
</html>
