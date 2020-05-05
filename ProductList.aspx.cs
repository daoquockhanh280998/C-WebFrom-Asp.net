using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class ProductList : System.Web.UI.Page
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
        int mid = Request.QueryString["mid"].ToInt();
        int cid = Request.QueryString["cid"].ToInt();
        int PhuKien = 9;
        DBEntities db = new DBEntities();
        var query = from c in db.ProductCategories
                    from p in c.Products
                    where p.Status == true
                    orderby p.ProductID descending
                    select new
                    {
                        p.ProductID,
                        p.Title,
                        p.Avatar,
                        p.Price,
                        c.ProductCategoryID,
                        c.ProductMainCategoryID,
                    };

        // nếu có dk Mid thì load theo danh mục maincategory
        if (mid > 0)
        {
            query = query.Where(x => x.ProductMainCategoryID == mid);
        }
        else if (cid > 0)
        {
            query = query.Where(x => x.ProductCategoryID == cid);
        }
        else if (PhuKien > 0)
        {
            query = query.Where(x => x.ProductCategoryID == PhuKien);
        }
        else
        {
            Response.Redirect("/Default.aspx");
        }
        // nếu có dk cid thì load theo danh mục category

        //Đổ vào Repeater
        int pageSize = 12; //10 là số phần tử trên mỗi trang
        int maxPage = 5; //5 là số trang tối đã sẽ hiển thị, còn lại là ...
        int page = Request.QueryString["page"].ToInt(); // Trang hiện tại
        if (page <= 0)
            page = 1;
        int totalItems = query.Count();
        // .: Lưu ý sửa lại link cho đúng với trang và điều kiện thực tế của mỗi trang :. \\
        string url = "~/ProductList.aspx?mid={0}&cid={1}&page={2}".StringFormat(mid, cid, "{0}");
        ucPagging.TotalItems = totalItems;
        ucPagging.CurrentPage = page;
        ucPagging.PageSize = pageSize;
        ucPagging.MaxPage = maxPage;
        ucPagging.URL = url;
        ucPagging.DataBind();
        Repeater_Main.DataSource = query.Pagging(page, pageSize).ToList();
        Repeater_Main.DataBind();
    }
}