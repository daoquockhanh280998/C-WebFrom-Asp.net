
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class ucContactForm : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ucMessage.HideAll();
            ucMessage.ShowInfo("Mời Nhập Thông Tin");
        }
    }
    public void ClearForm()
    {
        input_FullName.Value = string.Empty;
        input_Mobil.Value = string.Empty;
        input_Email.Value = string.Empty;
        textarea_Content.Value = string.Empty;
        input_Topic.Value = string.Empty;
    }

    protected void LinkButton_Send_Click(object sender, EventArgs e)
    {
        // lấy thông tin khách nhập
        string fullname = input_FullName.Value.Trim();
        string email = input_Email.Value.Trim();
        string mobil = input_Mobil.Value.Trim();
        string topic = input_Topic.Value.Trim();
        string content = textarea_Content.Value.Trim();

        // kiểm tra
        if (fullname == string.Empty)
        {
            ucMessage.ShowError("Hãy Nhập Họ Tên");
            return;

        }
        if (email == string.Empty || !email.IsEmailFormat())
        {
            ucMessage.ShowError("Hãy Nhập email đúng định dạng");
            return;

        }
        if (mobil == string.Empty)
        {
            ucMessage.ShowError("Hãy Nhập Số điện thoại");
            return;

        }
        if (topic == string.Empty)
        {
            ucMessage.ShowError("Hãy Nhập Chủ đề");
            return;

        }
        if (content == string.Empty)
        {
            ucMessage.ShowError("Hãy Nhập Nội Dung");
            return;

        }

        // tạo đối tượng lưu trữ
        Contact item = new Contact(); // Contact do đã có kết nối db nên model đã tự tạo ra các class là tên bảng trong db
        item.FullName = fullname;
        item.Email = email;
        item.Mobi = mobil;
        item.topic = topic;
        item.Content = content;

        item.Status = false;
        item.CreateTime = DateTime.Now;
        //lưu DB
        DBEntities db = new DBEntities();
        db.Contacts.Add(item);
        db.SaveChanges();


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
        emailBody += "Kính chào admin, có 1 thư liên hệ: <br>";
        emailBody += "Họ tên: " + fullname + "<br>";
        emailBody += "Email: " + email + "<br>";
        emailBody += "SĐT: " + mobil + "<br>";
        emailBody += "Chủ Đề: " + topic + "<br>";
        emailBody += "Nội dung: " + content + "<br>";
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

        //Thông báo
        ucMessage.ShowSuccess("Đã gửi thư liên hệ. Chúng tôi sẽ trả lời sớm");

        //Xóa form
        ClearForm();
    }
}