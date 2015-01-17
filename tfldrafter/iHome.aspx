<%@ Page Language="C#" AutoEventWireup="true" CodeFile="iHome.aspx.cs" Inherits="iHome" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>
<html>
<head>
    <title>TFL Drafter</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
    <link rel="stylesheet" href="iui/iui.css" type="text/css" />
    <link rel="stylesheet" href="iui/t/default/default-theme.css" type="text/css"/>
    <link href="css/iphone-asp-helper.css" rel="stylesheet" type="text/css" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon-iphone.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-ipad.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-iphone4.png" />
    <script type="application/x-javascript" src="iui/iui.js"></script>
</head>
<body>

   <div class="toolbar">
      <h1 id="pageTitle"></h1>
      <a id="backButton" class="button" href="#"></a>
   </div>
   <ul id="mainmenu" title="TFL Drafter" selected="true">
        <li style="text-align:center"><img src="images/apple-touch-icon-iphone4.png" alt="TFL Logo" /></li>
        <li><a href="#enterPicks">Enter Auction Picks</a></li>
        <li><a href="#viewPicks">View Picks</a></li>
        <li><a href="#viewRosters">View Rosters</a></li>
   </ul>
   
   <div id="enterPicks" title="Enter Picks">
   <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        
        <span id="spanPos">Position: </span><asp:DropDownList ID="ddPosition" runat="server" 
            onselectedindexchanged="ddPosition_SelectedIndexChanged" AutoPostBack="true" Width="205">
            <asp:ListItem Value="0">--</asp:ListItem>
            <asp:ListItem>QB</asp:ListItem>
            <asp:ListItem>RB</asp:ListItem>
            <asp:ListItem>WR</asp:ListItem>
            <asp:ListItem>TE</asp:ListItem>
            <asp:ListItem>K</asp:ListItem>
            <asp:ListItem>DEF</asp:ListItem>
        </asp:DropDownList>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <span id="spanPlayer">Player:</span> <asp:DropDownList ID="ddPlayers" runat="server" Width="205">
                </asp:DropDownList><br />
                <span id="spanOwner">Winning Bidder:</span><asp:DropDownList ID="ddOwners" runat="server" Width="143" >
                </asp:DropDownList><br />
                <span id="spanBid">Bid Amount:</span> <asp:TextBox ID="bidAmount" runat="server" Width="119"></asp:TextBox><br />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="submit" />
                <asp:AsyncPostBackTrigger ControlID="undoLast" />
                <asp:AsyncPostBackTrigger ControlID="ddPosition" 
                    EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Label ID="lblVal" runat="server"></asp:Label><br />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="submit" />
                <asp:AsyncPostBackTrigger ControlID="undoLast" />
            </Triggers>
        </asp:UpdatePanel>        
        <asp:Button ID="submit" runat="server" onclick="submit_Click" Text="Submit Winning Bid" /><br />
        <asp:Button ID="undoLast" runat="server" onclick="undoLast_Click" Text="Undo Last Pick" /><br /><br />
        <asp:ConfirmButtonExtender ID="undoLast_ConfirmButtonExtender" runat="server" 
            ConfirmText="Are you sure you want to Undo last pick?" Enabled="True" 
            TargetControlID="undoLast">
        </asp:ConfirmButtonExtender>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <span id="last5">Last 5 Picks:</span><br />
                <asp:GridView ID="resultsGrid" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="resultsSql" onrowdatabound="gvDrafted_RowDataBound">
                    
                    <Columns>
                        <asp:BoundField DataField="owner_name" HeaderText="Owner" />
                        <asp:BoundField DataField="winning_bid" DataFormatString="{0:C0}" 
                            HeaderText="Bid" />
                        <asp:BoundField DataField="player_name" HeaderText="Player Name" />
                        <asp:BoundField DataField="pos" HeaderText="Pos" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="resultsSql" runat="server" 
                     SelectCommand="SELECT TOP 5 owner_name, winning_bid, player_name, pos FROM [draftResults] ORDER BY pick_num DESC"                     ConnectionString="<%$ ConnectionStrings:ArvixeString %>" >
                </asp:SqlDataSource>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="submit" />
                <asp:AsyncPostBackTrigger ControlID="undoLast" />
            </Triggers>
        </asp:UpdatePanel>
      </form>
   </div>

   <ul id="viewPicks" title="Results">
    <li><a href="resultsOrder.aspx">Order Picked</a></li>
    <li><a href="resultsAmount.aspx">By Bid Amount</a></li>
   
   </ul>

   <ul id="viewRosters" title="Rosters">
      <li><a href="teamBob.aspx">Bob</a></li>
      <li><a href="teamChad.aspx">Chad</a></li>
      <li><a href="teamJeff.aspx">Jeff</a></li>
      <li><a href="teamJosh.aspx">Josh</a></li>
      <li><a href="teamJT.aspx">JT</a></li>
      <li><a href="teamMike.aspx">Mike</a></li>
      <li><a href="teamNathan.aspx">Nathan Jr.</a></li>
      <li><a href="teamPat.aspx">Pat</a></li>
      <li><a href="teamRyan.aspx">Ryan</a></li>
      <li><a href="teamScott.aspx">Scott</a></li>
      <li><a href="teamTim.aspx">Tim</a></li>
      <li><a href="teamTodd.aspx">Todd</a></li>
   </ul>



</body>
</html>
