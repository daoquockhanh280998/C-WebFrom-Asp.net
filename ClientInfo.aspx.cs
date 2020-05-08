using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
    }

    public void LoadData()
    {
        if (SessionUtility.Client == null)
        {
            Response.Redirect("/");
        }
        else
        {
            span_Email.InnerHtml = SessionUtility.Client.Email;
            span_FullName.InnerHtml = SessionUtility.Client.FullName;
            span_Mobi.InnerHtml = SessionUtility.Client.Mobi.ToString();
            if (SessionUtility.Client.Gender == true)
            {
                span_Gender.InnerHtml = "Nam";
            }
            else
            {
                span_Gender.InnerHtml = "Nữ";
            }
            span_Address.InnerHtml = SessionUtility.Client.Address;
        }

    }

    protected void LinkButton_Logout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("/");
    }
}