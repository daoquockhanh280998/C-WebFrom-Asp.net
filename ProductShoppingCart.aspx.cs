using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class ProductShoppingCart : System.Web.UI.Page
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
        Repeater_Main.DataSource = SessionUtility.Cart.CartItems.Values;
        Repeater_Main.DataBind();
        strong_Total.InnerHtml = SessionUtility.Cart.Total.ToString("0,00 Đ");
        strong_Bonus.InnerHtml = SessionUtility.Cart.Bonus.ToString("- 0,00 Đ");
        strong_Amount.InnerHtml = SessionUtility.Cart.Amount.ToString("0,00 Đ");
    }

    protected void LinkButton_Remove_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton_Remove = sender as LinkButton;
        int productID = LinkButton_Remove.CommandArgument.ToInt();
        if (SessionUtility.Cart.CartItems.ContainsKey(productID))
            SessionUtility.Cart.CartItems.Remove(productID);

        LoadData();
    }



    protected void LinkButton_Down_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton_Down = sender as LinkButton;
        int productID = LinkButton_Down.CommandArgument.ToInt();
        if (SessionUtility.Cart.CartItems.ContainsKey(productID))
        {
            if (SessionUtility.Cart.CartItems[productID].Quantity > 1)
            {
                SessionUtility.Cart.CartItems[productID].Quantity -= 1;
            }
        }
        LoadData();
    }

    protected void LinkButton_Up_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton_Up = sender as LinkButton;
        int productID = LinkButton_Up.CommandArgument.ToInt();
        if (SessionUtility.Cart.CartItems.ContainsKey(productID))
        {
            if (SessionUtility.Cart.CartItems[productID].Quantity < 50)
            {
                SessionUtility.Cart.CartItems[productID].Quantity += 1;
            }
        }
        LoadData();
    }
}