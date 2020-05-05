using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class ProductSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
    }
    public void LoadData()
    {
        DBEntities db = new DBEntities();
        var query = from p in db.Products
                    where p.Status == true
                    orderby p.Price descending
                    select new
                    {
                        p.ProductID,
                        p.Title,
                        p.Avatar,
                        p.Price,
                        p.OldPrice,
                    };
        string keyword = Request.QueryString["keyword"].ToUrlDecode(); // ToUrlDecode là lệnh giải mã keyword trong codeutility
        if (keyword != string.Empty)
            query = query.Where(x => x.Title.Contains(keyword));


        //Đổ vào Repeater
        int pageSize = 16; //10 là số phần tử trên mỗi trang
        int maxPage = 5; //5 là số trang tối đã sẽ hiển thị, còn lại là ...
        int page = Request.QueryString["page"].ToInt(); // Trang hiện tại
        if (page <= 0)
            page = 1;
        int totalItems = query.Count();
        // .: Lưu ý sửa lại link cho đúng với trang và điều kiện thực tế của mỗi trang :. \\
        string url = "~/ProductSearch.aspx?keyword={0}&page={1}".StringFormat(keyword.ToUrlEncode(), "{0}");
        ucPagging.TotalItems = totalItems;
        ucPagging.CurrentPage = page;
        ucPagging.PageSize = pageSize;
        ucPagging.MaxPage = maxPage;
        ucPagging.URL = url;
        ucPagging.DataBind();
        Repeater_Main.DataSource = query.Pagging(page, pageSize).ToList();
        Repeater_Main.DataBind();

        // hiện thông báo
        if (totalItems == 0)
            ucMessage.ShowError("Không có kết quả phù hợp với từ khóa:  {0} ".StringFormat(keyword));
        else
        {
            ucMessage.ShowSuccess("Có {0} Kết Quả Phù hợp với từ khóa : {1}".StringFormat(totalItems,keyword));
        }
    }
}