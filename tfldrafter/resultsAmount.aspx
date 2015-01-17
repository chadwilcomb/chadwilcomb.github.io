<%@ Page Language="C#" AutoEventWireup="true" CodeFile="resultsAmount.aspx.cs" Inherits="resultsAmount" %>

<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;"/>
   <link rel="stylesheet" href="iui/iui.css" type="text/css" />
   <link rel="stylesheet" href="iui/t/default/default-theme.css" type="text/css"/>
   <script type="application/x-javascript" src="iui/iui.js"></script>
</head>
<body>
    <div id="resultsAmount" title="Draft Results" selected="true">
    <form id="form1" runat="server">
        <asp:GridView ID="gvResults" runat="server" AutoGenerateColumns="False" onrowdatabound="gvDrafted_RowDataBound">
            <Columns>
                <asp:BoundField DataField="owner_name" HeaderText="Owner" />
                <asp:BoundField DataField="winning_bid" DataFormatString="{0:C0}" 
                    HeaderText="Bid" />
                <asp:BoundField DataField="player_name" HeaderText="Player" />
                <asp:BoundField DataField="pos" HeaderText="Pos" />
                <asp:BoundField DataField="team" HeaderText="Team" />
            </Columns>
        </asp:GridView>
    </form>
    </div>
</body>
</html>
