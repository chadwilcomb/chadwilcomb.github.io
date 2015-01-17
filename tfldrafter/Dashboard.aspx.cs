using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strCon = ConfigurationManager.AppSettings["ArvixeSql"];
        string ownerNames = "Select owner_name, Funds, (Funds - OpenSpots) AS availFunds from draftSummary ORDER BY auction_order_2011";
        SqlConnection objCon;
        SqlDataAdapter ownerAd;
        DataSet ownerDs = new DataSet();
        objCon = new SqlConnection(strCon);
        ownerAd = new SqlDataAdapter(ownerNames, objCon);
        ownerAd.Fill(ownerDs, "draftSum");

        DataTable ownerDt = ownerDs.Tables["draftSum"];
        lblTeam1.Text = ownerDt.Rows[0][0].ToString();
        lblTeam2.Text = ownerDt.Rows[1][0].ToString();
        lblTeam3.Text = ownerDt.Rows[2][0].ToString();
        lblTeam4.Text = ownerDt.Rows[3][0].ToString();
        lblTeam5.Text = ownerDt.Rows[4][0].ToString();
        lblTeam6.Text = ownerDt.Rows[5][0].ToString();
        lblTeam7.Text = ownerDt.Rows[6][0].ToString();
        lblTeam8.Text = ownerDt.Rows[7][0].ToString();
        lblTeam9.Text = ownerDt.Rows[8][0].ToString();
        lblTeam10.Text = ownerDt.Rows[9][0].ToString();
        lblTeam11.Text = ownerDt.Rows[10][0].ToString();
        lblTeam12.Text = ownerDt.Rows[11][0].ToString();

        lblFunds1.Text = "$" + ownerDt.Rows[0][1].ToString() + " ($" + ownerDt.Rows[0][2].ToString() + ")";
        lblFunds2.Text = "$" + ownerDt.Rows[1][1].ToString() + " ($" + ownerDt.Rows[1][2].ToString() + ")";
        lblFunds3.Text = "$" + ownerDt.Rows[2][1].ToString() + " ($" + ownerDt.Rows[2][2].ToString() + ")";
        lblFunds4.Text = "$" + ownerDt.Rows[3][1].ToString() + " ($" + ownerDt.Rows[3][2].ToString() + ")";
        lblFunds5.Text = "$" + ownerDt.Rows[4][1].ToString() + " ($" + ownerDt.Rows[4][2].ToString() + ")";
        lblFunds6.Text = "$" + ownerDt.Rows[5][1].ToString() + " ($" + ownerDt.Rows[5][2].ToString() + ")";
        lblFunds7.Text = "$" + ownerDt.Rows[6][1].ToString() + " ($" + ownerDt.Rows[6][2].ToString() + ")";
        lblFunds8.Text = "$" + ownerDt.Rows[7][1].ToString() + " ($" + ownerDt.Rows[7][2].ToString() + ")";
        lblFunds9.Text = "$" + ownerDt.Rows[8][1].ToString() + " ($" + ownerDt.Rows[8][2].ToString() + ")";
        lblFunds10.Text = "$" + ownerDt.Rows[9][1].ToString() + " ($" + ownerDt.Rows[9][2].ToString() + ")";
        lblFunds11.Text = "$" + ownerDt.Rows[10][1].ToString() + " ($" + ownerDt.Rows[10][2].ToString() + ")";
        lblFunds12.Text = "$" + ownerDt.Rows[11][1].ToString() + " ($" + ownerDt.Rows[11][2].ToString() + ")";
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
                e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFCC99");
            }
            else if (drv["pos"].ToString().Equals("RB"))
            {
                e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#CCFF99");
            }
            else if (drv["pos"].ToString().Equals("WR"))
            {
                e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFF99");
            }
            else if (drv["pos"].ToString().Equals("TE"))
            {
                e.Row.BackColor = System.Drawing.Color.LightBlue;
            }
            else if (drv["pos"].ToString().Equals("K"))
            {
                e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFCC66");
            }
            else if (drv["pos"].ToString().Equals("DEF"))
            {
                e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#CCBB88");
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
}