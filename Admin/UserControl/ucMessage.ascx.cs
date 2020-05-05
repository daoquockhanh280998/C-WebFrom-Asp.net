using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucMessage : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void ShowSuccess(string message)
    {
        div_Error.Visible = false;
        div_info.Visible = false;
        div_Success.Visible = true;
        span_Success.InnerHtml = message; //InnerHtml là hàm đổ dữ liệu vào
    }
    public void ShowError(string message)
    {
        div_Success.Visible = false;
        div_info.Visible = false;
        div_Error.Visible = true;
        span_Error.InnerHtml = message;
    }
    public void ShowInfo(string message)
    {
        div_Success.Visible = false;
        div_Error.Visible = false;
        div_info.Visible = true;
        span_info.InnerHtml = message;
    }
    public void HideAll()
    {
        div_Success.Visible = false;
        div_Error.Visible = false;
        div_info.Visible = false;
    }
}