using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class netintensive_form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        res_table.Visible = false;
    }

    protected void submit(object sender, EventArgs e)
    {
        
        if (!Page.IsValid) 
        {
            ret_info.Text = "There are errors in the form";
            ret_info.CssClass = "validation";
            
        }
        else
        {
            res_table.Visible = true;
            res_user.Text = username.Text;
            res_pwd.Text = pwd.Text;
            res_name.Text = name.Text;
            res_email.Text = email.Text;
            res_add.Text = snail.Text;
            res_atype.Text = addtype.SelectedItem.Text;
            res_contact.Text = contact.SelectedItem.Text;

            foreach (Control c in form1.Controls)
            {
                if (c.GetType() == typeof(TextBox))
                {
                    ((TextBox)(c)).Text = string.Empty;
                }
            }
        }
        
    }
}