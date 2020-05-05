using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class OderDetail : System.Web.UI.Page
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
        // kiểm tra email k có thì k show đơn hàng
        if (SessionUtility.Cart.Email == null || SessionUtility.Cart.Email == string.Empty)
        {
            ucMessage.ShowError("Quý Khách Chưa Có Đơn Hàng Nào");
            return;
        }

        DBEntities db = new DBEntities();
        var query = from o in db.Orders
                    where o.Email == SessionUtility.Cart.Email
                    orderby o.CreateTime descending
                    select new
                    {
                        o.OrderID,
                        o.Email,
                        o.FullName,
                        o.Mobi,
                        o.Mobi2,
                        o.Code,
                        o.Ship,
                        o.Total,
                        o.Address,
                        o.CreateTime,
                        o.ChargeStatus,
                        o.DeliverStatus,
                        OrderDetailList = (from d in o.OrderDetails
                                           from p in db.Products
                                           where d.ProductID == p.ProductID
                                           select new
                                           {
                                               d.OrderID,
                                               d.ProductID,
                                               d.Quantity,
                                               d.Price,
                                               p.OldPrice,
                                               p.Title,
                                               p.Avatar
                                           })
                    };
        Repeater_Main.DataSource = query.Take(10).ToList();
        Repeater_Main.DataBind();


    }

}