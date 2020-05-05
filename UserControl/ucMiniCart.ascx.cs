using CodeUtility;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class ucMiniCart : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        LoadData();
    }

    public void LoadData()
    {


        if (SessionUtility.Cart.Count == 0)
        {
            div_Product.Visible = false;
            div_NoProduct.Visible = true;
            span_Count.InnerHtml = SessionUtility.Cart.Count.ToString();
            span_Amount.InnerHtml = SessionUtility.Cart.Amount.ToString("0");
        }
        else
        {
            div_NoProduct.Visible = false;
            div_Product.Visible = true;

            Repeater_Main.DataSource = SessionUtility.Cart.CartItems.Values;
            Repeater_Main.DataBind();

            span_Count.InnerHtml = SessionUtility.Cart.Count.ToString();
            span_Amount.InnerHtml = SessionUtility.Cart.Amount.ToString("0,00");
        }

    }

    protected void LinkButton_Remove_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton_Remove = sender as LinkButton;
        int productID = LinkButton_Remove.CommandArgument.ToInt();
        if (SessionUtility.Cart.CartItems.ContainsKey(productID))
            SessionUtility.Cart.CartItems.Remove(productID);

        LoadData();
    }
}