<%@ Page Language="C#" AutoEventWireup="true" CodeFile="keepers.aspx.cs" Inherits="keepers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="ddOwners" runat="server" AutoPostBack="True" 
            onselectedindexchanged="pickOwner" >
        </asp:DropDownList>
        <asp:GridView ID="gvKeepers" runat="server" AutoGenerateColumns="False" 
            ViewStateMode="Disabled">
            <Columns>
                <asp:BoundField DataField="player_name" HeaderText="Player" />
                <asp:BoundField DataField="bid" DataFormatString="{0:C0}" 
                    HeaderText="2011 Bid" />
                <asp:BoundField DataField="year2" DataFormatString="{0:C0}" HeaderText="2012" />
                <asp:BoundField DataField="year3" DataFormatString="{0:C0}" HeaderText="2013" />
                <asp:BoundField DataField="year4" DataFormatString="{0:C0}" HeaderText="2014" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
