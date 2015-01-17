using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class confirmFlights : System.Web.UI.Page
{
    decimal priceTotal = 0;

    private SqlConnection conn()
    {
        SqlConnection objCon;
        string strCon = ConfigurationManager.AppSettings["exchadia"];
        objCon = new SqlConnection(strCon);
        objCon.Open();
        return objCon;
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        try {
            SqlCommand selFlCmd;
            SqlDataReader selFlRdr;
            SqlConnection con = conn();
            string selFlights = "selectedFlights";

            SqlParameter objParm;
            selFlCmd = new SqlCommand(selFlights, con);
            selFlCmd.CommandType = CommandType.StoredProcedure;

            objParm = new SqlParameter("@depFlightID", System.Data.SqlDbType.VarChar);
            objParm.Size = 50;
            objParm.Value = (String)Session["depFlightID"];
            objParm.Direction = System.Data.ParameterDirection.Input;
            selFlCmd.Parameters.Add(objParm);

            objParm = new SqlParameter("@retFlightID", System.Data.SqlDbType.VarChar);
            objParm.Size = 50;
            objParm.Value = (String)Session["retFlightID"];
            objParm.Direction = System.Data.ParameterDirection.Input;
            selFlCmd.Parameters.Add(objParm);

            selFlCmd.Connection = con;
            selFlRdr = selFlCmd.ExecuteReader();
            GridView1.DataSource = selFlRdr;
            GridView1.DataBind();
            con.Close();
        }
        catch 
        {
            Session.Clear();
            Response.Redirect("searchFlights.aspx");
        }
    }

    protected void GridView1_DataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            priceTotal += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Cost"));
        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[6].Text = "Total Cost:";
            e.Row.Cells[7].Text = priceTotal.ToString("c");
            e.Row.Font.Bold = true;
        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("searchFlights.aspx");
    }
    protected void btnPurchase_Click(object sender, EventArgs e)
    {
        SqlCommand purchaseFlights;
        SqlDataReader pObjRd;
        SqlConnection con = conn();
        string purchase = "purchaseFlights";

        DataTable selFlights = (DataTable)Session["selFlights"];

        SqlParameter objParm;
        purchaseFlights = new SqlCommand(purchase, con);
        purchaseFlights.CommandType = CommandType.StoredProcedure;

        objParm = new SqlParameter("@username", SqlDbType.VarChar);
        objParm.Value = User.Identity.Name;
        objParm.Direction = ParameterDirection.Input;
        purchaseFlights.Parameters.Add(objParm);

        objParm = new SqlParameter("@depUniqueFlightID", SqlDbType.VarChar);
        objParm.Value = (String)Session["depFlightID"];
        objParm.Direction = ParameterDirection.Input;
        purchaseFlights.Parameters.Add(objParm);

        objParm = new SqlParameter("@retUniqueFlightID", SqlDbType.VarChar);
        objParm.Value = (String)Session["retFlightID"];
        objParm.Direction = ParameterDirection.Input;
        purchaseFlights.Parameters.Add(objParm);

        purchaseFlights.Connection = con;
        pObjRd = purchaseFlights.ExecuteReader();
        pObjRd.Read();

        Label1.Text = pObjRd.GetString(0);
        Session.Clear();
        Session["confNum"] = pObjRd.GetString(0);
        Response.Redirect("receipt.aspx");


    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginUser.aspx");
    }
}