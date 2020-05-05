using CodeUtility;
using System;
using System.Collections.Generic;
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
            ucMessage.HideAll();
            LoadCategory();
            LoadData();
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
        //thêm 1 item mặc đinh ở trên đầu dropdown
        ListItem defaultItem = new ListItem("-------------:Mời chọn thể loại:-------------", string.Empty);
        DropDownList_Category.Items.Insert(0, defaultItem);
    }
    public void LoadData()
    {
        //thông báo
        int messageCode = Request.QueryString["message"].ToInt();
        if (messageCode == 1)
        {
            ucMessage.ShowSuccess("Đã Update dữ liệu");
        }
        else if (messageCode == 2)
        {
            ucMessage.ShowSuccess("Đã Thêm dữ liệu mới");
        };
        DBEntities db = new DBEntities();
        var query = from mc in db.PictureMainCategories
                    from c in mc.PictureCategories
                    from a in c.Pictures
                    orderby a.CreateTime descending
                    select new
                    {
                        a.PictureID,
                        a.Avatar,
                        a.Title,
                        a.Description,
                        a.ViewTime,
                        a.Status,
                        a.CreateTime,
                        a.CreateBy,

                        CatTitle = c.Title,
                        MainCatTitle = mc.Title,
                        CatID = c.PictureCategoryID
                    };

        int catID = Request.QueryString["catid"].ToInt();
        string keyword = Request.QueryString["keyword"].ToSafetyString();

        //Nếu có chọn tìm theo thể loại, thì thêm đk
        if (catID > 0)
        {
            DropDownList_Category.SelectedValue = catID.ToString();
            query = query.Where(x => x.CatID == catID);
        }

        //nếu có nhập keyword, thì thêm đk
        if (keyword != string.Empty)
        {
            input_Keyword.Value = keyword;
            query = query.Where(x => x.Title.Contains(keyword));
        }

        //Đổ vào Repeater
        int pageSize = 6; //10 là số phần tử trên mỗi trang
        int maxPage = 5; //5 là số trang tối đã sẽ hiển thị, còn lại là ...
        int page = Request.QueryString["page"].ToInt(); // Trang hiện tại
        if (page <= 0)
            page = 1;
        int totalItems = query.Count();
        // .: Lưu ý sửa lại link cho đúng với trang và điều kiện thực tế của mỗi trang :. \\
        string url = "~/Admin/PictureList.aspx?catid={0}&keyword={1}&page={2}".StringFormat(catID, keyword, "{0}");
        ucPagging.TotalItems = totalItems;
        ucPagging.CurrentPage = page;
        ucPagging.PageSize = pageSize;
        ucPagging.MaxPage = maxPage;
        ucPagging.URL = url;
        ucPagging.DataBind();
        Repeater_Main.DataSource = query.Pagging(page, pageSize).ToList();
        Repeater_Main.DataBind();
    }

    public void SearchData()
    {
        string url = "/Admin/PictureList.aspx?";
        int catID = DropDownList_Category.SelectedValue.ToInt();
        string keyword = input_Keyword.Value.Trim();
        int page = Request.QueryString["page"].ToInt();

        if (catID > 0)
        {
            url += "catid=" + catID;
        }
        if (keyword != string.Empty)
        {
            url += "&keyword=" + keyword;
        }
        if (page > 0)
        {
            url += "&page=" + page;
        }

        url = url.Replace("?&", "?").Trim('?');

        Response.Redirect(url);
    }

    protected void DropDownList_Category_SelectedIndexChanged(object sender, EventArgs e)
    {
        SearchData();
    }

    protected void LinkButton_Search_Click(object sender, EventArgs e)
    {
        SearchData();
    }

    protected void LinkButton_ClearSearch_Click(object sender, EventArgs e)
    {
        DropDownList_Category.SelectedValue = string.Empty;
        input_Keyword.Value = string.Empty;
        SearchData();
    }

    protected void LinkButton_Delete_Click(object sender, EventArgs e)
    {
        //lấy ID cần xóa
        LinkButton LinkButton_Delete = sender as LinkButton;
        int ID = LinkButton_Delete.CommandArgument.ToInt();

        // tìm item cần xóa
        DBEntities db = new DBEntities();
        var item = db.Pictures.Where(x => x.PictureID == ID).FirstOrDefault();

        //nếu k có thì báo lỗi
        if (item == null)
        {
            ucMessage.ShowError("Dữ Liệu này không còn tồn tại");
            LoadData();
            return;
        }

        //thử xóa trong bảng
        db.Pictures.Remove(item);
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
        ucMessage.ShowSuccess("Đã Xóa dữ liệu thành công");
    }

    protected void LinkButton_Status_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton_Status = sender as LinkButton;
        int ID = LinkButton_Status.CommandArgument.ToInt();

        // Vào DB tìm account phù hợp
        DBEntities db = new DBEntities();
        var item = db.Pictures.Where(x => x.PictureID == ID).FirstOrDefault();
        // nếu k tồn tại thì load lại
        if (item == null)
        {
            LoadData();
            return;
        }
        //update status
        item.Status = !item.Status;
        db.SaveChanges();
        // load lại dữ liệu
        LoadData();

        // thông báo
        ucMessage.ShowSuccess("Đã Update Trạng Thái");
    }
}