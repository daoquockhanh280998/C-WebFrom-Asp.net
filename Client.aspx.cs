using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class AccountLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            register.Visible = false;
            login.Visible = true;

            ucMessage.HideAll();
            ucMessage1.HideAll();
            ucMessage1.ShowInfo("Mời Nhập Thông Tin Tài Khoản");
        }
    }

    protected void LinkButton_Login_Click(object sender, EventArgs e)
    {
        string password = input_Login_Password.Value.Trim();
        string email = input_Login_Email.Value.Trim();

        if (email == string.Empty || password == string.Empty)
        {
            ucMessage.ShowError("Vui Lòng Nhập Đầy Đủ Thông Tin");
            return;
        }
        //kiểm tra tồn tại
        DBEntities db = new DBEntities();
        var item = db.Clients.Where(x => x.Email == email && x.Password == password).FirstOrDefault();

        //thông báo
        if (item == null)
        {
            ucMessage.ShowError("Tài Khoản Hoặc Mật Khẩu Không Hợp Lệ");
            return;
        }
        else
        {
            if (item.Email == "admin")
            {
                Response.Redirect("/Admin/Default.aspx");
            }
            else
            {
                SessionUtility.Client = item;

                // lưu thông tin khách vào session để có thể kiểm tra lại đơn hàng
                SessionUtility.Cart.Email = email;
                Response.Redirect("/Default.aspx");


            }


        }

    }



    protected void LinkButton_Register_Click(object sender, EventArgs e)
    {

        string email = input_Register_Email.Value.Trim();
        string fullname = input_Register_Fullname.Value.Trim();
        string mobi = input_Register_Mobi.Value.Trim();
        string password = input_Register_Password.Value.Trim();
        string repassword = input_Register_Repassword.Value.Trim();
        bool gender = radio_GenderMale.Checked ? true : false;
        string address = input_Register_Address.Value.Trim();
        //kiểm tra có null không
        if (email.IsNullOrEmptyOrWhiteSpaces() || !email.IsEmailFormat())
        {
            ucMessage1.ShowError("Mời Nhập Email Đúng Định Dạng");
            return;
        }
        if (password.IsNullOrEmptyOrWhiteSpaces() || password != repassword)
        {
            ucMessage1.ShowError("Mời Nhập Mật Khẩu 2 Lần Giống Nhau");
            return;
        }
        if (fullname.IsNullOrEmptyOrWhiteSpaces())
        {
            ucMessage1.ShowError("Mời Nhập Họ Tên ");
            return;
        }
        if (mobi.IsNullOrEmptyOrWhiteSpaces())
        {
            ucMessage1.ShowError("Mời Nhập Số Điện Thoại");
            return;
        }

        if (address.IsNullOrEmptyOrWhiteSpaces())
        {
            ucMessage1.ShowError("Mời Nhập Địa Chỉ");
            return;
        }

        // kiểm tra Email có tồn tại hay chưa
        DBEntities db = new DBEntities();
        var checkemail = db.Clients.Where(x => x.Email == email).FirstOrDefault();
        if (checkemail != null)
        {
            ucMessage1.ShowError("Email Này Đã Từng Đăng Kí <br /> Vui Lòng Nhập Email Khác");
            return;
        }
        //tạo đối tượng chứa dữ liệu để lưu vào db
        Client item = new Client();
        item.Email = email;
        item.FullName = fullname;
        item.Mobi = mobi;
        item.Password = password;
        item.Gender = gender;
        item.Address = address;

        //thêm vào db
        db.Clients.Add(item);

        // lưu vào db
        db.SaveChanges();

        //thông báo
        ucMessage1.ShowSuccess("Đã Tạo Tài Khoản Thành Công");
    }

    public void CLearFrom()
    {
        input_Register_Email.Value = string.Empty;
        input_Register_Fullname.Value = string.Empty;
        input_Register_Mobi.Value = string.Empty;
        input_Register_Password.Value = string.Empty;
        input_Register_Repassword.Value = string.Empty;
        input_Register_Address.Value = string.Empty;
    }

    protected void LinkButton_Login_header_Click(object sender, EventArgs e)
    {
        register.Visible = false;
        login.Visible = true;
    }

    protected void LinkButton_Register_header_Click(object sender, EventArgs e)
    {
        register.Visible = true;
        login.Visible = false;
    }
}