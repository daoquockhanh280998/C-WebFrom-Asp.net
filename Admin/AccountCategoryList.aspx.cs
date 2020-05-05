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
            CheckAccount();
        }
    }

    public void CheckAccount()
    {
        string accountCatrgoryID = "SupperAdmin";
        if (accountCatrgoryID != SessionUtility.AdminCategoryID)
        {
            Response.Redirect("/Admin/Default.aspx?message=1");
            return;
        }
        else
        {
            ucMessage.ShowInfo("Mời Nhập Thông Tin");
            LoadData();
        }
    }
    public void LoadData()
    {
        DBEntities db = new DBEntities();
        var data = db.AccountCategories.OrderBy(x => x.Position).Select(x => new
        {
            x.AccountCategoryID,
            Title = x.AccountCategoryID + "-" + x.Title
        });

        DropDownList_Main.DataValueField = "AccountCategoryID";
        DropDownList_Main.DataTextField = "Title";

        DropDownList_Main.DataSource = data.ToList();
        DropDownList_Main.DataBind();
        //thêm 1 item mặc đinh ở trên đầu dropdown
        ListItem defaultItem = new ListItem("-----Mời chọn thể loại------", string.Empty);
        DropDownList_Main.Items.Insert(0, defaultItem);
    }

    public void LoadDetail()
    {
        ucMessage.ShowInfo("Mời Nhập Thông Tin");
        // lấy id đang chọn
        string id = DropDownList_Main.SelectedValue;
        //vào db lấy 1 item
        DBEntities db = new DBEntities();
        var item = db.AccountCategories.Where(x => x.AccountCategoryID == id).FirstOrDefault();

        // kiểm tra tồn tại
        if (item == null)
        {
            ucMessage.ShowError("Dữ Liệu Không Tồn Tại");
            LoadData();
            return;
        }

        //Khóa ô id k cho nhập
        input_ID.Disabled = true;

        // đổ vào form chi tiết
        input_ID.Value = item.AccountCategoryID;
        input_Position.Value = item.Position.ToString();
        input_Title.Value = item.Title;
        textarea_Decription.Value = item.Description;

        a_Avatar.HRef = item.Avatar;
        img_Avatar.Src = item.Avatar;

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
    }

    protected void DropDownList_Main_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadDetail();

    }

    protected void LinkButton_Add_Click(object sender, EventArgs e)
    {
        //Mở khóa ô id
        input_ID.Disabled = false;
        //xóa from
        ClearFrom();
    }

    protected void LinkButton_Delete_Click(object sender, EventArgs e)
    {
        //lấy id cần xóa
        string id = DropDownList_Main.SelectedValue;

        //Nếu K chọn hoặc chưa chọn nhắc chọn 1 item để xóa
        if (id == string.Empty)
        {
            ucMessage.ShowError("Mời Chọn 1 thể loại để xóa");
            return;
        }

        // tìm item cần xóa
        DBEntities db = new DBEntities();
        var item = db.AccountCategories.Where(x => x.AccountCategoryID == id).FirstOrDefault();

        //nếu k có thì báo lỗi
        if (item == null)
        {
            ucMessage.ShowError("Dữ Liệu này không còn tồn tại");
            LoadData();
            return;
        }

        //thử xóa trong bảng
        db.AccountCategories.Remove(item);
        try
        {
            db.SaveChanges();
        }
        catch (Exception)
        {
            //throw; throw là cái quăng lỗi vàng ra ngoài
            ucMessage.ShowError("không thể xóa tài khoản này do có dữ liệu ràng buộc");
            return;
        }

        LoadData();

        ClearFrom();
        // thông báo
        ucMessage.ShowSuccess("Đã Xóa thành công");
    }

    protected void LinkButton_Save_Click(object sender, EventArgs e)
    {
        // LẤY ID Đang chọn
        string id = DropDownList_Main.SelectedValue;
        DBEntities db = new DBEntities();
        //Nếu ID có thì update
        if (id != string.Empty)
        {
            var item = db.AccountCategories.Where(x => x.AccountCategoryID == id).FirstOrDefault();
            if (item == null)
            {
                ucMessage.ShowError("Dữ Liệu Này Không Tồn Tại.");
                return;
            }

            //kiểm tra nhập dữ liệu vào ô chưa
            if (input_Title.Value.Trim().IsNullOrEmpty())
            {
                ucMessage.ShowError("Mời Nhập Họ Tên");
                return;
            }
            if (input_Position.Value.Trim().IsNullOrEmpty())
            {
                ucMessage.ShowError("Mời Nhập Vị Trí");
                return;
            }
            if (textarea_Decription.Value.Trim().IsNullOrEmpty())
            {
                ucMessage.ShowError("Mời Nhập Mô Tả");
                return;
            }

            // nhập các thông tin mới
            item.Position = input_Position.Value.ToInt();
            item.Title = input_Title.Value.Trim();
            item.Description = textarea_Decription.Value.Trim();

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
                string folder = "/FileUpload/image/accountcategory/";
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
            item.Status = radio_Active.Checked ? true : false;

            //lưu db
            db.SaveChanges();
            LoadData();
            // thông báo
            ucMessage.ShowSuccess("Đã Update Dữ Liệu.");

        }

        //ngược lại thì insert
        else
        {
            AccountCategory item = new AccountCategory();
            ////kiểm tra id không rỗng
            string newID = input_ID.Value.Trim();

            if (newID.Trim().IsNullOrEmpty())
            {
                ucMessage.ShowError("Mời Nhập Mã Loại Tài Khoản");
                input_ID.Focus();
                return;
            }
            //// id k trùng
            var validateItem = db.AccountCategories.Where(x => x.AccountCategoryID == newID).FirstOrDefault();

            if (validateItem != null)
            {
                ucMessage.ShowError("Mã Loại Này đã có sẵn");
                input_ID.Focus();
                return;
            }

            //kiểm tra nhập dữ liệu vào ô chưa
            if (input_ID.Value.Trim().IsNullOrEmpty())
            {
                ucMessage.ShowError("Mời Nhập Mã loại tài khoản");
                return;
            }
            if (input_Position.Value.Trim().IsNullOrEmpty())
            {
                ucMessage.ShowError("Mời Nhập Vị trí");
                return;
            }
            if (input_Title.Value.Trim().IsNullOrEmpty())
            {
                ucMessage.ShowError("Mời Nhập Tiêu đề");
                return;
            }
            if (textarea_Decription.Value.Trim().IsNullOrEmpty())
            {
                ucMessage.ShowError("Mời Nhập Mô tả");
                return;
            }

            // nhập các thông tin mới
            item.AccountCategoryID = input_ID.Value.Trim();
            item.Position = input_Position.Value.ToInt();
            item.Title = input_Title.Value.Trim();
            item.Description = textarea_Decription.Value.Trim();

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
                string folder = "/FileUpload/image/accountcategory/";
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
            else
            {
                item.Avatar = "/Admin/images/no_image.png";
                item.Thumb = "/Admin/images/no_image.png";
            }

            item.Status = radio_Active.Checked ? true : false;

            //add item
            db.AccountCategories.Add(item);

            //lưu db
            db.SaveChanges();

            LoadData();

            ClearFrom();

            // thông báo
            ucMessage.ShowSuccess("Đã Lưu Dữ Liệu");
        }
    }

    public void ClearFrom()
    {
        ucMessage.ShowInfo("Mời Nhập Thông Tin");
        DropDownList_Main.SelectedValue = string.Empty;

        input_ID.Value = string.Empty;
        input_Position.Value = string.Empty;
        input_Title.Value = string.Empty;
        textarea_Decription.Value = string.Empty;

        a_Avatar.HRef = "/Admin/images/no_image.png";
        img_Avatar.Src = "/Admin/images/no_image.png";

        radio_Lock.Checked = false;
        radio_Active.Checked = true;
    }
}