<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TFL Draft Home</title>
    <script type="text/javascript">  
        var browser=navigator.userAgent.toLowerCase();  
        //var users_browser = ((browser.indexOf('iPhone')!=-1);
        var ismobile = navigator.userAgent.match(/(iPad)|(iPhone)|(iPod)|(android)|(webOS)/i)  
        if (ismobile)  
        {  
            document.location.href='iHome.aspx';  
        }  
    </script> 
    <link href="css/tfl.css" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $("#admin").mouseenter(function () {
                $("#admin").css({ "color": "White", "background-color": "FireBrick" });
            });
            $("#admin").mouseout(function () {
                $("#admin").css({ "color": "#003a6b", "text-decoration": "none", "background-color": "WhiteSmoke" });
            });
            $("#enter").mouseenter(function () {
                $("#enter").css({ "color": "White", "background-color": "FireBrick" });
            });
            $("#enter").mouseout(function () {
                $("#enter").css({ "color": "#003a6b", "text-decoration": "none", "background-color": "WhiteSmoke" });
            });
            $("#view").mouseenter(function () {
                $("#view").css({ "color": "White", "background-color": "FireBrick" });
            });
            $("#view").mouseout(function () {
                $("#view").css({ "color": "#003a6b", "text-decoration": "none", "background-color": "WhiteSmoke" });
            });
            $("#keep").mouseenter(function () {
                $("#keep").css({ "color": "White", "background-color": "FireBrick" });
            });
            $("#keep").mouseout(function () {
                $("#keep").css({ "color": "#003a6b", "text-decoration": "none", "background-color": "WhiteSmoke" });
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
    <div id="header">
        <img id="logo" src="images/tfl-logo-100h.gif" alt="TFL Logo"/>
    </div>
    <div id="nav">
        <ul id="navLinks">
            <li id="admin" class="fakelink">Administration</li>
            <li id="enter" class="fakelink">Enter Picks</li>
            <li id="view" class="fakelink">View Picks</li>
            <!--<li id="keep" class="fakelink">Keeper Schedule</li>-->
            <li><a href="Dashboard.aspx" target="_blank">Draft Board</a></li>
            <script>
                $("#enter").click(function () {
                    $("#results").hide();
                    $("#setup").hide();
                    $("#keeper").hide();
                    $("#auction").show();
                });
                $("#view").click(function () {
                    $("#auction").hide();
                    $("#setup").hide();
                    $("#keeper").hide();
                    $("#results").show();
                });
                $("#admin").click(function () {
                    $("#auction").hide();
                    $("#results").hide();
                    $("#keeper").hide();
                    $("#setup").show();
                });
                $("#keep").click(function () {
                    $("#auction").hide();
                    $("#results").hide();
                    $("#setup").hide();
                    $("#keeper").show();
                });
            </script>
        </ul>
    </div>
    <div id="main">
        <div id="auction" style="display:none" >
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:Label ID="lblVal" runat="server"></asp:Label><br />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="submit" />
                    <asp:AsyncPostBackTrigger ControlID="undoLast" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    Bidder:<asp:DropDownList ID="ddOwners" runat="server">
                    </asp:DropDownList>
                    Position:<asp:DropDownList ID="ddPosition" runat="server" 
                        onselectedindexchanged="ddPosition_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="0">--</asp:ListItem>
                        <asp:ListItem>QB</asp:ListItem>
                        <asp:ListItem>RB</asp:ListItem>
                        <asp:ListItem>WR</asp:ListItem>
                        <asp:ListItem>TE</asp:ListItem>
                        <asp:ListItem>K</asp:ListItem>
                        <asp:ListItem>DEF</asp:ListItem>
                    </asp:DropDownList>
                    Player: <asp:DropDownList ID="ddPlayers" runat="server"  width="120px">
                    </asp:DropDownList>
                    Bid ($): <asp:TextBox ID="bidAmount" runat="server" width="30px"></asp:TextBox>
                    <asp:Button ID="submit" runat="server" onclick="submit_Click" Text="Submit Bid" />
                    <asp:Button ID="undoLast" runat="server" onclick="undoLast_Click" Text="Undo Last Pick" /><br /><br />
                        <asp:ConfirmButtonExtender ID="undoLast_ConfirmButtonExtender" runat="server" 
                            ConfirmText="Are you sure you want to Undo last pick?" Enabled="True" 
                            TargetControlID="undoLast">
                        </asp:ConfirmButtonExtender>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="submit" />
                    <asp:AsyncPostBackTrigger ControlID="undoLast" />
                    <asp:AsyncPostBackTrigger ControlID="ddPosition" 
                        EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    Last 10 Picks:<br />
                    <asp:GridView ID="resultsGrid" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="resultsSql" onrowdatabound="gvDrafted_RowDataBound" >
                        <Columns>
                            <asp:BoundField DataField="owner_name" HeaderText="Owner" />
                            <asp:BoundField DataField="winning_bid" DataFormatString="{0:C0}" HeaderText="Bid" />
                            <asp:BoundField DataField="player_name" HeaderText="Player Name" />
                            <asp:BoundField DataField="pos" HeaderText="Pos" />
                            <asp:BoundField DataField="team" HeaderText="Team" />
                            <asp:BoundField DataField="bye" HeaderText="Bye" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="resultsSql" runat="server" 
                         SelectCommand="SELECT  TOP 10  o.owner_name, a11.winning_bid, p.player_name, p.pos, p.team, p.bye
FROM         auction2011 AS a11 INNER JOIN
                      players AS p ON a11.player_id = p.player_id INNER JOIN
                      owners AS o ON a11.winning_owner_id = o.owner_id
ORDER BY a11.pick_num DESC"                     
                        ConnectionString="<%$ ConnectionStrings:ArvixeString %>" >
                    </asp:SqlDataSource>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="submit" />
                    <asp:AsyncPostBackTrigger ControlID="undoLast" />
                </Triggers>
            </asp:UpdatePanel>
        
        </div>
        <div id="results" style="display:none" >
            <asp:GridView ID="gvResults" runat="server" AutoGenerateColumns="False" 
                onrowdatabound="gvDrafted_RowDataBound" >
            <Columns>
                <asp:TemplateField>
                  <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="owner_name" HeaderText="Owner" />
                <asp:BoundField DataField="winning_bid" DataFormatString="{0:C0}" 
                    HeaderText="Bid" />
                <asp:BoundField DataField="player_name" HeaderText="Player" />
                <asp:BoundField DataField="pos" HeaderText="Pos" />
                <asp:BoundField DataField="team" HeaderText="Team" />
                <asp:BoundField DataField="bye" HeaderText="Bye" />
            </Columns>
        </asp:GridView>
        </div>

        
        <div id="setup" style="display:none" >
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
            <asp:GridView ID="gvOwners" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="owner_id" DataSourceID="sqlOwners" CellPadding="3" 
                    GridLines="Vertical" BackColor="White" BorderColor="Black" BorderStyle="Solid" 
                    BorderWidth="1px" Width="280px" >
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="owner_id" ReadOnly="True" 
                        SortExpression="owner_id" Visible="False"  />
                    <asp:BoundField DataField="owner_name" HeaderText="Owner Name" ReadOnly="True" 
                        SortExpression="owner_name" >
                        <ItemStyle Width="180px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Auction Order" 
                        SortExpression="auction_order_2011">
                        <ItemTemplate>
                            <asp:TextBox ID="txtOrder" runat="server" 
                                Text='<%# Bind("auction_order_2011") %>' Width="30px"></asp:TextBox>
                            
                            <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                ControlToValidate="txtOrder" EnableClientScript="False" 
                                MaximumValue="12" MinimumValue="1" 
                                Type="Integer"  >
                            </asp:RangeValidator>
                            
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" 
                                Text='<%# Bind("auction_order_2011") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                    </asp:TemplateField>
                </Columns>

                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#003a6b" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="#003a6b" Font-Bold="True" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />

            </asp:GridView>
            
            <asp:SqlDataSource ID="sqlOwners" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ArvixeString %>" 
                SelectCommand="SELECT * FROM [owners] ORDER BY [owner_name]" >
            </asp:SqlDataSource>
            <div id="buttons">
                <asp:Button ID="updateOrder" runat="server" Text="Update Auction Order" 
                    onclick="updateOrder_Click" />
                <asp:Button ID="resetDraft" runat="server" Text="Reset Draft" 
                    onclick="resetDraft_Click" />
                <asp:ConfirmButtonExtender ID="resetDraft_ConfirmButtonExtender" runat="server" 
                        ConfirmText="Are you sure you want to Set Up New Draft? This will delete all data." 
                        Enabled="True" TargetControlID="resetDraft">
                </asp:ConfirmButtonExtender>
                <asp:Button ID="btnBackup" runat="server" Text="Back Up Draft Results" OnClick="BackUpNow" /><br />
             </div>
             <asp:Label ID="lblMessage" runat="server"></asp:Label>
             </ContentTemplate>
        </asp:UpdatePanel>
        </div>
    </div>
    </div>
    </form>
</body>
</html>
