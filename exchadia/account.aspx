<%@ Page Language="C#" AutoEventWireup="true" CodeFile="account.aspx.cs" Inherits="account" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Account</title>
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
        <li><asp:LoginStatus ID="LoginStatus1" runat="server" LoginText="Login" /></li>
        <li><a href="registerUser.aspx">Register</a></li>
        <li><a href="account.aspx">My Account</a></li>
        <li><a href="about.aspx">About exCHADia</a></li>
    </ul>
    </div>
    <div id="results">
        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                <p>You are not logged in. Click on Login above to log in.</p>
            </AnonymousTemplate>
            <LoggedInTemplate>
                <p>Welcome, <asp:LoginName ID="LoginName1" runat="server" /></p>
                <asp:Button ID="Button1" runat="server" Text="Click to View Order History" 
                    CssClass="button" onclick="Button1_Click" />
            </LoggedInTemplate>
        </asp:LoginView> 
        <asp:Label ID="lblNoRecords" runat="server"></asp:Label>               
        <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False">
                    <AlternatingRowStyle CssClass="altRow" />
                    <HeaderStyle CssClass="headRow" />
                    <RowStyle CssClass="regRow" />
                    <Columns>
                        <asp:BoundField DataField="confNumber" HeaderText="Conf. #:">
                        </asp:BoundField>
                        <asp:BoundField DataField="depAirline" HeaderText="Airline:" >
                        </asp:BoundField>
                        <asp:BoundField DataField="depFltNum" HeaderText="Flight #:" >
                        </asp:BoundField>
                        <asp:BoundField DataField="depDepCode" HeaderText="From:" >
                        </asp:BoundField>
                        <asp:BoundField DataField="depArrCode" HeaderText="To:"  >
                        </asp:BoundField>
                        <asp:BoundField DataField="depDepTime" HeaderText="Dep:" 
                            DataFormatString="{0:g}" >
                        </asp:BoundField>
                        <asp:BoundField DataField="depArrTime" HeaderText="Arr:"                              
                            DataFormatString="{0:g}" >
                        </asp:BoundField>
                        <asp:BoundField DataField="depCost" DataFormatString="{0:c}" 
                            HeaderText="Cost:" >
                        </asp:BoundField>
                        <asp:BoundField DataField="retAirline" HeaderText="Airline:"  >
                        </asp:BoundField>
                        <asp:BoundField DataField="retFltNum" HeaderText="Flight #:" >
                        </asp:BoundField>
                        <asp:BoundField DataField="retDepCode" HeaderText="From:"  >
                        </asp:BoundField>
                        <asp:BoundField DataField="retArrCode" HeaderText="To:"  >
                        </asp:BoundField>
                        <asp:BoundField DataField="retDepTime" HeaderText="Dep:"  
                            DataFormatString="{0:g}" >
                        </asp:BoundField>
                        <asp:BoundField DataField="retArrTime" HeaderText="Arr:"
                            DataFormatString="{0:g}" >
                        </asp:BoundField>
                        <asp:BoundField DataField="retCost" DataFormatString="{0:c}" 
                            HeaderText="Cost:" >
                        </asp:BoundField>
                        <asp:BoundField DataField="TotalCost" DataFormatString="{0:c}" 
                            HeaderText="Total Cost:" >
                        </asp:BoundField>
                </Columns>
                </asp:GridView>

    </div>
    </form>
    </div>
</body>
</html>
