<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teamJT.aspx.cs" Inherits="teamJT" %>

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
    <div id="teamJT" title="JT's Team" selected="true">
    <form id="form1" runat="server">
            <asp:GridView ID="gvTeam" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1" onrowdatabound="gvTeam_RowDataBound" 
            ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="player_name" HeaderText="Player" 
                   SortExpression="player_name" />
                <asp:BoundField DataField="pos" HeaderText="Pos" SortExpression="pos" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="winning_bid" HeaderText="Bid" DataFormatString="{0:C0}" 
                   SortExpression="winning_bid" >
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
           ConnectionString="<%$ ConnectionStrings:ArvixeString %>" 
           SelectCommand="SELECT dbo.players.player_name, dbo.players.pos, dbo.auction2011.winning_bid, dbo.auction2011.pick_num
                      FROM dbo.players INNER JOIN
                      dbo.auction2011 ON dbo.players.player_id = dbo.auction2011.player_id INNER JOIN
                      dbo.owners ON dbo.auction2011.winning_owner_id = dbo.owners.owner_id INNER JOIN
                      dbo.positions ON dbo.players.pos = dbo.positions.pos
                      WHERE (dbo.owners.owner_id = '103')
                      ORDER BY dbo.positions.pos_id, dbo.auction2011.winning_bid DESC">
        </asp:SqlDataSource>
    </form>
    </div>
</body>
</html>
