using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class resultsOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string resOrder = "SELECT owner_name, winning_bid, player_name, pos, team FROM [draftResults] ORDER BY pick_time";
        string strCon = ConfigurationManager.AppSettings["ArvixeSql"];
        SqlConnection objCon;
        objCon = new SqlConnection(strCon);
        DataSet ownerDs = new DataSet();

        SqlDataAdapter ownerAd;
        ownerAd = new SqlDataAdapter(resOrder, objCon);
        ownerAd.Fill(ownerDs, "results");

        gvResults.DataSource = ownerDs.Tables["results"].DefaultView;
        gvResults.DataBind();

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
}