<%@ Page Language="C#" AutoEventWireup="true" CodeFile="searchFlights.aspx.cs" Inherits="searchFlights" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>exCHADia.com - Search for Flights</title>
    <link href="Styles/search.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
    <div id="content">
        <div class=left>
        
        From:<asp:DropDownList ID="ddDepart" runat="server" CssClass="dd"></asp:DropDownList><br />
        <asp:CompareValidator ID="CompareValidator3" runat="server" 
            ErrorMessage="You must select a departure city" 
            CssClass="val" ControlToValidate="ddDepart" ValueToCompare="NA" Type="String" Operator="NotEqual" ></asp:CompareValidator>
        <br />
        Departing:<asp:TextBox ID="calDepart" runat="server" CssClass="tbdep"></asp:TextBox>
        <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
            TargetControlID="calDepart" Format="MM/dd/yyyy">
        </asp:CalendarExtender><br />
        <asp:CompareValidator ID="CompareValidator2" runat="server" 
            Type="Date" ErrorMessage="Departure date must be after today" 
            ControlToValidate="calDepart" Operator="GreaterThan" CssClass="val">
        </asp:CompareValidator>
        </div>    
        <div class=right>
        To:<asp:DropDownList ID="ddDest" runat="server" CssClass="dd"></asp:DropDownList><br />
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ErrorMessage="Pick different cities" ControlToCompare="ddDepart" 
            ControlToValidate="ddDest" CultureInvariantValues="False" 
            Operator="NotEqual" CssClass="val">
        </asp:CompareValidator>
        <br />
        Returning:<asp:TextBox ID="calReturn" runat="server" CssClass="tbret"></asp:TextBox>
        <asp:CalendarExtender ID="CalendarExtender2" runat="server" 
            TargetControlID="calReturn" Format="MM/dd/yyyy" >
        </asp:CalendarExtender><br />
        <asp:CompareValidator ID="cvDateOrder" runat="server" 
            ControlToCompare="calDepart" ValueToCompare="Text"
            ControlToValidate="calReturn" Operator="GreaterThanEqual" 
            ErrorMessage="Return Date Must be After Departure Date"
            Type="Date" CssClass="val">
        </asp:CompareValidator>
        </div>
        <br />
        <div class="submit">
        <asp:Label ID="lblSrchError" runat="server" CssClass="val" ></asp:Label><br />
        <asp:Button ID="btnSearch" runat="server" Text="Search For Flights" onclick="btnSearch_Click" CssClass="button" />
        </div>
    </div>
    <div id="results">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="3" CssClass="searchResults" SelectedRowStyle-CssClass="selRow" GridLines="None"
            HorizontalAlign="Center" DataKeyNames="UniqueFlightID"  >
            <AlternatingRowStyle CssClass="altRow" />
            <Columns>
                <asp:CommandField  ButtonType="Button" ShowSelectButton="True" />
                <asp:ImageField DataImageUrlField="imagePath">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:ImageField>
                <asp:BoundField DataField="Airline" HeaderText="Airline" />
                <asp:BoundField DataField="FlightNumber" HeaderText="Flight #" />
                <asp:BoundField DataField="DepartCode" HeaderText="From" />
                <asp:BoundField DataField="ArriveCode" HeaderText="To" />
                <asp:BoundField DataField="DepartTime" HeaderText="Departing" 
                    DataFormatString="{0:t}" />
                <asp:BoundField DataField="ArriveTime" HeaderText="Arriving" 
                    DataFormatString="{0:t}" />
                <asp:BoundField DataField="Cost" DataFormatString="{0:c}" HeaderText="Cost" />
                <asp:BoundField DataField="UniqueFlightID" HeaderText="UniqueFlightID" Visible="false" />
                
            </Columns>
            <HeaderStyle Font-Bold="False" CssClass="headRow" />
            <RowStyle CssClass="regRow" />
            <SelectedRowStyle CssClass="selRow" />
        </asp:GridView><br /><br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            CellPadding="3" CssClass="searchResults" SelectedRowStyle-CssClass="selRow" GridLines="None"
            HorizontalAlign="Center" DataKeyNames="UniqueFlightID" >
            <AlternatingRowStyle CssClass="altRow" />
            <Columns>
                <asp:CommandField  ButtonType="Button" ShowSelectButton="True" />
                <asp:ImageField DataImageUrlField="imagePath">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:ImageField>
                <asp:BoundField DataField="Airline" HeaderText="Airline" />
                <asp:BoundField DataField="FlightNumber" HeaderText="Flight #" />
                <asp:BoundField DataField="DepartCode" HeaderText="From" />
                <asp:BoundField DataField="ArriveCode" HeaderText="To" />
                <asp:BoundField DataField="DepartTime" HeaderText="Departing" 
                    DataFormatString="{0:t}" />
                <asp:BoundField DataField="ArriveTime" HeaderText="Arriving" 
                    DataFormatString="{0:t}" />
                <asp:BoundField DataField="Cost" DataFormatString="{0:c}" HeaderText="Cost" />
                <asp:BoundField DataField="UniqueFlightID" HeaderText="UniqueFlightID" Visible="false" />
                
            </Columns>
            <HeaderStyle Font-Bold="False" CssClass="headRow" />
            <RowStyle CssClass="regRow" />
            <SelectedRowStyle CssClass="selRow" />
        </asp:GridView>
        <div class="submit">
        <asp:Button ID="selectFlights" runat="server" Text="Book Selected Flights" 
            onclick="selectFlights_Click" Visible="false" CssClass="button" /><br />
        <asp:Label ID="lblError" runat="server" CssClass="val" ></asp:Label><br /><br />
        </div>
       </ContentTemplate>
       </asp:UpdatePanel>
    </div>
    </div>
    </form>
</body>
</html>
