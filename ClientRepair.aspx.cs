using CodeUtility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (SessionUtility.Cart == null)
            {
                Response.Redirect("/");
            }
            else
            {
                ucMessage.HideAll();
                LoadData();
            }

        }
    }

    public void LoadData()
    {

        input_Email.Value = SessionUtility.Cart.Email;
        input_Fullname.Value = SessionUtility.Cart.FullName;
        if (SessionUtility.Cart.Mobi == 0)
        {
            input_Mobi.Value = string.Empty;
        }
        if (SessionUtility.Cart.Mobi2 == 0)
        {
            input_Mobi.Value = string.Empty;
        }

        if (SessionUtility.Cart.Gender == true)
        {
            input_Gender.Value = "Nữ";
        }
        else
        {
            input_Gender.Value = "Nam";
        }
        input_Address.Value = SessionUtility.Cart.Address;
    }




    protected void LinkButton_Update_Click(object sender, EventArgs e)
    {
        // lấy email từ session
        string Email = SessionUtility.Cart.Email;
        // vào db
        DBEntities db = new DBEntities();
        var item = db.Clients.Where(x => x.Email == Email).FirstOrDefault();

        //kiểm tra nhập dữ liệu vào ô chưa
        if (input_Email.Value == string.Empty || !input_Email.Value.IsEmailFormat())
        {
            ucMessage.ShowError("Bạn Phải Nhập Email Đúng Định Dạng");
            return;
        }
        if (input_Fullname.Value == string.Empty)
        {
            ucMessage.ShowError("Bạn Phải Nhập Họ Và Tên");
            return;
        }
        if (input_Mobi.Value == string.Empty)
        {
            ucMessage.ShowError("Bạn Phải Nhập Số Điện Thoại 1 ");
            return;
        }
        if (input_Mob2.Value == string.Empty)
        {
            ucMessage.ShowError("Bạn Phải Nhập Số Điện Thoại 2 ");
            return;
        }

        if (input_Address.Value == string.Empty)
        {
            ucMessage.ShowError("Bạn Phải Nhập Địa Chỉ ");
            return;
        }

        // nhập các thông tin mới
        item.Email = input_Email.Value.Trim();
        item.FullName = input_Fullname.Value.Trim();
        item.Mobi = input_Mobi.Value.Trim();
        item.Address = input_Address.Value.Trim();


        //lưu db
        db.SaveChanges();
        // thông báo
        ucMessage.ShowSuccess("Đã Update Tài Khoản");

        // update session
        SessionUtility.Cart.Email = item.Email;
        SessionUtility.Cart.FullName = item.FullName;
        SessionUtility.Cart.Mobi = item.Mobi.ToInt();
        SessionUtility.Cart.Address = item.Address;

    }
}