using CodeUtility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ucMessage.HideAll();
            //thông báo
            int messageCode = Request.QueryString["message"].ToInt();
            if (messageCode == 1)
            {
                ucMessage.ShowError("Tài Khoản Bạn Không Được Phép Vào Loại Tài Khoản Vui Lòng Liên Hệ Với Quản Trị Viên Cao Cấp");
                return;
            }

        }
    }
}