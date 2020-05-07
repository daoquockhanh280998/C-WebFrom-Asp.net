using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class ProductCheckoutComplete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Lấy mã đơn hàng
            int orderID = Request.QueryString["order_code"].ToInt();

            //Lấy hình thức thanh toán
            int paymentMethod = Request.QueryString["payment_type"].ToInt();

            //Cho tình trạng thanh toán mặc định là chưa trả tiền
            bool isCheckoutOK = false;

            //Nếu khách chọn trả tiền tại nhà
            if (paymentMethod == 0)
            {
                ucMessage.ShowSuccess("Xin chúc mừng, đơn hàng của bạn đã được lập. Bạn có thể thanh toán sau khi nhận được hàng tại nhà. <a href='OrderDetail.aspx'>xem Đơn Hàng Tại Đây</a> Hoặc Quý Khách Hãy Vào Email Của Mình Để Kiểm Tra");
                DBEntities db = new DBEntities();
                var order = db.Orders.Where(o => o.OrderID == orderID).FirstOrDefault();
                //Gửi một email xác nhận đơn hàng đã thanh toán cho khách
                string fullname = order.FullName;
                string ID = order.Code + order.OrderID;
                string date = order.CreateTime.ToString();
                int payment = order.PaymentMethod.ToInt();
                int phone = order.Mobi.ToInt();
                int phone2 = order.Mobi2.ToInt();
                string address = order.Address;
                string email = order.Email;
                //gửi email
                MailUtility emailItem = new MailUtility();
                emailItem.From = "chuvanan258vn@gmail.com";
                emailItem.Password = "0797891220";

                emailItem.To = "daoquockhanh280998@gmail.com";
                emailItem.Subject = "Thư liên hệ ngày: "
                                    + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");
                emailItem.Port = 587;
                emailItem.Host = "smtp.gmail.com";
                emailItem.EnableSSL = true;
                emailItem.IsBodyHtml = true;

                string emailBody = string.Empty;
                emailBody += "Chủ Đề: Xác Nhận Đặt Hàng " + "<br>";
                emailBody += "Kính chào quý khách: " + fullname + "<br>";
                emailBody += "VườnSenĐáBD vừa nhận được <p>đơn hàng:  </p>" + ID + "của quý khách đặt hàng vào ngày: " + date;
                emailBody += "Nội dung:Chúng Tôi Gửi Đến quý khánh lá thư này nhầm xác nhận việc đặt hàng của quý khách " + "<br>";
                if (payment == 0)
                {
                    emailBody += "Hình Thức Thanh Toán Là: Thanh Toán Qua Ngân Lượng " + "<br>";
                }
                else
                {
                    emailBody += "Hình Thức Thanh Toán Là: Thanh Toán Tại Nhà " + "<br>";
                }

                emailBody += "SĐT 1: " + phone + "<br>";
                emailBody += "SĐT 2: " + phone2 + "<br>";
                emailBody += "Địa Chỉ Giao Hàng: " + address + "<br>";
                emailBody += "Vào lúc: "
                                + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");

                emailItem.Body = emailBody;

                try
                {
                    emailItem.SendMail();
                }
                catch (Exception ex)
                {
                    ucMessage.ShowError("Không gửi được email, hãy thử lại sau");
                    return;
                }
                SessionUtility.Cart.CartItems.Clear();

            }
            else //Thanh toán trực tuyến tại ngân lượng
            {
                isCheckoutOK = ValidateCheckout();
            }

            //Cập nhật lại tình trạng thanh toán của đơn hàng
            if (isCheckoutOK) //Nếu thanh toán Online thành công
            {
                //Vào DB, tìm đơn hàng theo mã đơn hàng trả về
                DBEntities db = new DBEntities();
                var order = db.Orders.Where(q => q.OrderID == orderID).FirstOrDefault();

                //Nếu có đơn hàng và đơn hàng chưa cập nhật trạng thái trả tiền,
                // Thì cập nhật
                if (order != null && order.ChargeStatus != true)
                {
                    order.ChargeStatus = true;
                    db.SaveChanges();

                    SessionUtility.Cart.CartItems.Clear();
                }

                //Gửi một email xác nhận đơn hàng đã thanh toán cho khách
                string fullname = order.FullName;
                string ID = order.Code + order.OrderID;
                string date = order.CreateTime.ToString();
                int payment = order.PaymentMethod.ToInt();
                int phone = order.Mobi.ToInt();
                int phone2 = order.Mobi2.ToInt();
                string address = order.Address;
                string email = order.Email;
                //gửi email
                MailUtility emailItem = new MailUtility();
                emailItem.From = "chuvanan258vn@gmail.com";
                emailItem.Password = "0797891220";

                emailItem.To = "daoquockhanh280998@gmail.com";
                emailItem.Subject = "Thư liên hệ ngày: "
                                    + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");
                emailItem.Port = 587;
                emailItem.Host = "smtp.gmail.com";
                emailItem.EnableSSL = true;
                emailItem.IsBodyHtml = true;

                string emailBody = string.Empty;
                emailBody += "Chủ Đề: Xác Nhận Đặt Hàng " + "<br>";
                emailBody += "Kính chào quý khách: " + fullname + "<br>";
                emailBody += "VườnSenĐáBD vừa nhận được <p>đơn hàng:  </p>" + ID + "của quý khách đặt hàng vào ngày: " + date ;
                emailBody += "Nội dung:Chúng Tôi Gửi Đến quý khánh lá thư này nhầm xác nhận việc đặt hàng của quý khách " + "<br>";
                if (payment == 0)
                {
                    emailBody += "Hình Thức Thanh Toán Là: Thanh Toán Qua Ngân Lượng "  + "<br>";
                }
                else
                {
                    emailBody += "Hình Thức Thanh Toán Là: Thanh Toán Tại Nhà " + "<br>";
                }

                emailBody += "SĐT 1: " + phone + "<br>";
                emailBody += "SĐT 2: " + phone2 + "<br>";
                emailBody += "Địa Chỉ Giao Hàng: " + address + "<br>";
                emailBody += "Vào lúc: "
                                + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");

                emailItem.Body = emailBody;

                try
                {
                    emailItem.SendMail();
                }
                catch (Exception ex)
                {
                    ucMessage.ShowError("Không gửi được email, hãy thử lại sau");
                    return;
                }

                return;
            }
        }
    }

    public bool ValidateCheckout()
    {
        string transaction_info = Request.QueryString["transaction_info"].ToSafetyString();
        string order_code = Request.QueryString["order_code"].ToSafetyString();
        string payment_id = Request.QueryString["payment_id"].ToSafetyString();
        string payment_type = Request.QueryString["payment_type"].ToSafetyString();
        string secure_code = Request.QueryString["secure_code"].ToSafetyString();
        string price = Request.QueryString["price"].ToSafetyString();
        string error_text = Request.QueryString["error_text"].ToSafetyString();

        NL_Checkout nl = new NL_Checkout();
        bool isCheckoutOk = nl.verifyPaymentUrl(transaction_info, order_code, price, payment_id, payment_type, error_text, secure_code);
        // (String transaction_info, String order_code, String price, String payment_id, String payment_type, String error_text, String secure_code)
        if (isCheckoutOk && error_text == string.Empty)
        {
            isCheckoutOk = true;
            ucMessage.ShowSuccess("Xin chúc mừng, đơn hàng đã được thanh toán thanh công. Chúng tôi sẽ giao hàng trong thời gian sớm nhất. <a href='OderDetail.aspx'>xem Đơn Hàng</a>");
        }
        else
        {
            isCheckoutOk = false;
            ucMessage.ShowError("Rất tiếc, đơn hàng chưa được thanh toán thanh công. Vui lòng kiểm tra lại hoặc <a href='OderDetail.aspx'>xem Đơn Hàng</a>");
        }

        return isCheckoutOk;
    }
}