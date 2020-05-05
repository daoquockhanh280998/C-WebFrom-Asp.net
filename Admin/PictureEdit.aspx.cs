using CodeUtility;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ucMessage.ShowInfo("Mời Nhập Thông Tin");
            LoadCategory();
            LoadDetail();
            //Khóa ô id k cho nhập
            input_ID.Disabled = true;
        }
    }

    public void LoadCategory()
    {
        DBEntities db = new DBEntities();
        var data = from mc in db.PictureMainCategories
                   from c in mc.PictureCategories
                   orderby mc.Position, c.Position
                   select new
                   {
                       c.PictureCategoryID,
                       Title = mc.Title + " - " + c.Title
                   };
        DropDownList_Category.DataValueField = "PictureCategoryID";
        DropDownList_Category.DataTextField = "Title";

        DropDownList_Category.DataSource = data.ToList();
        DropDownList_Category.DataBind();
    }

    public void LoadDetail()
    {
        ucMessage.ShowInfo("Mời Nhập Thông Tin");

        int id = Request.QueryString["id"].ToInt();

        if (id <= 0)
        {
            return;
        }

        //vào db lấy 1 item
        DBEntities db = new DBEntities();
        var item = db.Pictures.Where(x => x.PictureID == id).FirstOrDefault();

        // kiểm tra tồn tại
        if (item == null)
        {
            ucMessage.ShowError("Dữ Liệu Không Tồn Tại");
            return;
        }

        // đổ vào form chi tiết
        DropDownList_Category.SelectedValue = item.PictureCategoryID.ToString();
        input_ID.Value = item.PictureID.ToString();
        input_Position.Value = item.Position.ToString();
        input_Code.Value = item.Code;
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
        input_CreateBy.Value = item.CreateBy;
        input_CreateTime.Value = item.CreateTime.ToString();
        input_ViewTime.Value = item.ViewTime.ToString();

    }

    protected void LinkButton_Save_Click(object sender, EventArgs e)
    {
        // LẤY ID Đang chọn
        int id = Request.QueryString["id"].ToInt();
        DBEntities db = new DBEntities();
        //Nếu ID có thì update
        if (id > 0)
        {
            var item = db.Pictures
                .Where(x => x.PictureID == id).FirstOrDefault();
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

            // nhập các thông tin mới
            item.PictureCategoryID = DropDownList_Category.SelectedValue.ToInt();
            item.Position = input_Position.Value.ToInt();
            item.Code = input_Code.Value.Trim();
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
                string folder = "/FileUpload/image/Picture/";
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
            Response.Redirect("/Admin/PictureList.aspx?message=1");

        }

        //ngược lại thì insert
        else
        {
            Picture item = new Picture();

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
            item.PictureCategoryID = DropDownList_Category.SelectedValue.ToInt();
            item.Code = input_Code.Value.Trim();
            item.Position = input_Position.Value.ToInt();
            item.Title = input_Title.Value.Trim();
            item.Description = textarea_Decription.Value.Trim();
            item.CreateBy = SessionUtility.AdminUsername;
            item.CreateTime = DateTime.Now;
            //item.ViewTime = input_ViewTime.Value.Trim();

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
                string folder = "/FileUpload/image/Picture/";
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
            item.CreateTime = DateTime.Now;

            //add item
            db.Pictures.Add(item);

            //lưu db
            db.SaveChanges();

            Response.Redirect("/Admin/PictureList.aspx?message=2");
        }
    }


    protected void DropDownList_Category_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}