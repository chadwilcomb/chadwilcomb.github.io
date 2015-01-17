<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginUser.aspx.cs" Inherits="LoginUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign in to exCHADia</title>
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
    <div id="content">
    <div class="login">
        <asp:Login ID="Login1" runat="server" OnLoggedIn="Login1_OnLoggedIn"  >
            <LayoutTemplate>
                <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                    <tr>
                        <td>
                            <table cellpadding="0">
                                <tr>
                                    <td align="center" colspan="2"><strong>Log In to exCHADia</strong></td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                            ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                            ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                            ControlToValidate="Password" ErrorMessage="Password is required." 
                                            ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color:Red;">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" >
                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" 
                                            CssClass="button" Text="Log In to exCHADia" ValidationGroup="Login1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="registerUser.aspx">
                                        Register at exCHADia</asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="recoverPW.aspx">Forgot your Password?                                         </asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <LoginButtonStyle CssClass="button" />
        </asp:Login>
        <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox>
    </div>
    </div>
    </div>
    </form>
</body>
</html>
