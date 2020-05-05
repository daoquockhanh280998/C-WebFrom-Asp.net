using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class Admin_OrderDetail : System.Web.UI.Page
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
        int id = Request.QueryString["id"].ToInt();
        DBEntities db = new DBEntities();
        var query = from o in db.Orders
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
        if (id > 0)
        {
            query = query.Where(x => x.OrderID == id);
        }
        Repeater_Main.DataSource = query.Take(1).ToList();
        Repeater_Main.DataBind();


    }
}