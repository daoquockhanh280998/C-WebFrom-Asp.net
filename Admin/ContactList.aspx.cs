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
            LoadData();
        }
    }
    public void LoadData()
    {
        DBEntities db = new DBEntities();
        var query = from c in db.Contacts
                   orderby c.CreateTime descending
                   select new
                   {
                       c.ContactID,
                       c.Email,
                       c.FullName,
                       c.Mobi,
                       c.Content,
                       c.topic,
                       c.CreateTime
                   };
        ////nếu có nhập keyword, thì thêm đk
        //if (keyword != string.Empty)
        //{
        //    input_Keyword.Value = keyword;
        //    query = query.Where(x => x.Title.Contains(keyword));
        //}

        //Đổ vào Repeater
        int pageSize = 6; //10 là số phần tử trên mỗi trang
        int maxPage = 5; //5 là số trang tối đã sẽ hiển thị, còn lại là ...
        int page = Request.QueryString["page"].ToInt(); // Trang hiện tại
        if (page <= 0)
            page = 1;
        int totalItems = query.Count();
        // .: Lưu ý sửa lại link cho đúng với trang và điều kiện thực tế của mỗi trang :. \\
        string url = "~/Admin/ContactList.aspx?page={0}".StringFormat("{0}");
        ucPagging.TotalItems = totalItems;
        ucPagging.CurrentPage = page;
        ucPagging.PageSize = pageSize;
        ucPagging.MaxPage = maxPage;
        ucPagging.URL = url;
        ucPagging.DataBind();
        Repeater_Main.DataSource = query.Pagging(page, pageSize).ToList();
        Repeater_Main.DataBind();
    }

    protected void LinkButton_Delete_Click(object sender, EventArgs e)
    {
        //lấy ID cần xóa
        LinkButton LinkButton_Delete = sender as LinkButton;
        int ID = LinkButton_Delete.CommandArgument.ToInt();

        // tìm item cần xóa
        DBEntities db = new DBEntities();
        var item = db.Contacts.Where(x => x.ContactID == ID).FirstOrDefault();

        //nếu k có thì báo lỗi
        if (item == null)
        {
            ucMessage.ShowError("Dữ Liệu này không còn tồn tại");
            LoadData();
            return;
        }

        //thử xóa trong bảng
        db.Contacts.Remove(item);
        try
        {
            db.SaveChanges();
        }
        catch (Exception)
        {
            //throw; throw là cái quăng lỗi vàng ra ngoài
            ucMessage.ShowError("không thể xóa Thư Liên Hệ này do có Thư Liên Hệ ràng buộc");
            return;
        }

        LoadData();
        ucMessage.ShowSuccess("Đã Xóa Thư Liên Hệ thành công");
    }
}