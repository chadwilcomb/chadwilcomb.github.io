<%@ Page Language="C#" AutoEventWireup="true" CodeFile="validform.aspx.cs" Inherits="netintensive_form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Guest Book</title>
    <link href="../css/form.css" rel="stylesheet" type="text/css" />
    <link href="../css/homework.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
    <div id="wrapper">
    <h1>Please Sign the Guest Book!</h1>
        <form id="form1" runat="server">
        <div class="formlabel">Username:</div>
        <div class="formfield"><asp:TextBox ID="username" runat="server" Columns ="38" ></asp:TextBox></div>
        <div class="validation">
            <asp:RequiredFieldValidator id="req_username" Display="Dynamic"
            ControlToValidate="username" 
            Text="Username is a required field." 
            EnableClientScript=true Runat=server/>
        </div>
        <div class="formlabel">Password:</div>
        <div class="formfield"><asp:TextBox ID="pwd" TextMode="password" runat="server" Columns ="38" ></asp:TextBox></div>
        <div class="validation">
            <asp:RequiredFieldValidator id="req_pwd" Display="Dynamic"
            ControlToValidate="pwd" 
            Text="Password is a required field." 
            EnableClientScript=true Runat=server/>
        </div>
        
        <div class="formlabel">Confirm Password:</div>
        <div class="formfield"><asp:TextBox ID="confirmpwd" TextMode="password" runat="server" Columns ="38" ></asp:TextBox></div>
        <div class="validation">
            <asp:CompareValidator id="check_pwd" Display="dynamic"
                ControlToValidate="pwd" 
                ControlToCompare="confirmpwd" 
                Type="String"
                EnableClientScript="false" 
                Text="Your passwords did not match!" 
                runat="server" />
        </div>
        <div class="formlabel">Your full name:</div>
        <div class="formfield"><asp:TextBox ID="name" runat="server" Columns ="38" ></asp:TextBox></div>

        <div class="formlabel">Email Address:</div>
        <div class="formfield"><asp:TextBox ID="email" runat="server" Columns ="38" ></asp:TextBox></div>
        <div class="validation">
            <asp:RequiredFieldValidator id="req_email" Display="Dynamic"
                ControlToValidate="email" 
                Text="Email Address is a required field." 
                EnableClientScript=true Runat=server/>
            <asp:RegularExpressionValidator ID="valEmail" Display="dynamic"
                ControlToValidate="email"	
                ValidationExpression=".*@.*\..*" 
                Text="Email address is invalid." 
                EnableClientScript="true" runat="server" />
        </div>    
        <div class="formlabel">Mailing Address:</div>
        <div class="formfield"><asp:TextBox ID="snail" runat="server" TextMode="multiline" Rows="5" Columns="30" ></asp:TextBox></div>

        <div class="formlabel">What type of address is that?</div>
        <div class="formfield">
            <asp:RadioButtonList ID="addtype" runat="server">
                <asp:listitem Value="home" Selected="True">Home</asp:listitem>
                <asp:listitem Value="work">Work</asp:listitem>
                <asp:listitem Value="pobox">P.O. Box</asp:listitem>
                <asp:listitem Value="other">Other</asp:listitem>
            </asp:RadioButtonList>
        </div>

        <div class="formlabel">How should we contact you? (check all that apply)</div>
        <div class="formfield">
            <asp:RadioButtonList ID="contact" runat="server">
                <asp:ListItem Value="email" Selected="True">Email</asp:ListItem>
                <asp:ListItem Value="snail">Snail Mail</asp:ListItem>
                <asp:ListItem Value="nocontact">Please do not contact me</asp:ListItem>
            </asp:RadioButtonList>
        </div>
        
        <div class="formsubmit">
            <asp:Button ID="submitbutton" runat="server" Text="Click Here to Submit" onclick="submit" />
            <input type="reset" value="Erase and Start Over" />
        </div>
        </form>
        <div class="results" >
            
            <asp:Label ID="ret_info" runat="server" Text=""></asp:Label><br />
            <asp:Table ID="res_table" runat="server">
                <asp:TableRow>
                    <asp:TableCell>Username:</asp:TableCell>
                    <asp:TableCell id="res_user">&nbsp;</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Password:</asp:TableCell>
                    <asp:TableCell id="res_pwd">&nbsp;</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Your full name:</asp:TableCell>
                    <asp:TableCell id="res_name">&nbsp;</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Email Address:</asp:TableCell>
                    <asp:TableCell id="res_email">&nbsp;</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Mailing Address:</asp:TableCell>
                    <asp:TableCell id="res_add">&nbsp;</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Address Type:</asp:TableCell>
                    <asp:TableCell id="res_atype">&nbsp;</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Contact Method:</asp:TableCell>
                    <asp:TableCell id="res_contact">&nbsp;</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
                    
        </div>
    </div>
</body>
</html>
