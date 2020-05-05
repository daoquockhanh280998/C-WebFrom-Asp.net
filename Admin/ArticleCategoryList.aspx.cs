using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;
using System.IO;

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
        var data = db.ArticleMainCategories.OrderBy(x => x.Position).Select(x => new
        {
            x.ArticleMainCategoryID,
            x.Title
        });

        DropDownList_Cat.DataValueField = "ArticleMainCategoryID";
        DropDownList_Cat.DataTextField = "Title";

        DropDownList_Cat.DataSource = data.ToList();
        DropDownList_Cat.DataBind();

        DropDownList_CatDetail.DataValueField = "ArticleMainCategoryID";
        DropDownList_CatDetail.DataTextField = "Title";

        DropDownList_CatDetail.DataSource = data.ToList();
        DropDownList_CatDetail.DataBind();

    }
    public void LoadData()
    {
        //Lấy CatID đang chọn
        int catID = DropDownList_Cat.SelectedValue.ToInt();

        DBEntities db = new DBEntities();
        var data = db.ArticleCategories
                        .Where(x => x.ArticleMainCategoryID == catID)
                        .OrderBy(x => x.Position)
                        .Select(x => new
                        {
                            x.ArticleCategoryID,
                            x.Title
                        });

        DropDownList_Main.DataValueField = "ArticleCategoryID";
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
        int id = DropDownList_Main.SelectedValue.ToInt();

        if (id <= 0)
        {
            ClearFrom();
            return;
        }

        //vào db lấy 1 item
        DBEntities db = new DBEntities();
        var item = db.ArticleCategories.Where(x => x.ArticleCategoryID == id).FirstOrDefault();

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
        DropDownList_CatDetail.SelectedValue = item.ArticleMainCategoryID.ToString();
        input_ID.Value = item.ArticleCategoryID.ToString();
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
    protected void DropDownList_Cat_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadData();

        //đồng bộ catID của 2 Dropdown
        DropDownList_CatDetail.SelectedValue = DropDownList_Cat.SelectedValue;
    }
    protected void DropDownList_CatDetail_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void LinkButton_Add_Click(object sender, EventArgs e)
    {
        //xóa from
        ClearFrom();
    }

    protected void LinkButton_Delete_Click(object sender, EventArgs e)
    {
        //lấy id cần xóa
        int id = DropDownList_Main.SelectedValue.ToInt();

        //Nếu K chọn hoặc chưa chọn nhắc chọn 1 item để xóa
        if (id <= 0)
        {
            ucMessage.ShowError("Mời Chọn 1 thể loại để xóa");
            return;
        }

        // tìm item cần xóa
        DBEntities db = new DBEntities();
        var item = db.ArticleCategories.Where(x => x.ArticleCategoryID == id).FirstOrDefault();

        //nếu k có thì báo lỗi
        if (item == null)
        {
            ucMessage.ShowError("Dữ Liệu này không còn tồn tại");
            LoadData();
            return;
        }

        // kiểm tra ràng buộc dữ liệu
        var validateItem = db.Articles.Where(x => x.ArticleCategoryID == id).Count();
        if (validateItem > 0)
        {
            ucMessage.ShowError("Để Xóa Dữ Liệu Này Cần Xóa Những Bài Báo Liên Quan Trước");
            return;
        }

        //thử xóa trong bảng
        db.ArticleCategories.Remove(item);
        try
        {
            db.SaveChanges();
        }
        catch (Exception)
        {
            //throw; throw là cái quăng lỗi vàng ra ngoài
            ucMessage.ShowError("không thể xóa do có dữ liệu ràng buộc");
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
        int id = DropDownList_Main.SelectedValue.ToInt();
        DBEntities db = new DBEntities();
        //Nếu ID có thì update
        if (id > 0)
        {
            var item = db.ArticleCategories
                .Where(x => x.ArticleCategoryID == id).FirstOrDefault();
            if (item == null)
            {
                ucMessage.ShowError("Dữ Liệu Này Không Tồn Tại.");
                return;
            }

            //kiểm tra có nhập dữ liệu vào ô chưa
            if (input_Position.Value.Trim().IsNullOrEmpty())
            {
                ucMessage.ShowError("Mời Nhập Vị Trí");
                return;
            }
            if (input_Title.Value.Trim().IsNullOrEmpty())
            {
                ucMessage.ShowError("Mời Nhập Tiêu Đề");
                return;
            }
            if (textarea_Decription.Value.Trim().IsNullOrEmpty())
            {
                ucMessage.ShowError("Mời Nhập Mô Tả");
                return;
            }

            // kiểm tra hợp lệ : tiêu đề không trùng
            string title = input_Title.Value.Trim();

            var valideItem = db.ArticleCategories
                .Where(x => x.Title == title && x.ArticleCategoryID != id)
                .FirstOrDefault();
            if (valideItem != null)
            {
                ucMessage.ShowError("Vùi Lòng Nhập Tiêu Đề Không Trùng");
                input_Title.Focus();
                return;
            }

            // nhập các thông tin mới
            item.ArticleMainCategoryID = DropDownList_CatDetail.SelectedValue.ToInt();
            item.Position = input_Position.Value.ToInt();
            item.Code = input_Code.Value.Trim();
            item.Title = input_Title.Value.Trim();
            item.Dercription = textarea_Decription.Value.Trim();

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
                string folder = "/FileUpload/image/ArticleCategory/";
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
            item.CreateBy = SessionUtility.AdminUsername;

            //lưu db
            db.SaveChanges();

            LoadData();
            // thông báo
            ucMessage.ShowSuccess("Đã Update Dữ Liệu.");

        }

        //ngược lại thì insert
        else
        {
            ArticleCategory item = new ArticleCategory();

            // kiểm tra hợp lệ : tiêu đề không trùng
            string title = input_Title.Value.Trim();

            var valideItem = db.ArticleCategories.Where(x => x.Title == title).FirstOrDefault();
            if (valideItem != null)
            {
                ucMessage.ShowError("Vùi Lòng Nhập Tiêu Đề Không Trùng");
                input_Title.Focus();
                return;
            }
            //kiểm tra nhập dữ liệu vào ô chưa và kiểm tra tiêu đề k rỗng
            if (input_Title.Value.Trim().IsNullOrEmpty())
            {
                ucMessage.ShowError("Mời Nhập Tiêu Đề");
                return;
            }
            if (input_Position.Value.Trim().IsNullOrEmpty())
            {
                ucMessage.ShowError("Mời Nhập Vị trí");
                return;
            }
            if (textarea_Decription.Value.Trim().IsNullOrEmpty())
            {
                ucMessage.ShowError("Mời Nhập Mô tả");
                return;
            }

            // nhập các thông tin mới
            item.ArticleMainCategoryID = DropDownList_CatDetail.SelectedValue.ToInt();
            item.Code = input_Code.Value.Trim();
            item.Position = input_Position.Value.ToInt();
            item.Title = input_Title.Value.Trim();
            item.Dercription = textarea_Decription.Value.Trim();

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
                string folder = "/FileUpload/image/ArticleCategory/";
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
            item.CreateBy = SessionUtility.AdminUsername;

            //add item
            db.ArticleCategories.Add(item);

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
        input_Code.Value = string.Empty;
        input_Title.Value = string.Empty;
        textarea_Decription.Value = string.Empty;

        a_Avatar.HRef = "/Admin/images/no_image.png";
        img_Avatar.Src = "/Admin/images/no_image.png";

        radio_Lock.Checked = false;
        radio_Active.Checked = true;
    }

}