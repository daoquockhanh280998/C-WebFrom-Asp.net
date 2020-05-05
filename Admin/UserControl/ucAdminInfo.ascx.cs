using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucAdminInfo : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckLogin();
        if (!IsPostBack)
        {
            LoadData();
        }
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {

        LoadData();

    }
    public void LoadData()
    {

        //InnerHtml
        a_Info_FullName.InnerHtml = SessionUtility.AdminFullName;
        span_Info_Email.InnerHtml = SessionUtility.AdminEmail ;

        //Src
        img_Avatar.Src = SessionUtility.AdminAvatar;
        img_Info_Avatar.Src = SessionUtility.AdminAvatar;

        //href
        a_Info_AccountEdit.HRef = "/Admin/AccountEdit.aspx?id=" + SessionUtility.AdminUsername;
        a_Info_PasswordChange.HRef = "/Admin/AccountPasswordChange.aspx?id=" + SessionUtility.AdminUsername;
    }
    public void CheckLogin()
    {
        if (SessionUtility.AdminUsername == null || SessionUtility.AdminUsername == string.Empty)
        {
            Response.Redirect("/Admin/Login.aspx");
        }
    }

    protected void LinkButton_Logout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("/Admin/Login.aspx");
    }
}