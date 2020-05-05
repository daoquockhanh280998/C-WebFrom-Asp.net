using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class ucSearch : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string keyword = Request.QueryString["keyword"].ToUrlDecode();
            input_Search.Value = keyword;
        }
    }

    protected void LinkButton_Search_Click(object sender, EventArgs e)
    {
        string keyword = input_Search.Value.Trim().ToUrlEncode();
        string url = "/ProductSearch.aspx?keyword={0}".StringFormat(keyword);
        Response.Redirect(url);
    }
}