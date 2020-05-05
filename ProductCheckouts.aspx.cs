using CodeUtility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
            ucMessage.HideAll();
        }
    }

    public void LoadData()
    {

        Client item = Session["Client"] as Client;
        if (item == null)
        {

        }
        else
        {

            input_Email.Value = item.Email;
            input_Fullname.Value = item.FullName;
            input_Mobi.Value = item.Mobi;
            input_Mobi2.Value = string.Empty;
            if (item.Gender != null && item.Gender.Value == true)
            {
                radio_GenderFemale.Checked = false;
                radio_GenderMale.Checked = true;
            }
            else
            {
                radio_GenderMale.Checked = false;
                radio_GenderFemale.Checked = true;
            }
            input_Address.Value = item.Address;
        }

        Repeater_Main.DataSource = SessionUtility.Cart.CartItems.Values;
        Repeater_Main.DataBind();
        span_Total.InnerHtml = SessionUtility.Cart.Total.ToString("0,00 Đ");
        span_Bonus.InnerHtml = SessionUtility.Cart.Bonus.ToString("0,00 Đ");
        span_Ship.InnerHtml = SessionUtility.Cart.Ship.ToString("0,00 Đ");
        span_AmountPay.InnerHtml = SessionUtility.Cart.AmountPay.ToString("0,00 Đ");
    }


    protected void LinkButton_LogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("/Default.aspx");
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

    protected void LinkButton_Remove_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton_Remove = sender as LinkButton;
        int productID = LinkButton_Remove.CommandArgument.ToInt();
        if (SessionUtility.Cart.CartItems.ContainsKey(productID))
            SessionUtility.Cart.CartItems.Remove(productID);

        LoadData();
    }

    protected void LinkButton_CheckOut_Click(object sender, EventArgs e)
    {
        string email = input_Email.Value.Trim();
        string fullname = input_Fullname.Value.Trim();
        string mobi = input_Mobi.Value.Trim();
        string mobi2 = input_Mobi2.Value.Trim();
        bool gender = radio_GenderMale.Checked ? true : false;
        string address = input_Address.Value.Trim();
        //kiểm tra có null không
        if (email.IsNullOrEmptyOrWhiteSpaces() || !email.IsEmailFormat())
        {
            ucMessage.ShowError("Mời Nhập Email Đúng Định Dạng");
            return;
        }

        if (fullname.IsNullOrEmptyOrWhiteSpaces())
        {
            ucMessage.ShowError("Mời Nhập Họ Tên ");
            return;
        }
        if (mobi.IsNullOrEmptyOrWhiteSpaces())
        {
            ucMessage.ShowError("Mời Nhập Số Điện Thoại");
            return;
        }
        if (mobi2.IsNullOrEmptyOrWhiteSpaces())
        {
            ucMessage.ShowError("Mời Nhập Số Điện Thoại 2");
            return;
        }

        if (address.IsNullOrEmptyOrWhiteSpaces())
        {
            ucMessage.ShowError("Mời Nhập Địa Chỉ");
            return;
        }

        int paymenMethod = radio_payment_NganLuong.Checked == true ? 1 : 0;

        // kiểm tra giỏ hàng khác rỗng
        if (SessionUtility.Cart.Count == 0)
        {
            ucMessage.ShowError("Bạn Chưa Chọn Sản Phẩm");
            return;
        }
        // thêm mã cho đơn hàng
        string addCode = "VSD2020";
        Order order = new Order();
        order.Code = addCode;
        order.Email = email;
        order.FullName = fullname;
        order.Mobi = mobi;
        order.Mobi2 = mobi2;
        order.Gender = gender;
        order.Address = address;
        order.Ship = SessionUtility.Cart.Ship;
        order.Total = SessionUtility.Cart.AmountPay;
        order.OrderStatus = true; // đã đặt hàng
        order.DeliverStatus = false; // chưa giao hàng
        order.ChargeStatus = false; // chưa thanh toán
        order.CreateTime = DateTime.Now;
        order.PaymentMethod = paymenMethod;

        // kiểm tra khách đăng nhập chưa nếu rồi thì lưu thông tin khách
        if (SessionUtility.Client != null)
        {
            order.ClientID = SessionUtility.Client.ClientID;
        }

        // lưu chi tiết đơn hàng vào trong đơn hàng
        foreach (var item in SessionUtility.Cart.CartItems.Values)
        {
            OrderDetail detail = new OrderDetail();
            detail.ProductID = item.ID;
            detail.Price = item.Price;
            detail.Quantity = item.Quantity;

            order.OrderDetails.Add(detail);
        }
        //lưu db
        DBEntities db = new DBEntities();
        db.Orders.Add(order);
        db.SaveChanges();

        // lưu thông tin khách vào session để có thể kiểm tra lại đơn hàng
        SessionUtility.Cart.Email = order.Email;


        //Chuyển đến trang thanh toán
        //Lấy url của website
        string baseUrl = Request.Url.GetLeftPart(UriPartial.Authority);

        //Kiểm tra phương thức thanh toán
        if (order.PaymentMethod == 0)
        {
            //Thanh toán tại nhà
            string returnUrl = "{0}/ProductCheckoutComplete.aspx?payment_type={1}&order_code={2}".StringFormat(baseUrl, order.PaymentMethod, order.OrderID);
            Response.Redirect(returnUrl);
            return;
        }
        else
        {
            //Thanh toán tại nganluong
            string returnUrl = "{0}/ProductCheckoutComplete.aspx".StringFormat(baseUrl);
            string transaction_info = "Quốc Khánh thanh toán đơn hàng có mã số {0}".StringFormat(order.OrderID);
            string order_code = order.OrderID.ToString();
            string receiver = "daoquockhanh280998@gmail.com";
            string price = "2000"; //Giá demo tối thiểu
            NL_Checkout nl = new NL_Checkout();
            string url = nl.buildCheckoutUrl(returnUrl, receiver, transaction_info, order_code, price);
            Response.Redirect(url);
        }

        ucMessage.ShowSuccess("Đã Lưu Đơn Hàng , Đang Chờ Thanh Toán");
    }
}