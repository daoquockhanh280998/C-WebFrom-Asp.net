using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucAccountHeader : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Client"] == null)
            {
                span_Login.Visible = true;
                span_info.Visible = false;
            }
            else
            {
                span_info.Visible = true;
                span_Login.Visible = false;

                Client item = Session["Client"] as Client;
                //a_name.InnerHtml = item.FullName;
            }
        }
    }

    protected void LinkButton_Logout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("/Default.aspx");
    }
}