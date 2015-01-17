<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <meta http-equiv="refresh" content="7">
    <link href="css/dashboard.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
    <div id="bigboard">
    <div id="row1">
    <div id="dl1" class="results">
        <asp:Label ID="lblTeam1" runat="server" CssClass="team">Team 1</asp:Label>
        <asp:Label ID="lblFunds1" runat="server" Cssclass="funds">$</asp:Label><br />
        <asp:GridView ID="drafted1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="owner1" ShowHeaderWhenEmpty="True" CssClass="gvDrafted" 
            onrowdatabound="gvDrafted_RowDataBound" Width="100%"
            >
            <Columns>
                <asp:BoundField DataField="player_name" HeaderText="Player" 
                    SortExpression="player_name" >
                <HeaderStyle/>
                <ItemStyle CssClass="gvPlayer" Width="150px"/>
                </asp:BoundField>
                <asp:BoundField DataField="pos" HeaderText="Pos" SortExpression="pos" >
                <ItemStyle CssClass="gvPos" Width="5px" />
                </asp:BoundField>
                <asp:BoundField DataField="winning_bid" DataFormatString="{0:C0}" 
                    HeaderText="Bid" SortExpression="winning_bid" >
                <ItemStyle CssClass="gvBid" Width="5px" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="owner1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ArvixeString %>" 
            SelectCommand="SELECT p.player_name, p.pos, a.winning_bid
                        FROM dbo.players AS p INNER JOIN
                        dbo.auction2011 AS a ON p.player_id = a.player_id INNER JOIN
                        dbo.owners AS o ON a.winning_owner_id = o.owner_id INNER JOIN
                        dbo.positions ON p.pos = dbo.positions.pos
                        WHERE (o.auction_order_2011 = 1)
                        ORDER BY a.pick_num">
        </asp:SqlDataSource>
    </div>
    <div id="dl2" class="results">
        <asp:Label ID="lblTeam2" runat="server" CssClass="team">Team 2</asp:Label>
        <asp:Label ID="lblFunds2" runat="server" CssClass="funds">$</asp:Label><br />
        <asp:GridView ID="drafted2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="owner2" ShowHeaderWhenEmpty="True" CssClass="gvDrafted" 
            onrowdatabound="gvDrafted_RowDataBound" Width="100%"
            >
            <Columns>
                <asp:BoundField DataField="player_name" HeaderText="Player" 
                    SortExpression="player_name" >
                <HeaderStyle/>
                <ItemStyle CssClass="gvPlayer"/>
                </asp:BoundField>
                <asp:BoundField DataField="pos" HeaderText="Pos" SortExpression="pos" >
                <ItemStyle CssClass="gvPos" />
                </asp:BoundField>
                <asp:BoundField DataField="winning_bid" DataFormatString="{0:C0}" 
                    HeaderText="Bid" SortExpression="winning_bid" >
                <ItemStyle CssClass="gvBid" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="owner2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ArvixeString %>" 
            SelectCommand="SELECT p.player_name, p.pos, a.winning_bid
                        FROM dbo.players AS p INNER JOIN
                        dbo.auction2011 AS a ON p.player_id = a.player_id INNER JOIN
                        dbo.owners AS o ON a.winning_owner_id = o.owner_id INNER JOIN
                        dbo.positions ON p.pos = dbo.positions.pos
                        WHERE (o.auction_order_2011 = 2)
                        ORDER BY a.pick_num">
        </asp:SqlDataSource>
    </div>
    <div id="dl3" class="results">
        <asp:Label ID="lblTeam3" runat="server" CssClass="team">Team 3</asp:Label>
        <asp:Label ID="lblFunds3" runat="server" CssClass="funds">$</asp:Label><br />
        <asp:GridView ID="drafted3" runat="server" AutoGenerateColumns="False" 
            DataSourceID="owner3" ShowHeaderWhenEmpty="True" CssClass="gvDrafted" 
            onrowdatabound="gvDrafted_RowDataBound" Width="100%"
            >
            <Columns>
                <asp:BoundField DataField="player_name" HeaderText="Player" 
                    SortExpression="player_name" >
                <HeaderStyle/>
                <ItemStyle CssClass="gvPlayer"/>
                </asp:BoundField>
                <asp:BoundField DataField="pos" HeaderText="Pos" SortExpression="pos" >
                <ItemStyle CssClass="gvPos" />
                </asp:BoundField>
                <asp:BoundField DataField="winning_bid" DataFormatString="{0:C0}" 
                    HeaderText="Bid" SortExpression="winning_bid" >
                <ItemStyle CssClass="gvBid" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="owner3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ArvixeString %>" 
            SelectCommand="SELECT p.player_name, p.pos, a.winning_bid
                        FROM dbo.players AS p INNER JOIN
                        dbo.auction2011 AS a ON p.player_id = a.player_id INNER JOIN
                        dbo.owners AS o ON a.winning_owner_id = o.owner_id INNER JOIN
                        dbo.positions ON p.pos = dbo.positions.pos
                        WHERE (o.auction_order_2011 = 3)
                        ORDER BY a.pick_num">
        </asp:SqlDataSource>
    </div>
    <div id="dl4" class="results">
        <asp:Label ID="lblTeam4" runat="server" CssClass="team">Team 4</asp:Label>
        <asp:Label ID="lblFunds4" runat="server" CssClass="funds">$</asp:Label><br />
        <asp:GridView ID="drafted4" runat="server" AutoGenerateColumns="False" 
            DataSourceID="owner4" ShowHeaderWhenEmpty="True" CssClass="gvDrafted" 
            onrowdatabound="gvDrafted_RowDataBound" Width="100%"
            >
            <Columns>
                <asp:BoundField DataField="player_name" HeaderText="Player" 
                    SortExpression="player_name" >
                <HeaderStyle/>
                <ItemStyle CssClass="gvPlayer"/>
                </asp:BoundField>
                <asp:BoundField DataField="pos" HeaderText="Pos" SortExpression="pos" >
                <ItemStyle CssClass="gvPos" />
                </asp:BoundField>
                <asp:BoundField DataField="winning_bid" DataFormatString="{0:C0}" 
                    HeaderText="Bid" SortExpression="winning_bid" >
                <ItemStyle CssClass="gvBid" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="owner4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ArvixeString %>" 
            SelectCommand="SELECT p.player_name, p.pos, a.winning_bid
                        FROM dbo.players AS p INNER JOIN
                        dbo.auction2011 AS a ON p.player_id = a.player_id INNER JOIN
                        dbo.owners AS o ON a.winning_owner_id = o.owner_id INNER JOIN
                        dbo.positions ON p.pos = dbo.positions.pos
                        WHERE (o.auction_order_2011 = 4)
                        ORDER BY a.pick_num">
        </asp:SqlDataSource>
    </div>
    <div id="dl5" class="results">
        <asp:Label ID="lblTeam5" runat="server" CssClass="team">Team 5</asp:Label>
        <asp:Label ID="lblFunds5" runat="server" CssClass="funds">$</asp:Label><br />
        <asp:GridView ID="drafted5" runat="server" AutoGenerateColumns="False" 
            DataSourceID="owner5" ShowHeaderWhenEmpty="True" CssClass="gvDrafted" 
            onrowdatabound="gvDrafted_RowDataBound" Width="100%"
            >
            <Columns>
                <asp:BoundField DataField="player_name" HeaderText="Player" 
                    SortExpression="player_name" >
                <HeaderStyle/>
                <ItemStyle CssClass="gvPlayer"/>
                </asp:BoundField>
                <asp:BoundField DataField="pos" HeaderText="Pos" SortExpression="pos" >
                <ItemStyle CssClass="gvPos" />
                </asp:BoundField>
                <asp:BoundField DataField="winning_bid" DataFormatString="{0:C0}" 
                    HeaderText="Bid" SortExpression="winning_bid" >
                <ItemStyle CssClass="gvBid" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="owner5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ArvixeString %>" 
            SelectCommand="SELECT p.player_name, p.pos, a.winning_bid
                        FROM dbo.players AS p INNER JOIN
                        dbo.auction2011 AS a ON p.player_id = a.player_id INNER JOIN
                        dbo.owners AS o ON a.winning_owner_id = o.owner_id INNER JOIN
                        dbo.positions ON p.pos = dbo.positions.pos
                        WHERE (o.auction_order_2011 = 5)
                        ORDER BY a.pick_num">
        </asp:SqlDataSource>
    </div>
    <div id="dl6" class="results">
        <asp:Label ID="lblTeam6" runat="server" CssClass="team">Team 6</asp:Label>
        <asp:Label ID="lblFunds6" runat="server" CssClass="funds">$</asp:Label><br />
        <asp:GridView ID="drafted6" runat="server" AutoGenerateColumns="False" 
            DataSourceID="owner6" ShowHeaderWhenEmpty="True" CssClass="gvDrafted" 
            onrowdatabound="gvDrafted_RowDataBound" Width="100%"
            >
            <Columns>
                <asp:BoundField DataField="player_name" HeaderText="Player" 
                    SortExpression="player_name" >
                <HeaderStyle/>
                <ItemStyle CssClass="gvPlayer"/>
                </asp:BoundField>
                <asp:BoundField DataField="pos" HeaderText="Pos" SortExpression="pos" >
                <ItemStyle CssClass="gvPos" />
                </asp:BoundField>
                <asp:BoundField DataField="winning_bid" DataFormatString="{0:C0}" 
                    HeaderText="Bid" SortExpression="winning_bid" >
                <ItemStyle CssClass="gvBid" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="owner6" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ArvixeString %>" 
            SelectCommand="SELECT p.player_name, p.pos, a.winning_bid
                        FROM dbo.players AS p INNER JOIN
                        dbo.auction2011 AS a ON p.player_id = a.player_id INNER JOIN
                        dbo.owners AS o ON a.winning_owner_id = o.owner_id INNER JOIN
                        dbo.positions ON p.pos = dbo.positions.pos
                        WHERE (o.auction_order_2011 = 6)
                        ORDER BY a.pick_num">
        </asp:SqlDataSource>
    </div>
    </div>
    <div id="row2">
    <div id="dl7" class="results">
        <asp:Label ID="lblTeam7" runat="server" CssClass="team">Team 7</asp:Label>
        <asp:Label ID="lblFunds7" runat="server" CssClass="funds">$</asp:Label><br />
        <asp:GridView ID="drafted7" runat="server" AutoGenerateColumns="False" 
            DataSourceID="owner7" ShowHeaderWhenEmpty="True" CssClass="gvDrafted" 
            onrowdatabound="gvDrafted_RowDataBound" Width="100%"
            >
            <Columns>
                <asp:BoundField DataField="player_name" HeaderText="Player" 
                    SortExpression="player_name" >
                <HeaderStyle/>
                <ItemStyle CssClass="gvPlayer"/>
                </asp:BoundField>
                <asp:BoundField DataField="pos" HeaderText="Pos" SortExpression="pos" >
                <ItemStyle CssClass="gvPos" />
                </asp:BoundField>
                <asp:BoundField DataField="winning_bid" DataFormatString="{0:C0}" 
                    HeaderText="Bid" SortExpression="winning_bid" >
                <ItemStyle CssClass="gvBid" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="owner7" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ArvixeString %>" 
            SelectCommand="SELECT p.player_name, p.pos, a.winning_bid
                        FROM dbo.players AS p INNER JOIN
                        dbo.auction2011 AS a ON p.player_id = a.player_id INNER JOIN
                        dbo.owners AS o ON a.winning_owner_id = o.owner_id INNER JOIN
                        dbo.positions ON p.pos = dbo.positions.pos
                        WHERE (o.auction_order_2011 = 7)
                        ORDER BY a.pick_num">
        </asp:SqlDataSource>
    </div>
    <div id="dl8" class="results">
        <asp:Label ID="lblTeam8" runat="server" CssClass="team">Team 8</asp:Label>
        <asp:Label ID="lblFunds8" runat="server" CssClass="funds">$</asp:Label><br />
        <asp:GridView ID="drafted8" runat="server" AutoGenerateColumns="False" 
            DataSourceID="owner8" ShowHeaderWhenEmpty="True" CssClass="gvDrafted" 
            onrowdatabound="gvDrafted_RowDataBound" Width="100%"
            >
            <Columns>
                <asp:BoundField DataField="player_name" HeaderText="Player" 
                    SortExpression="player_name" >
                <HeaderStyle/>
                <ItemStyle CssClass="gvPlayer"/>
                </asp:BoundField>
                <asp:BoundField DataField="pos" HeaderText="Pos" SortExpression="pos" >
                <ItemStyle CssClass="gvPos" />
                </asp:BoundField>
                <asp:BoundField DataField="winning_bid" DataFormatString="{0:C0}" 
                    HeaderText="Bid" SortExpression="winning_bid" >
                <ItemStyle CssClass="gvBid" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="owner8" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ArvixeString %>" 
            SelectCommand="SELECT p.player_name, p.pos, a.winning_bid
                        FROM dbo.players AS p INNER JOIN
                        dbo.auction2011 AS a ON p.player_id = a.player_id INNER JOIN
                        dbo.owners AS o ON a.winning_owner_id = o.owner_id INNER JOIN
                        dbo.positions ON p.pos = dbo.positions.pos
                        WHERE (o.auction_order_2011 = 8)
                        ORDER BY a.pick_num">
        </asp:SqlDataSource>
    </div>
    <div id="dl9" class="results">
        <asp:Label ID="lblTeam9" runat="server" CssClass="team">Team 9</asp:Label>
        <asp:Label ID="lblFunds9" runat="server" CssClass="funds">$</asp:Label><br />
        <asp:GridView ID="drafted9" runat="server" AutoGenerateColumns="False" 
            DataSourceID="owner9" ShowHeaderWhenEmpty="True" CssClass="gvDrafted" 
            onrowdatabound="gvDrafted_RowDataBound" Width="100%"
            >
            <Columns>
                <asp:BoundField DataField="player_name" HeaderText="Player" 
                    SortExpression="player_name" >
                <HeaderStyle/>
                <ItemStyle CssClass="gvPlayer"/>
                </asp:BoundField>
                <asp:BoundField DataField="pos" HeaderText="Pos" SortExpression="pos" >
                <ItemStyle CssClass="gvPos" />
                </asp:BoundField>
                <asp:BoundField DataField="winning_bid" DataFormatString="{0:C0}" 
                    HeaderText="Bid" SortExpression="winning_bid" >
                <ItemStyle CssClass="gvBid" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="owner9" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ArvixeString %>" 
            SelectCommand="SELECT p.player_name, p.pos, a.winning_bid
                        FROM dbo.players AS p INNER JOIN
                        dbo.auction2011 AS a ON p.player_id = a.player_id INNER JOIN
                        dbo.owners AS o ON a.winning_owner_id = o.owner_id INNER JOIN
                        dbo.positions ON p.pos = dbo.positions.pos
                        WHERE (o.auction_order_2011 = 9)
                        ORDER BY a.pick_num">
        </asp:SqlDataSource>
    </div>
    <div id="dl10" class="results">
        <asp:Label ID="lblTeam10" runat="server" CssClass="team">Team 10</asp:Label>
        <asp:Label ID="lblFunds10" runat="server" CssClass="funds">$</asp:Label><br />
        <asp:GridView ID="drafted10" runat="server" AutoGenerateColumns="False" 
            DataSourceID="owner10" ShowHeaderWhenEmpty="True" CssClass="gvDrafted" 
            onrowdatabound="gvDrafted_RowDataBound" Width="100%"
            >
            <Columns>
                <asp:BoundField DataField="player_name" HeaderText="Player" 
                    SortExpression="player_name" >
                <HeaderStyle/>
                <ItemStyle CssClass="gvPlayer"/>
                </asp:BoundField>
                <asp:BoundField DataField="pos" HeaderText="Pos" SortExpression="pos" >
                <ItemStyle CssClass="gvPos" />
                </asp:BoundField>
                <asp:BoundField DataField="winning_bid" DataFormatString="{0:C0}" 
                    HeaderText="Bid" SortExpression="winning_bid" >
                <ItemStyle CssClass="gvBid" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="owner10" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ArvixeString %>" 
            SelectCommand="SELECT p.player_name, p.pos, a.winning_bid
                        FROM dbo.players AS p INNER JOIN
                        dbo.auction2011 AS a ON p.player_id = a.player_id INNER JOIN
                        dbo.owners AS o ON a.winning_owner_id = o.owner_id INNER JOIN
                        dbo.positions ON p.pos = dbo.positions.pos
                        WHERE (o.auction_order_2011 = 10)
                        ORDER BY a.pick_num">
        </asp:SqlDataSource>
    </div>
    <div id="dl11" class="results">
        <asp:Label ID="lblTeam11" runat="server" CssClass="team">Team 11</asp:Label>
        <asp:Label ID="lblFunds11" runat="server" CssClass="funds">$</asp:Label><br />
        <asp:GridView ID="drafted11" runat="server" AutoGenerateColumns="False" 
            DataSourceID="owner11" ShowHeaderWhenEmpty="True" CssClass="gvDrafted" 
            onrowdatabound="gvDrafted_RowDataBound" Width="100%"
            >
            <Columns>
                <asp:BoundField DataField="player_name" HeaderText="Player" 
                    SortExpression="player_name" >
                <HeaderStyle/>
                <ItemStyle CssClass="gvPlayer"/>
                </asp:BoundField>
                <asp:BoundField DataField="pos" HeaderText="Pos" SortExpression="pos" >
                <ItemStyle CssClass="gvPos" />
                </asp:BoundField>
                <asp:BoundField DataField="winning_bid" DataFormatString="{0:C0}" 
                    HeaderText="Bid" SortExpression="winning_bid" >
                <ItemStyle CssClass="gvBid" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="owner11" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ArvixeString %>" 
            SelectCommand="SELECT p.player_name, p.pos, a.winning_bid
                        FROM dbo.players AS p INNER JOIN
                        dbo.auction2011 AS a ON p.player_id = a.player_id INNER JOIN
                        dbo.owners AS o ON a.winning_owner_id = o.owner_id INNER JOIN
                        dbo.positions ON p.pos = dbo.positions.pos
                        WHERE (o.auction_order_2011 = 11)
                        ORDER BY a.pick_num">
        </asp:SqlDataSource>
    </div>
    <div id="dl12" class="results">
        <asp:Label ID="lblTeam12" runat="server" CssClass="team">Team 12</asp:Label>
        <asp:Label ID="lblFunds12" runat="server" CssClass="funds">$</asp:Label><br />
        <asp:GridView ID="drafted12" runat="server" AutoGenerateColumns="False" 
            DataSourceID="owner12" ShowHeaderWhenEmpty="True" CssClass="gvDrafted" 
            onrowdatabound="gvDrafted_RowDataBound" Width="100%"
            >
            <Columns>
                <asp:BoundField DataField="player_name" HeaderText="Player" 
                    SortExpression="player_name" >
                <HeaderStyle/>
                <ItemStyle CssClass="gvPlayer"/>
                </asp:BoundField>
                <asp:BoundField DataField="pos" HeaderText="Pos" SortExpression="pos" >
                <ItemStyle CssClass="gvPos" />
                </asp:BoundField>
                <asp:BoundField DataField="winning_bid" DataFormatString="{0:C0}" 
                    HeaderText="Bid" SortExpression="winning_bid" >
                <ItemStyle CssClass="gvBid" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="owner12" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ArvixeString %>" 
            SelectCommand="SELECT p.player_name, p.pos, a.winning_bid
                        FROM dbo.players AS p INNER JOIN
                        dbo.auction2011 AS a ON p.player_id = a.player_id INNER JOIN
                        dbo.owners AS o ON a.winning_owner_id = o.owner_id INNER JOIN
                        dbo.positions ON p.pos = dbo.positions.pos
                        WHERE (o.auction_order_2011 = 12)
                        ORDER BY a.pick_num">
        </asp:SqlDataSource>
    </div>
    </div>
    </div>
    </form>
</body>
</html>
