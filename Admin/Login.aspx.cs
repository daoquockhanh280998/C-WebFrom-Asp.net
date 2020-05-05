using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ucMessage.HideAll();
            ucMessage.ShowInfo("Mời Đăng Nhập");
        }
    }

    protected void LinkButton_Login_Click(object sender, EventArgs e)
    {
        string username = input_Username.Value.Trim();
        string password = input_Password.Value.Trim();
        DBEntities db = new DBEntities();
        var data = db.Accounts.Where(x => x.Username == username && x.Password == password
                                               && x.Status == true).FirstOrDefault();
        if (data !=null)
        {
            ucMessage.ShowSuccess("Đăng Nhập Thành Công");
            SessionUtility.AdminUsername = data.Username;
            SessionUtility.AdminFullName = data.FullName;
            SessionUtility.AdminAvatar = data.Avatar;
            SessionUtility.AdminEmail = data.Email;
            SessionUtility.AdminCategoryID = data.AccountCategoryID;
            Response.Redirect("/Admin/Default.aspx");

        }
        else
        {
            ucMessage.ShowError("Tài Khoản Không Hợp Lệ");
        }
    }
}