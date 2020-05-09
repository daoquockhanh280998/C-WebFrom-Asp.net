using CodeUtility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
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
        string email = SessionUtility.Cart.Email;
        DBEntities db = new DBEntities();
        var data = db.Clients.Where(x => x.Email == email).FirstOrDefault();
        

        input_Email.Value = data.Email;
        input_Fullname.Value = data.FullName;
        if (data.Mobi == string.Empty)
        {
            input_Mobi.Value = string.Empty;
        }
        else
        {
            input_Mobi.Value = data.Mobi;
        }
        if (data.Gender == true)
        {
            input_Gender.Value = "Nam";
        }
        else
        {
            input_Gender.Value = "Nữ";
        }
        input_Address.Value = data.Address;
    }

    public bool IsNumber(string pText)
    {
        Regex regex = new Regex(@"^[-+]?[0-9]*\.?[0-9]+$");
        return regex.IsMatch(pText);
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
        if (input_Mobi.Value == string.Empty || IsNumber(input_Mobi.Value) == false)
        {
            ucMessage.ShowError("Bạn Chưa Nhập Số Điện Thoại <br /> Hoặc Bạn Nhập Sai Định Dạng Số Điện Thoại  ");
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