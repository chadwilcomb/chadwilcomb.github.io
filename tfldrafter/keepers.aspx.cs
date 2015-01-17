using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class keepers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string strCon = ConfigurationManager.AppSettings["ArvixeSql"];
            SqlConnection keeperCon;
            keeperCon = new SqlConnection(strCon);

            string selOwners = "Select owner_id, owner_name from owners";
            SqlDataReader keeperRdr;
            SqlCommand keeperCmd;
            keeperCmd = new SqlCommand(selOwners, keeperCon);
            keeperCon.Open();
            keeperRdr = keeperCmd.ExecuteReader();
            ddOwners.DataSource = keeperRdr;
            ddOwners.DataTextField = "owner_name";
            ddOwners.DataValueField = "owner_id";
            ddOwners.DataBind();
            keeperCon.Close();
        }


        fillKeeperGrid();

    }

    private void fillKeeperGrid()
    {
        string strCon = ConfigurationManager.AppSettings["ArvixeSql"];
        SqlConnection keeperCon;
        keeperCon = new SqlConnection(strCon);

        var ownerName = ddOwners.SelectedItem.Text;
        string selKeeper = "Select player_name, bid, (bid + 8) as year2, (bid + 24) as year3, (bid + 28) as year4 from keeperLog where keeper_year is not null and owner_name = '" + ownerName + "' order by bid desc";


        SqlDataAdapter keeperAd;
        DataSet ownerDs = new DataSet();

        keeperAd = new SqlDataAdapter(selKeeper, keeperCon);
        keeperAd.Fill(ownerDs, "keepers");

        gvKeepers.DataSource = ownerDs.Tables["keepers"].DefaultView;
        gvKeepers.DataBind();
    }

    

    protected void pickOwner(object sender, EventArgs e)
    {
        fillKeeperGrid();
    }
}