using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;


public partial class searchFlights : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CompareValidator2.ValueToCompare = DateTime.Today.ToString("MM/dd/yyyy");

        if (!Page.IsPostBack)
        {
            DataSet cityList = new DataSet();
            cityList.ReadXml(Server.MapPath("~/xml/airports.xml"));
            ddDepart.DataSource = cityList;
            ddDepart.DataValueField = "Code";
            ddDepart.DataTextField = "Name";
            ddDepart.DataBind();
            ddDepart.Items.Insert(0, new ListItem("Choose Departing City...", "NA"));
            
            ddDest.DataSource = cityList;
            ddDest.DataValueField = "Code";
            ddDest.DataTextField = "Name";
            ddDest.DataBind();
            ddDest.Items.Insert(0, new ListItem("Choose Destination City...", "NA"));
        }
    }
    
    private SqlConnection conn()
    {
        SqlConnection objCon;
        string strCon = ConfigurationManager.AppSettings["exchadia"];
        objCon = new SqlConnection(strCon);
        objCon.Open();
        return objCon;
    }
    
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lblSrchError.Text = "";

        if (ddDepart.SelectedValue != "" && ddDest.SelectedValue != "")
        {
            SqlCommand dCmd;
            SqlCommand rCmd;
            SqlDataReader dObjRd;
            SqlDataReader rObjRd;
            SqlConnection con = conn();
            string dep = "selectDepart";
            string ret = "selectReturn";

            SqlParameter objParm;
            dCmd = new SqlCommand(dep, con);
            rCmd = new SqlCommand(ret, con);
            dCmd.CommandType = CommandType.StoredProcedure;
            rCmd.CommandType = CommandType.StoredProcedure;

            objParm = new SqlParameter("@departDate", System.Data.SqlDbType.VarChar);
            objParm.Size = 10;
            objParm.Value = calDepart.Text;
            objParm.Direction = System.Data.ParameterDirection.Input;
            dCmd.Parameters.Add(objParm);

            objParm = new SqlParameter("@returnDate", System.Data.SqlDbType.VarChar);
            objParm.Size = 10;
            objParm.Value = calReturn.Text;
            objParm.Direction = System.Data.ParameterDirection.Input;
            rCmd.Parameters.Add(objParm);

            objParm = new SqlParameter("@departCode", System.Data.SqlDbType.VarChar);
            objParm.Size = 3;
            objParm.Value = ddDepart.SelectedValue;
            objParm.Direction = System.Data.ParameterDirection.Input;
            dCmd.Parameters.Add(objParm);

            objParm = new SqlParameter("@departCode", System.Data.SqlDbType.VarChar);
            objParm.Size = 3;
            objParm.Value = ddDepart.SelectedValue;
            objParm.Direction = System.Data.ParameterDirection.Input;
            rCmd.Parameters.Add(objParm);

            objParm = new SqlParameter("@destCode", System.Data.SqlDbType.VarChar);
            objParm.Size = 3;
            objParm.Value = ddDest.SelectedValue;
            objParm.Direction = System.Data.ParameterDirection.Input;
            dCmd.Parameters.Add(objParm);

            objParm = new SqlParameter("@destCode", System.Data.SqlDbType.VarChar);
            objParm.Size = 3;
            objParm.Value = ddDest.SelectedValue;
            objParm.Direction = System.Data.ParameterDirection.Input;
            rCmd.Parameters.Add(objParm);

            dCmd.Connection = con;
            dObjRd = dCmd.ExecuteReader();
            GridView1.DataSource = dObjRd;
            GridView1.DataBind();
            con.Close();

            con.Open();
            rCmd.Connection = con;
            rObjRd = rCmd.ExecuteReader();
            GridView2.DataSource = rObjRd;
            GridView2.DataBind();
            con.Close();

            if (GridView1.Rows.Count == 0 && GridView2.Rows.Count == 0)
            {
                lblSrchError.Text = "No flights are available between " + ddDepart.SelectedValue + " and " + ddDest.SelectedValue + " on the selected dates";
                selectFlights.Visible = false;
            }
            else if (GridView1.Rows.Count == 0 && GridView2.Rows.Count > 0)
            {
                lblSrchError.Text = "No flights are available from " + ddDepart.SelectedValue + " to " + ddDest.SelectedValue + " on the selected dates";
                selectFlights.Visible = true;
            }
            else if (GridView1.Rows.Count > 0 && GridView2.Rows.Count == 0)
            {
                lblSrchError.Text = "No flights are available from " + ddDest.SelectedValue + " to " + ddDepart.SelectedValue + " on the selected dates";
                selectFlights.Visible = true;
            }
            else
            {
                selectFlights.Visible = true;
            }
        }
        else
        {
            lblSrchError.Text = "You must choose a departure and destination city";
        }

    }

    protected void selectFlights_Click(object sender, EventArgs e)
    {
        GridViewRow depRow;
        GridViewRow retRow;
        depRow = GridView1.SelectedRow;
        retRow = GridView2.SelectedRow;
        int index1 = GridView1.SelectedIndex;
        int index2 = GridView2.SelectedIndex;
        

        if (depRow != null && retRow != null)
        {
            Session["depFlightID"] = GridView1.DataKeys[index1].Value.ToString();
            Session["retFlightID"] = GridView2.DataKeys[index2].Value.ToString();
            Response.Redirect("confirmflights.aspx");
        }
        else if (depRow != null && retRow == null)
        {
            lblError.Text = "You must select a return flight";
        }
        else if (depRow == null && retRow != null)
        {
            lblError.Text = "You must select a departing flight";
        }
        else
        {
            lblError.Text = "You must select some flights!";
        }
    }
}