using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class ProductDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
            LoadRelated();
            LoadUnRelated();
        }
    }
    public void LoadData()
    {
        int id = Request.QueryString["id"].ToInt();
        if (id == 0)
        {
            Response.Redirect("/Default.aspx");
        }
        DBEntities db = new DBEntities();
        var query = from p in db.Products
                    where p.Status == true && p.ProductID == id
                    orderby p.ProductID descending
                    select new
                    {
                        p.ProductID,
                        p.Title,
                        p.Avatar,
                        p.ImagesList,
                        p.Price,
                        p.Dercription,
                        p.Thumb
                    };
        Repeater_Main.DataSource = query.ToList();
        Repeater_Main.DataBind();
    }

    public void LoadRelated()
    {
        //lấy id trên thanh url
        int ID = Request.QueryString["id"].ToInt();

        // lấy 1 product có id phù hợp
        DBEntities db = new DBEntities();
        var item = db.Products.Where(x => x.ProductID == ID).FirstOrDefault();
        if (item == null)
        {
            return;
        }

        // lấy CatID của product đó
        int CatID = item.ProductCategoryID.Value;

        // lọc những product có CatID phù hợp , nhưng id phải khác
        var data = db.Products.Where(x => x.ProductCategoryID == CatID)
                                .OrderByDescending(x => x.CreateTime)
                               .Select(x => new
                               {
                                   x.ProductID,
                                   x.Avatar,
                                   x.Title,
                                   x.Price,
                                   x.OldPrice
                               });
        Repeater_Related.DataSource = data.Take(8).ToList();
        Repeater_Related.DataBind();
    }
    public void LoadUnRelated()
    {
        //lấy id trên thanh url
        int ID = Request.QueryString["id"].ToInt();

        // lấy 1 product có id phù hợp
        DBEntities db = new DBEntities();
        var item = db.Products.Where(x => x.ProductID == ID).FirstOrDefault();
        if (item == null)
        {
            return;
        }

        // lấy CatID của product đó
        int CatID = item.ProductCategoryID.Value;

        // lọc những product có CatID phù hợp , nhưng id phải khác
        var data = db.Products.Where(x => x.ProductCategoryID != CatID)
                                .OrderByDescending(x => Guid.NewGuid())
                               .Select(x => new
                               {
                                   x.ProductID,
                                   x.Avatar,
                                   x.Title,
                                   x.Price,
                                   x.OldPrice
                               });
        Repeater_UnRelated.DataSource = data.Take(8).ToList();
        Repeater_UnRelated.DataBind();
    }

    protected void LinkButton_AddToCart_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton_AddToCart = sender as LinkButton;
        int productID = LinkButton_AddToCart.CommandArgument.ToInt();
        DBEntities db = new DBEntities();
        var product = db.Products.Where(x => x.ProductID == productID).FirstOrDefault();

        if (product == null)
            return;

        if (!SessionUtility.Cart.CartItems.ContainsKey(productID))
        {
            SessionUtility.Cart.CartItems.Add(productID, new CartItem());
            SessionUtility.Cart.CartItems[productID].ID = product.ProductID;
            SessionUtility.Cart.CartItems[productID].Avatar = product.Avatar;
            SessionUtility.Cart.CartItems[productID].Title = product.Title;
            SessionUtility.Cart.CartItems[productID].Price = product.Price.Value;
            SessionUtility.Cart.CartItems[productID].OldPrice = product.OldPrice.Value;
            SessionUtility.Cart.CartItems[productID].Quantity = 1;
        }
        else
        {
            SessionUtility.Cart.CartItems[productID].Quantity += 1;
        }
    }
}