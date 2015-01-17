﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class iHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {   
        
        if (!Page.IsPostBack)
        {
            string ownerList = "SELECT owner_id, owner_name FROM [owners] ORDER BY owner_name";
            string strCon = ConfigurationManager.AppSettings["ArvixeSql"];
            SqlConnection objCon;
            objCon = new SqlConnection(strCon);
            DataSet ownerDs = new DataSet();

            SqlDataAdapter ownerAd;
            ownerAd = new SqlDataAdapter(ownerList, objCon);
            ownerAd.Fill(ownerDs, "owners");

            ddOwners.DataSource = ownerDs.Tables["owners"].DefaultView;
            ddOwners.DataValueField = "owner_id";
            ddOwners.DataTextField = "owner_name";
            ddOwners.DataBind();
            ddOwners.Items.Insert(0, new ListItem("--", "0"));

            ddPlayers.Items.Insert(0, new ListItem("--", "0"));

            objCon.Close();
            objCon.Dispose();

            ddPosition.SelectedValue = "0";

        }
    }

    int sumBids = 0;

    protected void gvDrafted_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.BackColor = System.Drawing.Color.WhiteSmoke;
            //e.Row.BorderColor = System.Drawing.Color.WhiteSmoke;
            e.Row.BorderStyle = BorderStyle.None;
            e.Row.BorderWidth = Unit.Pixel(0);
        }

        else if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView drv = e.Row.DataItem as DataRowView;
            if (drv["pos"].ToString().Equals("QB"))
            {
                e.Row.BackColor = System.Drawing.Color.LightSalmon;
            }
            else if (drv["pos"].ToString().Equals("RB"))
            {
                e.Row.BackColor = System.Drawing.Color.PaleGreen;
            }
            else if (drv["pos"].ToString().Equals("WR"))
            {
                e.Row.BackColor = System.Drawing.Color.Yellow;
            }
            else if (drv["pos"].ToString().Equals("TE"))
            {
                e.Row.BackColor = System.Drawing.Color.LightBlue;
            }
            else if (drv["pos"].ToString().Equals("K"))
            {
                e.Row.BackColor = System.Drawing.Color.Gold;
            }
            else if (drv["pos"].ToString().Equals("DEF"))
            {
                e.Row.BackColor = System.Drawing.Color.Khaki;
            }

            sumBids += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "winning_bid"));
        }

        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.BackColor = System.Drawing.Color.WhiteSmoke;
            e.Row.BorderColor = System.Drawing.Color.WhiteSmoke;
            e.Row.BorderStyle = BorderStyle.None;
            e.Row.BorderWidth = Unit.Pixel(0);
            e.Row.Cells[1].Text = "Total Bids:";
            e.Row.Cells[2].Text = "$" + sumBids;
            e.Row.Font.Bold = true;
        }
    }

    protected void ddPosition_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selPos = ddPosition.SelectedValue.ToString();
        string strCon = ConfigurationManager.AppSettings["ArvixeSql"];
        SqlConnection objCon;
        objCon = new SqlConnection(strCon);

        string playerList = "SELECT player_id, player_name FROM [availablePlayers] WHERE pos = '" + selPos + "' ORDER BY player_name";

        SqlDataAdapter playerAd;
        DataSet playerDs = new DataSet();

        playerAd = new SqlDataAdapter(playerList, objCon);
        playerAd.Fill(playerDs, "players");

        ddPlayers.DataSource = playerDs.Tables["players"].DefaultView;
        ddPlayers.DataValueField = "player_id";
        ddPlayers.DataTextField = "player_name";
        ddPlayers.DataBind();
        ddPlayers.Items.Insert(0, new ListItem("--", "0"));

        objCon.Close();
        objCon.Dispose();
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        lblVal.Text = "";

        if (ddPlayers.SelectedValue == "0" || ddOwners.SelectedValue == "0" || bidAmount.Text == "")
        {
            lblVal.Text = "You forgot to pick a player and/or enter a bid!";
            //Response.Redirect("slidinglink.aspx#_enterPicks");
        }
        else
        {
            SqlCommand valCmd;

            string strCon = ConfigurationManager.AppSettings["ArvixeSql"];
            SqlConnection valCon;
            valCon = new SqlConnection(strCon);
            string valSP = "validateAll";

            SqlParameter objParm;
            valCmd = new SqlCommand(valSP, valCon);
            valCmd.CommandType = CommandType.StoredProcedure;

            objParm = new SqlParameter("@player_id", System.Data.SqlDbType.Int);
            objParm.Value = ddPlayers.SelectedValue;
            objParm.Direction = System.Data.ParameterDirection.Input;
            valCmd.Parameters.Add(objParm);

            objParm = new SqlParameter("@owner_id", System.Data.SqlDbType.Int);
            objParm.Value = ddOwners.SelectedValue;
            objParm.Direction = System.Data.ParameterDirection.Input;
            valCmd.Parameters.Add(objParm);

            objParm = new SqlParameter("@bid", System.Data.SqlDbType.Int);
            objParm.Value = bidAmount.Text;
            objParm.Direction = System.Data.ParameterDirection.Input;
            valCmd.Parameters.Add(objParm);

            SqlParameter returnValue = new SqlParameter();
            returnValue.Direction = ParameterDirection.ReturnValue;
            returnValue.ParameterName = "ReturnValue";
            valCmd.Parameters.Add(returnValue);

            valCon.Open();
            valCmd.ExecuteNonQuery();
            int retVal = Convert.ToInt32(returnValue.Value);
            valCon.Close();

            if (retVal == 0)
            {
                SqlCommand bidCmd;
                SqlDataReader bidRdr;

                SqlConnection bidCon;
                bidCon = new SqlConnection(strCon);
                string bidSP = "submitbid";

                bidCmd = new SqlCommand(bidSP, bidCon);
                bidCmd.CommandType = CommandType.StoredProcedure;

                objParm = new SqlParameter("@player_id", System.Data.SqlDbType.Int);
                objParm.Value = ddPlayers.SelectedValue;
                objParm.Direction = System.Data.ParameterDirection.Input;
                bidCmd.Parameters.Add(objParm);

                objParm = new SqlParameter("@owner_id", System.Data.SqlDbType.Int);
                objParm.Value = ddOwners.SelectedValue;
                objParm.Direction = System.Data.ParameterDirection.Input;
                bidCmd.Parameters.Add(objParm);

                objParm = new SqlParameter("@bid", System.Data.SqlDbType.Int);
                objParm.Value = bidAmount.Text;
                objParm.Direction = System.Data.ParameterDirection.Input;
                bidCmd.Parameters.Add(objParm);


                bidCon.Open();
                bidRdr = bidCmd.ExecuteReader();
                bidCon.Close();

                /*bidCon.Open();
                string playerList = "SELECT player_id, player_name FROM [availablePlayers]";
                SqlDataAdapter playerAd1;
                DataSet playerDs1 = new DataSet();
                playerAd1 = new SqlDataAdapter(playerList, bidCon);
                playerAd1.Fill(playerDs1, "players");
                ddPlayers.DataSource = playerDs1.Tables["players"].DefaultView;
                ddPlayers.DataValueField = "player_id";
                ddPlayers.DataTextField = "player_name";
                ddPlayers.DataBind();
                ddPlayers.Items.Insert(0, new ListItem("--", "0"));
                bidCon.Close();*/

                ddPosition.SelectedValue = "0";
                ddPlayers.SelectedValue = "0";
                ddOwners.SelectedValue = "0";
                bidAmount.Text = "";
                //lblSuccess.Text = "Bid Submitted";
                resultsGrid.DataBind();
                //Response.Redirect("slidinglink.aspx#_enterPicks");
            }
            else if (retVal == 99)
            {
                lblVal.Text = "Insufficient Funds!";
                ddPosition.SelectedValue = "0";
                ddPlayers.SelectedValue = "0";
                ddOwners.SelectedValue = "0";
                bidAmount.Text = "";
            }
            else if (retVal == 1)
            {
                lblVal.Text = "That's too many QBs " + ddOwners.SelectedItem.Text + "!";
                ddPosition.SelectedValue = "0";
                ddPlayers.SelectedValue = "0";
                ddOwners.SelectedValue = "0";
                bidAmount.Text = "";
            }
            else if (retVal == 2)
            {
                lblVal.Text = "That's too many RBs " + ddOwners.SelectedItem.Text + "!";
                ddPosition.SelectedValue = "0";
                ddPlayers.SelectedValue = "0";
                ddOwners.SelectedValue = "0";
                bidAmount.Text = "";
            }
            else if (retVal == 3)
            {
                lblVal.Text = "That's too many WRs " + ddOwners.SelectedItem.Text + "!";
                ddPosition.SelectedValue = "0";
                ddPlayers.SelectedValue = "0";
                ddOwners.SelectedValue = "0";
                bidAmount.Text = "";
            }
            else if (retVal == 4)
            {
                lblVal.Text = "That's too many TEs " + ddOwners.SelectedItem.Text + "!";
                ddPosition.SelectedValue = "0";
                ddPlayers.SelectedValue = "0";
                ddOwners.SelectedValue = "0";
                bidAmount.Text = "";
            }
            else if (retVal == 5)
            {
                lblVal.Text = "That's too many Ks " + ddOwners.SelectedItem.Text + "!";
                ddPosition.SelectedValue = "0";
                ddPlayers.SelectedValue = "0";
                ddOwners.SelectedValue = "0";
                bidAmount.Text = "";
            }
            else if (retVal == 6)
            {
                lblVal.Text = "That's too many DEFs " + ddOwners.SelectedItem.Text + "!";
                ddPosition.SelectedValue = "0";
                ddPlayers.SelectedValue = "0";
                ddOwners.SelectedValue = "0";
                bidAmount.Text = "";
            }
        }
    }
    protected void undoLast_Click(object sender, EventArgs e)
    {
        SqlCommand undoCmd;
        SqlDataReader undoRdr;

        string strCon = ConfigurationManager.AppSettings["ArvixeSql"];
        SqlConnection undoCon;
        undoCon = new SqlConnection(strCon);
        string undoSP = "deleteLast";
        undoCmd = new SqlCommand(undoSP, undoCon);
        undoCmd.CommandType = CommandType.StoredProcedure;

        undoCon.Open();
        undoRdr = undoCmd.ExecuteReader();
        undoCon.Close();

        undoCon.Open();
        string playerList = "SELECT player_id, player_name FROM [availablePlayers]";
        SqlDataAdapter playerAd1;
        DataSet playerDs1 = new DataSet();
        playerAd1 = new SqlDataAdapter(playerList, undoCon);
        playerAd1.Fill(playerDs1, "players");
        ddPlayers.DataSource = playerDs1.Tables["players"].DefaultView;
        ddPlayers.DataValueField = "player_id";
        ddPlayers.DataTextField = "player_name";
        ddPlayers.DataBind();
        ddPlayers.Items.Insert(0, new ListItem("--", "0"));
        undoCon.Close();

        ddPosition.SelectedValue = "0";
        ddPlayers.SelectedValue = "0";
        ddOwners.SelectedValue = "0";
        bidAmount.Text = "";
        resultsGrid.DataBind();
    }
}