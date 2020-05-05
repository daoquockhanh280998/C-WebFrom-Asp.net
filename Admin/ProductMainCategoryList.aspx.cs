using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class Admin_ProductCategoryList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ucMessage.ShowInfo("Mời Nhập Thông Tin");
            LoadData();
            //khóa ô id
            input_ID.Disabled = true;
        }
    }

    public void LoadData()
    {
        DBEntities db = new DBEntities();
        var data = db.ProductMainCategories
                    .OrderBy(x => x.Position)
                    .Select(x => new
                    {
                        x.ProductMainCategoryID,
                        x.Title
                    });
        DropDownList_Main.DataValueField = "ProductMainCategoryID";
        DropDownList_Main.DataTextField = "Title";

        DropDownList_Main.DataSource = data.ToList();
        DropDownList_Main.DataBind();

        //thêm 1 item mặc định
        ListItem defaultItem = new ListItem("-------Mời Chọn Thể Loại-------", string.Empty);
        DropDownList_Main.Items.Insert(0, defaultItem);

    }

    public void LoadDetail()
    {
        ucMessage.ShowInfo("Mời Nhập Thông Tin");
        //lấy id đang chọn bên dropdown
        int id = DropDownList_Main.SelectedValue.ToInt();
        if (id == 0)
        {
            ClearFrom();
            return;
        }

        // vào db lấy 1 item
        DBEntities db = new DBEntities();
        var item = db.ProductMainCategories.Where(x => x.ProductMainCategoryID == id).FirstOrDefault();

        //kiểm tra tồn tại hay k
        if (item == null)
        {
            ucMessage.ShowError("Dữ Liệu Không Tồn Tại");
            LoadData();
            return;
        }


        //đổ dữ liệu vào ô
        input_ID.Value = item.ProductMainCategoryID.ToString();
        input_Position.Value = item.Position.ToString();
        input_Code.Value = item.Code;
        input_Title.Value = item.Title;
        textarea_Decription.Value = item.Dercription;
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
        ClearFrom();
    }

    protected void LinkButton_Delete_Click(object sender, EventArgs e)
    {
        // lấy id
        int id = DropDownList_Main.SelectedValue.ToInt();
        // kiểm tra id
        if (id <= 0)
        {
            ucMessage.ShowError("Vùi Lòng Chọn Thể Loại Để Xóa");
            return;
        }

        //tìm item cần xóa
        DBEntities db = new DBEntities();
        var item = db.ProductMainCategories.Where(x => x.ProductMainCategoryID == id).FirstOrDefault();

        // kiểm tra item
        if (item == null)
        {
            ucMessage.ShowError("Dữ Liệu Này Không Còn Tồn Tại");
            LoadData();
            return;
        }

        //thử xóa bảng
        db.ProductMainCategories.Remove(item);
        try
        {
            db.SaveChanges();
        }
        catch (Exception)
        {

            ucMessage.ShowError("Không Thể Xóa Do Ràng Buộc Dữ Liệu");
            return;
        }
        LoadData();
        ClearFrom();
        //thông báo
        ucMessage.ShowSuccess("Đã Xóa Dữ Liệu Thành Công");
    }

    protected void LinkButton_Save_Click(object sender, EventArgs e)
    {
        //lấy id
        int id = DropDownList_Main.SelectedValue.ToInt();
        DBEntities db = new DBEntities();
        // nếu id > 0 thì update
        if (id > 0)
        {
            // lấy 1 item để update
            var item = db.ProductMainCategories.Where(x => x.ProductMainCategoryID == id)
                                                .FirstOrDefault();
            //kiểm tra item  có tồn tại hay không
            if (item == null)
            {
                ucMessage.ShowError("Dữ Liệu Không Tồn Tại");
                return;
            }

            // kiểm tra xem dữ liệu đã nhập vào ô hay chưa
            if (input_Position.Value.Trim() == string.Empty)
            {
                ucMessage.ShowError("Mời Nhập Vị Trí");
                return;
            }
            if (input_Title.Value.Trim() == string.Empty)
            {
                ucMessage.ShowError("Mời Nhập Tiêu Đề");
                return;
            }
            if (textarea_Decription.Value.Trim() == string.Empty)
            {
                ucMessage.ShowError("Mời Nhập Mô Tả");
                return;
            }

            // kiểm tra title hợp lệ : không trùng
            string title = input_Title.Value.Trim();

            var valideTitle = db.ProductMainCategories
                                .Where(x => x.Title == title && x.ProductMainCategoryID != id)
                                .FirstOrDefault();
            //kiểm tra
            if (valideTitle != null)
            {
                ucMessage.ShowError("Vui Lòng Nhập Tiêu Đề Không Trùng");
                input_Title.Focus();
                return;
            }

            //nhập thông tin mới
            item.Position = input_Position.Value.ToInt();
            item.Code = input_Code.Value.Trim();
            item.Title = input_Title.Value.Trim();
            item.Dercription = textarea_Decription.Value.Trim();

            //up load hinh ảnh
            //// 1/kiểm tra xem có chọn hình chưa
            if (FileUpload_Avatar.HasFile)
            {
                // 2/kiểm tra đuôi hình có hợp lệ không đuôi hợp lệ gồm :.jpg.png.gif.jpeg
                string filename = FileUpload_Avatar.FileName;
                string extension = Path.GetExtension(filename).ToLower();
                string valideFile = ".jpg.png.gif.jpeg";
                if (!valideFile.Contains(extension))
                {
                    ucMessage.ShowError("Vui Lòng chọn ảnh có đuôi: .jpg.png.gif.jpeg");
                    return;
                }

                // 3/Chọn Thư Mục lưu Trữ
                string folder = "/FileUpload/image/ProductMainCategory/";

                // 4/tạo tên ngẫu nhiên cho file hình
                string randomName = Guid.NewGuid().ToString();

                // 5/tạo url lưu trữ  = folder + tên ngẫu nhiên + đuôi upload
                string saveUrl = folder + randomName + extension;
                // 6/upload vào saveUrl
                FileUpload_Avatar.SaveAs(Server.MapPath(saveUrl));// server.MapPath là hàm chuyển về dg dẫn nội bộ của server
                // 7/save vào db
                item.Avatar = saveUrl;
                item.Thumb = saveUrl;
            }

            item.Status = radio_Active.Checked ? true : false;
            item.CreateBy = SessionUtility.AdminUsername;

            //lưu vào db
            db.SaveChanges();
            LoadData();
            //thông báo
            ucMessage.ShowSuccess("Đã Update Dữ Liệu");

        }
        // ngược lại insert
        else
        {
            ProductMainCategory item = new ProductMainCategory();

            //kiểm tra xem nhập dữ liệu vào chưa
            if (input_Position.Value.Trim() == string.Empty)
            {
                ucMessage.ShowError("Mời Nhập Vị Trí");
                return;
            }
            if (input_Title.Value.Trim() == string.Empty)
            {
                ucMessage.ShowError("Mời Nhập Tiêu Đề");
                return;
            }
            if (textarea_Decription.Value.Trim() == string.Empty)
            {
                ucMessage.ShowError("Mời Nhập Mô Tả");
                return;
            }

            // kiểm tra tiêu đề hợp lệ : không trùng
            string title = input_Title.Value.Trim();
            var valideTitle = db.ProductMainCategories.Where(x => x.Title == title).FirstOrDefault();
            if (valideTitle != null)
            {
                ucMessage.ShowError("Vui Lòng Không Nhập Tiêu Đề Đã Có");
                input_Title.Focus();
                return;
            }

            //nhập thông tin mới
            item.Position = input_Position.Value.ToInt();
            item.Code = input_Code.Value.Trim();
            item.Title = input_Title.Value.Trim();
            item.Dercription = textarea_Decription.Value.Trim();

            //up load hinh ảnh
            //// 1/kiểm tra xem có chọn hình chưa
            if (FileUpload_Avatar.HasFile)
            {
                // 2/kiểm tra đuôi hình có hợp lệ không đuôi hợp lệ gồm :.jpg.png.gif.jpeg
                string filename = FileUpload_Avatar.FileName;
                string extension = Path.GetExtension(filename).ToLower();
                string valideFile = ".jpg.png.gif.jpeg";
                if (!valideFile.Contains(extension))
                {
                    ucMessage.ShowError("Vui Lòng chọn ảnh có đuôi: .jpg.png.gif.jpeg");
                    return;
                }

                // 3/Chọn Thư Mục lưu Trữ
                string folder = "/FileUpload/image/ProductMainCategory/";

                // 4/tạo tên ngẫu nhiên cho file hình
                string randomName = Guid.NewGuid().ToString();

                // 5/tạo url lưu trữ  = folder + tên ngẫu nhiên + đuôi upload
                string saveUrl = folder + randomName + extension;
                // 6/upload vào saveUrl
                FileUpload_Avatar.SaveAs(Server.MapPath(saveUrl));// server.MapPath là hàm chuyển về dg dẫn nội bộ của server
                // 7/save vào db
                item.Avatar = saveUrl;
                item.Thumb = saveUrl;
            }

            item.Status = radio_Active.Checked ? true : false;
            item.CreateBy = SessionUtility.AdminUsername;

            //add vào db
            db.ProductMainCategories.Add(item);

            //lưu vào db
            db.SaveChanges();

            LoadData();
            ClearFrom();
            //thông báo
            ucMessage.ShowSuccess("Đã Lưu Dữ Liệu");
        }
    }

    public void ClearFrom()
    {
        ucMessage.ShowInfo("Mời Nhập Thông Tin");
        DropDownList_Main.SelectedValue = string.Empty;

        input_ID.Value = string.Empty;
        input_Code.Value = string.Empty;
        input_Position.Value = string.Empty;
        input_Title.Value = string.Empty;
        textarea_Decription.Value = string.Empty;

        a_Avatar.HRef = "/Admin/images/no_image.png";
        img_Avatar.Src = "/Admin/images/no_image.png";

        radio_Lock.Checked = false;
        radio_Active.Checked = true;
    }
}