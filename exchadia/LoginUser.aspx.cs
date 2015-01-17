using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class LoginUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try { this.TextBox1.Text = this.Page.Request.UrlReferrer.AbsolutePath.ToString(); }

            catch { this.TextBox1.Text = "searchFlights.aspx"; }
        }
        
    }

    protected void Login1_OnLoggedIn(object sender, EventArgs e)
    {
        string requestPage = this.TextBox1.Text.ToString();
        Response.Redirect(requestPage, true); 
    }

}