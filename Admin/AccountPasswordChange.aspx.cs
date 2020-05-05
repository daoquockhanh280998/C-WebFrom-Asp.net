using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class Admin_AccountPasswordChange : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ucMessage.ShowInfo("Xin Mời Nhập Mật Khẩu Mới");
            string username = Request.QueryString["id"].ToSafetyString();
            input_UserName.Value = username;
            input_UserName.Disabled = true;

        }
    }

    protected void LinkButton_Save_Click(object sender, EventArgs e)
    {
        string username = Request.QueryString["id"].ToSafetyString();
        // vào db kt tài khoản
        DBEntities dB = new DBEntities();
        var item = dB.Accounts.Where(x => x.Username == username).FirstOrDefault();
        if (item == null)
        {
            ucMessage.ShowError("Tài Khoản Này Không Tồn Tại. <a href='/Admin/Default.aspx'>Về Trang Chủ</a>");
            return;
        }
        string password = input_Password.Value.Trim();
        string repassword = input_RePassword.Value.Trim();

        if (password == string.Empty || password != repassword)
        {
            ucMessage.ShowError("Hãy Nhập Mật Khẩu 2 Lần Giống Nhau");
            return;
        }

        item.Password = password;
        dB.SaveChanges();

        ucMessage.ShowSuccess("Đã Lưu Mật Khẩu Mới");
        return;
    }
}