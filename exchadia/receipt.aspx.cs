using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class receipt : System.Web.UI.Page
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
        SqlCommand cmdReceipt;
        SqlDataReader rdrReceipt;
        SqlConnection con = conn();
        string selFlights = "Receipt";

        SqlParameter objParm;
        cmdReceipt = new SqlCommand(selFlights, con);
        cmdReceipt.CommandType = CommandType.StoredProcedure;

        objParm = new SqlParameter("@confNum", System.Data.SqlDbType.VarChar, 7);
        objParm.Value = (String)Session["confNum"];
        objParm.Direction = System.Data.ParameterDirection.Input;
        cmdReceipt.Parameters.Add(objParm);

        cmdReceipt.Connection = con;
        rdrReceipt = cmdReceipt.ExecuteReader();

        DetailsView1.DataSource = rdrReceipt;
        DetailsView1.DataBind();

        con.Close();

    }
}