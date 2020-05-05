using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ucMessage.ShowInfo("Mời Nhập Thông Tin");
            LoadCategory();
            LoadData();
        }
    }
    public void LoadCategory()
    {
        DBEntities db = new DBEntities();
        var data = db.AccountCategories.OrderBy(x => x.Position)
                                        .Select(x => new { x.AccountCategoryID, x.Title })
                                        .ToList();
        DropDownList_Category.DataValueField = "AccountCategoryID";
        DropDownList_Category.DataTextField = "Title";

        DropDownList_Category.DataSource = data;
        DropDownList_Category.DataBind();

    }
    public void LoadData()
    {
        // nếu có id trên url thì load dữ liệu hiện có để chỉnh sửa
        // nếu không có id trên url thì thêm mới
        string username = Request.QueryString["id"].ToSafetyString();

        if (username == string.Empty)
        {
            return;
        }
        DBEntities db = new DBEntities();
        var item = db.Accounts.Where(x => x.Username == username).FirstOrDefault();
        // if item = null thì
        if (item == null)
        {
            ucMessage.ShowError("Tài Khoản NÀY Không Tồn Tại. <a href='/Admin/AccountList.aspx'>Xem Danh Sách</a>");
            return;
        }

        // đổ category id
        DropDownList_Category.SelectedValue = item.AccountCategoryID.ToSafetyString();
        // đổ những thông tin khác
        input_UserName.Value = item.Username;
        input_RePassword.Value = item.Password;
        input_RePassword.Value = item.Password;

        if (item.Status == true)
        {
            radio_Lock.Checked = false;
            radio_Active.Checked = true;
        }
        else
        {
            radio_Active.Checked = false;
            radio_Lock.Checked = true;
        }
        input_FullName.Value = item.FullName;
        input_Email.Value = item.Email;
        input_Mobi.Value = item.Mobi;
        textarea_Address.Value = item.Address;
        a_Avatar.HRef = item.Avatar;
        img_Avatar.Src = item.Avatar;

        if (item.Gender == true)
        {
            radio_Female.Checked = false;
            radio_Male.Checked = true;
        }
        else
        {
            radio_Male.Checked = false;
            radio_Female.Checked = true;
        }
        input_CreateTime.Value = item.CreateTime.Value.ToString("dd/MM/yyyy HH:mm:ss ");
    }

    protected void LinkButton_Save_Click(object sender, EventArgs e)
    {
        // lấy id trên url
        string username = Request.QueryString["id"].ToSafetyString();
        DBEntities db = new DBEntities();
        //nếu có id thì Kt tồn tại
        if (username != string.Empty)
        {
            var item = db.Accounts.Where(x => x.Username == username).FirstOrDefault();
            if (item == null)
            {
                ucMessage.ShowError("Tài Khoản Này Không Tồn Tại. <a href='/Admin/AccountList.aspx'>Xem Danh Sách</a>");
                return;
            }
            //kiểm tra nhập dữ liệu vào ô chưa
            string password = input_Password.Value.Trim();
            string repassword = input_RePassword.Value.Trim();
            if (password == string.Empty || password != repassword)
            {
                ucMessage.ShowError("Bạn Phải Nhập Mật Khẩu Giống Nhau");
                return;
            }
            // nhập các thông tin mới
            item.AccountCategoryID = DropDownList_Category.SelectedValue;
            item.Password = input_Password.Value.Trim();
            item.Status = radio_Active.Checked ? true : false;
            item.FullName = input_FullName.Value.Trim();
            item.Email = input_Email.Value.Trim();
            item.Mobi = input_Mobi.Value.Trim();
            item.Address = textarea_Address.Value.Trim();
            item.Gender = radio_Male.Checked ? true : false;

            //upload hình ảnh
            //// kiểm tra có file dc chọn thì mới upload
            if (FileUpload_Avatar.HasFile)
            {
                //// kiểm tra file có đuôi hợp lệ .jpg.png.gif.jpeg
                string filename = FileUpload_Avatar.FileName;
                string extension = Path.GetExtension(filename).ToLower();
                string validFile = ".jpg.png.gif.jpeg";
                if (!validFile.Contains(extension))
                {
                    ucMessage.ShowError("Vùi Lòng chọn ảnh có đuôi: .jpg.png.gif.jpeg");
                    return;
                }
                //chọn thư mục lưu trữ
                string folder = "/FileUpload/image/account/";
                //tạo tên file ngẫu nhiên để lưu trữ
                string radomName = Guid.NewGuid().ToString();
                // tạo url lưu trữ  = folder + tên ngẫu nhiên + đuôi upload
                string saveUrl = folder + radomName + extension;
                //upload vào saveUrl
                FileUpload_Avatar.SaveAs(Server.MapPath(saveUrl));// server.MapPath là hàm chuyển về dg dẫn nội  server
                //update vào item của db
                item.Avatar = saveUrl;
                item.Thumb = saveUrl;

            }

            //lưu db
            db.SaveChanges();
            // thông báo
            ucMessage.ShowSuccess("Đã Update Tài Khoản.  <a href='/Admin/AccountList.aspx'>Xem Danh Sách</a>");

            // update session
            SessionUtility.AdminFullName = item.FullName;
            SessionUtility.AdminAvatar = item.Avatar;
            SessionUtility.AdminEmail = item.Email;


        }
        //Ngược lại thì insert;
        else
        {
            //string accountCategoryid = "SupperAdmin";
            //if (SessionUtility.AdminCategoryID != accountCategoryid )
            //{
            //    Response.Redirect("/Admin/Default.aspx");
            //    return;
            //}

            //kiểm tra nhập dữ liệu vào ô chưa
            if (input_UserName.Value.Trim().IsNullOrEmptyOrWhiteSpaces())
            {
                ucMessage.ShowError("Mời Nhập Tên Đăng Nhập");
                return;
            }
            if (input_Password.Value.Trim() == string.Empty || input_Password.Value != input_RePassword.Value)
            {
                ucMessage.ShowError("Bạn Phải Nhập Mật Khẩu Giống Nhau");
                return;
            }
            if (input_FullName.Value.Trim().IsNullOrEmptyOrWhiteSpaces())
            {
                ucMessage.ShowError("Mời Nhập Họ Tên");
                return;
            }
            if (input_Email.Value.Trim().IsNullOrEmptyOrWhiteSpaces() || !input_Email.Value.Trim().IsEmailFormat())
            {
                ucMessage.ShowError("Mời Nhập Email Đúng Định Dạng");
                return;
            }
            if (input_Mobi.Value.Trim().IsNullOrEmptyOrWhiteSpaces())
            {
                ucMessage.ShowError("Mời Nhập Số Điện Thoại");
                return;
            }
            if (textarea_Address.Value.Trim().IsNullOrEmptyOrWhiteSpaces())
            {
                ucMessage.ShowError("Mời Nhập Địa Chỉ");
                return;
            }
            ////kiểm tra UserName có tồn tại hay chưa
            //string newUserName = input_UserName.Value.Trim();
            //var data = db.Accounts.Where(x => x.Username == newUserName);
            //if (data == null)
            //{
            //    ucMessage.ShowError("Tài Khoản Này Đã Tồn Tại Vui Lòng Nhập Tài Khoản Khác. <a href='/Admin/AccountList.aspx'>Xem Danh Sách</a>" );
            //    return;
            //}

            //tạo 1 account mới
            Account item = new Account();
            // nhập các thông tin mới
            item.Username = input_UserName.Value.Trim();
            item.AccountCategoryID = DropDownList_Category.SelectedValue;
            item.Password = input_Password.Value.Trim();
            item.Status = radio_Active.Checked ? true : false;
            item.FullName = input_FullName.Value.Trim();
            item.Email = input_Email.Value.Trim();
            item.Mobi = input_Mobi.Value.Trim();
            item.Address = textarea_Address.Value.Trim();
            item.Gender = radio_Male.Checked ? true : false;

            //upload hình ảnh
            //// kiểm tra có file dc chọn thì mới upload
            if (FileUpload_Avatar.HasFile)
            {
                //// kiểm tra file có đuôi hợp lệ .jpg.png.gif.jpeg
                string filename = FileUpload_Avatar.FileName;
                string extension = Path.GetExtension(filename).ToLower();
                string validFile = ".jpg.png.gif.jpeg";
                if (!validFile.Contains(extension))
                {
                    ucMessage.ShowError("Vùi Lòng chọn ảnh có đuôi: .jpg.png.gif.jpeg");
                    return;
                }
                //chọn thư mục lưu trữ
                string folder = "/FileUpload/image/account/";
                //tạo tên file ngẫu nhiên để lưu trữ
                string radomName = Guid.NewGuid().ToString();
                // tạo url lưu trữ  = folder + tên ngẫu nhiên + đuôi upload
                string saveUrl = folder + radomName + extension;
                //upload vào saveUrl
                FileUpload_Avatar.SaveAs(Server.MapPath(saveUrl));// server.MapPath là hàm chuyển về dg dẫn nội  server
                //update vào item của db
                item.Avatar = saveUrl;
                item.Thumb = saveUrl;

            }
            else // nếu k chọn hình thì lấy hình mặc định
            {
                item.Avatar = "/Admin/images/no_image.png";
                item.Thumb = "/Admin/images/no_image.png";
            }

            // cập nhật ngày giờ tạo
            item.CreateTime = DateTime.Now;

            //thêm vào bảng
            db.Accounts.Add(item);
            //lưu db
            try
            {
                db.SaveChanges();
                //thông báo
                ucMessage.ShowSuccess("Đã Tạo Tài Khoản Mới.  <a href='/Admin/AccountList.aspx'>Xem Danh Sách</a>");
                ClearFrom();
            }
            catch (Exception)
            {

                ucMessage.ShowError("Tên đăng nhập Này Đã Đăng Ký Trước Đó Vui Lòng Nhập Tên đăng nhập Khác. <a href='/Admin/AccountList.aspx'>Xem Danh Sách</a>");
                return;
            }

        }
    }

    public void ClearFrom()
    {
        input_UserName.Value = string.Empty;
        input_Password.Value = string.Empty;
        input_RePassword.Value = string.Empty;
        input_FullName.Value = string.Empty;
        input_Mobi.Value = string.Empty;
        input_Email.Value = string.Empty;
        textarea_Address.Value = string.Empty;
    }
}