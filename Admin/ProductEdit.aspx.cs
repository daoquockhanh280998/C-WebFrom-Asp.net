using CodeUtility;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ProductCategoryList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
            LoadCategory();
            //khóa ô id
            input_ID.Disabled = true;
        }
    }
    public void LoadCategory()
    {
        DBEntities db = new DBEntities();
        var data = from mc in db.ProductMainCategories
                   from c in mc.ProductCategories
                   orderby mc.Position, c.Position
                   select new
                   {
                       c.ProductCategoryID,
                       Title = mc.Title + " - " + c.Title
                   };
        DropDownList_Category.DataValueField = "ProductCategoryID";
        DropDownList_Category.DataTextField = "Title";

        DropDownList_Category.DataSource = data.ToList();
        DropDownList_Category.DataBind();
    }

    public void LoadData()
    {
        ucMessage.ShowInfo("Mời Nhập Thông Tin");
        // kiểm tra xem có id không có thì đổ dữ liệu vào
        int id = Request.QueryString["id"].ToInt();
        if (id <= 0)
        {
            return;
        }

        // đổ dữ liệu
        DBEntities db = new DBEntities();
        var item = db.Products.Where(x => x.ProductID == id).FirstOrDefault();

        // kiểm tra tồn tại
        if (item == null)
        {
            ucMessage.ShowError("Dữ Liệu Không Tồn Tại");
            return;
        }

        // đổ vào form chi tiết
        DropDownList_Category.SelectedValue = item.ProductCategoryID.ToString();
        input_ID.Value = item.ProductID.ToString();
        input_Code.Value = item.Code;
        input_Position.Value = item.Position.ToString();
        input_Title.Value = item.Title;
        input_OldPrice.Value = item.OldPrice.ToString();
        input_Price.Value = item.Price.ToString();
        textarea_Decription.Value = item.Dercription;
        textarea_Content.Value = item.Content;
        input_Promotions.Value = item.Promotions;

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
        a_Avatar.HRef = item.Avatar;
        img_Avatar.Src = item.Avatar;
        input_CreateBy.Value = item.CreateBy;
        input_CreateTime.Value = item.CreateTime.ToString();

    }
    public bool IsNumber(string pText)
    {
        Regex regex = new Regex(@"^[-+]?[0-9]*\.?[0-9]+$");
        return regex.IsMatch(pText);
    }

    protected void DropDownList_Category_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void LinkButton_Save_Click(object sender, EventArgs e)
    {
        // LẤY ID Đang chọn
        int id = Request.QueryString["id"].ToInt();
        DBEntities db = new DBEntities();
        //Nếu ID có thì update
        if (id > 0)
        {
            var item = db.Products
                .Where(x => x.ProductID == id).FirstOrDefault();
            if (item == null)
            {
                ucMessage.ShowError("Dữ Liệu Này Không Tồn Tại.");
                return;
            }

            //kiểm tra có nhập dữ liệu vào ô chưa
            if (input_Title.Value.Trim().IsNullOrEmpty())
            {
                ucMessage.ShowError("Mời Nhập Tiêu Đề");
                return;
            }
            if (input_Price.Value.Trim().IsNullOrEmpty())
            {
                ucMessage.ShowError("Mời Nhập Giá Bán Của Sản Phẩm");
                return;
            }
            if (IsNumber(input_Price.Value) == false || IsNumber(input_OldPrice.Value) == false)
            {
                ucMessage.ShowError("Bạn Nhập Sai Giá Sản Phẩm");
                return;
            }
            if (textarea_Decription.Value.Trim().IsNullOrEmpty())
            {
                ucMessage.ShowError("Mời Nhập Mô Tả");
                return;
            }

            // nhập các thông tin mới
            item.ProductCategoryID = DropDownList_Category.SelectedValue.ToInt();
            item.Position = input_Position.Value.ToInt();
            item.Code = input_Code.Value.Trim();
            item.Title = input_Title.Value.Trim();
            item.Price = input_Price.Value.ToInt();
            item.OldPrice = input_OldPrice.Value.ToInt();
            item.Dercription = textarea_Decription.Value.Trim();
            item.Content = textarea_Content.Value.Trim();
            item.Promotions = input_Promotions.Value.Trim();

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
                string folder = "/FileUpload/image/Product/";
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
            Response.Redirect("/Admin/ProductList.aspx?message=1");

        }

        //ngược lại thì insert
        else
        {
            Product item = new Product();

            //kiểm tra có nhập dữ liệu vào ô chưa
            if (input_Title.Value.Trim().IsNullOrEmpty())
            {
                ucMessage.ShowError("Mời Nhập Tiêu Đề");
                return;
            }
            if (input_Price.Value.Trim().IsNullOrEmpty())
            {
                ucMessage.ShowError("Mời Nhập Giá Mới Của Sản Phẩm");
                return;
            }
            if (IsNumber(input_Price.Value) == false || IsNumber(input_OldPrice.Value) == false)
            {
                ucMessage.ShowError("Bạn Nhập Sai Giá Sản Phẩm");
                return;
            }
            if (textarea_Decription.Value.Trim().IsNullOrEmpty())
            {
                ucMessage.ShowError("Mời Nhập Mô Tả");
                return;
            }

            // nhập các thông tin mới
            item.ProductCategoryID = DropDownList_Category.SelectedValue.ToInt();
            item.Position = input_Position.Value.ToInt();
            item.Code = input_Code.Value.Trim();
            item.Title = input_Title.Value.Trim();
            item.Price = input_Price.Value.ToInt();
            item.OldPrice = input_OldPrice.Value.ToInt();
            item.Dercription = textarea_Decription.Value.Trim();
            item.Content = textarea_Content.Value.Trim();
            item.Promotions = input_Promotions.Value.Trim();

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
                string folder = "/FileUpload/image/Product/";
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
            item.Status = radio_Active.Checked ? true : false;
            item.CreateBy = SessionUtility.AdminUsername;
            item.CreateTime = DateTime.Now;

            //add vào db
            db.Products.Add(item);

            //lưu db
            db.SaveChanges();
            Response.Redirect("/Admin/ProductList.aspx?message=2");
        }
    }


}