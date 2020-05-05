using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class _Default : System.Web.UI.Page
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
        var data = from m in db.ProductMainCategories
                   orderby m.ProductMainCategoryID ascending
                   select new
                   {
                       m.ProductMainCategoryID,
                       m.Title,
                       Sub = (from c in m.ProductCategories
                              from p in c.Products
                              where p.Status == true
                              orderby p.ProductID ascending
                              select new
                              {
                                  p.ProductID,
                                  p.Avatar,
                                  p.Title,
                                  p.Price
                              }).Take(8),
                   };
        Repeater_Main.DataSource = data.Take(4).ToList();
        Repeater_Main.DataBind();
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