using CodeUtility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_OderList : System.Web.UI.Page
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
        var query = from o in db.Orders
                    orderby o.CreateTime descending
                    select new
                    {
                        o.OrderID,
                        o.Code,
                        o.FullName,
                        o.CreateTime,
                        o.Email,
                        o.Mobi,
                        o.Address,
                        o.Total,
                        o.ChargeStatus,
                        o.OrderStatus,
                        o.DeliverStatus,
                        o.PaymentMethod
                    };
        string keyword = Request.QueryString["keyword"].ToSafetyString();
        DateTime Startday = Request.QueryString["start"].ToDateTime("dd/MM/yyyy");
        DateTime Endday = Request.QueryString["end"].ToDateTime("dd/MM/yyyy");
        //nếu có nhập keyword, thì thêm đk
        if (keyword != string.Empty)
        {
            input_Keyword.Value = keyword;
            query = query.Where(x => x.Email.Contains(keyword));
        }
        //nếu có nhập ô lọc đơn hàng theo ngày tháng, thì thêm đk
        if (Startday != DateTime.MinValue && Endday != DateTime.MinValue)
        {
            query = query.Where(x => x.CreateTime > Startday && x.CreateTime < Endday);
        }

        //Đổ vào Repeater
        int pageSize = 10; //10 là số phần tử trên mỗi trang
        int maxPage = 5; //5 là số trang tối đã sẽ hiển thị, còn lại là ...
        int page = Request.QueryString["page"].ToInt(); // Trang hiện tại
        if (page <= 0)
            page = 1;
        int totalItems = query.Count();
        // .: Lưu ý sửa lại link cho đúng với trang và điều kiện thực tế của mỗi trang :. \\
        string url = "~/Admin/OrderList.aspx?keyword={0}&start={1}&end={2}&page={3}".StringFormat(keyword, Startday.ToString("dd/MM/yyyy"), Endday.ToString("dd/MM/yyyy"), "{0}");
        ucPagging.TotalItems = totalItems;
        ucPagging.CurrentPage = page;
        ucPagging.PageSize = pageSize;
        ucPagging.MaxPage = maxPage;
        ucPagging.URL = url;
        ucPagging.DataBind();
        Repeater_Main.DataSource = query.Pagging(page, pageSize).ToList();
        Repeater_Main.DataBind(); ;
    }
    public void SearchData()
    {
        string url = "/Admin/OrderList.aspx?";
        string keyword = input_Keyword.Value.Trim();
        int page = Request.QueryString["page"].ToInt();
        string Start = input_StartDay.Value.Trim();
        string End = input_EndDay.Value.Trim();

        if (keyword != string.Empty)
        {
            url += "&keyword=" + keyword;
        }

        if (Start != string.Empty)
        {
            url += "&start=" + Start.StringFormat("yyyy/MM/dd");
        }
        if (End != string.Empty)
        {
            url += "&end=" + End.StringFormat("yyyy/MM/dd");
        }
        if (page > 0)
        {
            url += "&page=" + page;
        }

        url = url.Replace("?&", "?").Trim('?');

        Response.Redirect(url);
    }

    protected void LinkButton_Search_Click(object sender, EventArgs e)
    {
        SearchData();
    }

    protected void LinkButton_ClearSearch_Click(object sender, EventArgs e)
    {
        input_Keyword.Value = string.Empty;
        string url = "/Admin/OrderList.aspx";
        Response.Redirect(url);
        SearchData();
    }



    protected void LinkButton_ChargeStatus_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton_ChargeStatus = sender as LinkButton;
        int ID = LinkButton_ChargeStatus.CommandArgument.ToInt();

        // Vào DB tìm account phù hợp
        DBEntities db = new DBEntities();
        var item = db.Orders.Where(x => x.OrderID == ID).FirstOrDefault();
        // nếu k tồn tại thì load lại
        if (item == null)
        {
            LoadData();
            return;
        }
        //update status
        item.ChargeStatus = !item.ChargeStatus;
        db.SaveChanges();
        // load lại dữ liệu
        LoadData();

        // thông báo
        ucMessage.ShowSuccess("Đã Update Trạng Thái");
    }

    protected void LinkButton_DeliverStatus_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton_DeliverStatus = sender as LinkButton;
        int ID = LinkButton_DeliverStatus.CommandArgument.ToInt();

        // Vào DB tìm account phù hợp
        DBEntities db = new DBEntities();
        var item = db.Orders.Where(x => x.OrderID == ID).FirstOrDefault();
        // nếu k tồn tại thì load lại
        if (item == null)
        {
            LoadData();
            return;
        }
        //update status
        item.DeliverStatus = !item.DeliverStatus;
        db.SaveChanges();
        // load lại dữ liệu
        LoadData();

        // thông báo
        ucMessage.ShowSuccess("Đã Update Trạng Thái");
    }
}
