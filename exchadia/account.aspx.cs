using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class account : System.Web.UI.Page
{
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

    }

    protected void  Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmdOrders;
        SqlDataReader rdrOrders;
        SqlConnection con = conn();
        string selFlights = "userHistory";

        SqlParameter objParm;
        cmdOrders = new SqlCommand(selFlights, con);
        cmdOrders.CommandType = CommandType.StoredProcedure;

        objParm = new SqlParameter("@username", System.Data.SqlDbType.NVarChar, 256);
        objParm.Value = User.Identity.Name;
        objParm.Direction = System.Data.ParameterDirection.Input;
        cmdOrders.Parameters.Add(objParm);

        cmdOrders.Connection = con;
        rdrOrders = cmdOrders.ExecuteReader();

        if (rdrOrders.HasRows == true)
        {
            gvOrders.DataSource = rdrOrders;
            gvOrders.DataBind();
            con.Close();
        }
        else
        {
            lblNoRecords.Text = "You have no flights in your account history.";
        }

        
    }
}