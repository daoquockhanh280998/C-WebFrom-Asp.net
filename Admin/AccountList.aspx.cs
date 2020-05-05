using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ucMessage.HideAll();
            LoadCategory();
            LoadData();
        }
    }
    public void LoadCategory()
    {
        DBEntities db = new DBEntities();
        var data = db.AccountCategories.Select(x => new { x.AccountCategoryID, x.Title });

        DropDownList_Category.DataValueField = "AccountCategoryID";
        DropDownList_Category.DataTextField = "Title";

        DropDownList_Category.DataSource = data.ToList();
        DropDownList_Category.DataBind();
        //thêm 1 item mặc đinh ở trên đầu dropdown
        ListItem defaultItem = new ListItem(".:Mời chọn thể loại:.", string.Empty);
        DropDownList_Category.Items.Insert(0, defaultItem);
    }
    public void LoadData()
    {
        DBEntities db = new DBEntities();
        var query = from c in db.AccountCategories
                    from a in c.Accounts
                    orderby a.Username
                    select new
                    {
                        a.Username,
                        a.Avatar,
                        a.FullName,
                        a.Email,
                        a.Mobi,
                        a.Address,
                        a.Gender,
                        a.Status,
                        a.CreateTime,
                        CatTitle = c.Title,
                        CatID = c.AccountCategoryID

                    };
        string catID = DropDownList_Category.SelectedValue;
        string keyword = input_Keyword.Value.Trim();

        //Nếu có chọn tìm theo thể loại, thì thê, đk
        if (catID != string.Empty)
        {
            query = query.Where(x => x.CatID == catID);
        }

        //nếu có nhập keyword, thì thêm đk
        if (keyword != string.Empty)
        {
            query = query.Where(x => x.Username.Contains(keyword) ||
                                    x.FullName.Contains(keyword) ||
                                    x.Mobi.Contains(keyword) ||
                                    x.Email.Contains(keyword));
        }

        Repeater_Main.DataSource = query.ToList();
        Repeater_Main.DataBind();
    }
    protected void LinkButton_Delete_Click(object sender, EventArgs e)
    {
        DBEntities db = new DBEntities();
        //kiểm tra quyền admin
        string checkaccount = "SupperAdmin";
        if (checkaccount != SessionUtility.AdminCategoryID)
        {

            ucMessage.ShowError("Bạn Không Thể Xóa Tài Khoản Của Mình Cũng Như Xóa Tài Khoản Của Admin Khác Vì Bạn Không Đủ Quyền Vui Lòng Liên Hệ Với Quản Trị Cao Cấp");
            return;
        }
        else
        {
            //lấy username cần xóa
            LinkButton LinkButton_Delete = sender as LinkButton;
            string username = LinkButton_Delete.CommandArgument;

            //nếu là user đang đăng nhập thì k cho xóa
            if (username == SessionUtility.AdminUsername)
            {
                ucMessage.ShowError("Không thể xóa tài khoản đang đăng nhập");
                return;
            }

            // tìm item cần xóa

            var item = db.Accounts.Where(x => x.Username == username).FirstOrDefault();

            //nếu k có thì báo lỗi
            if (item == null)
            {
                ucMessage.ShowError("Dữ Liệu này không còn tồn tại");
                LoadData();
                return;
            }

            //thử xóa trong bảng
            db.Accounts.Remove(item);
            try
            {
                db.SaveChanges();
            }
            catch (Exception)
            {
                //throw; throw là cái quăng lỗi vàng ra ngoài
                ucMessage.ShowError("không thể xóa tài khoản này do có dữ liệu ràng buộc");
                return;
            }

            LoadData();
            ucMessage.ShowSuccess("Đã Xóa thành công");
        }

    }

    protected void LinkButton_Status_Click(object sender, EventArgs e)
    {
        DBEntities db = new DBEntities();
        //kiểm tra quyền admin
        string checkaccount = "SupperAdmin";
        if (checkaccount != SessionUtility.AdminCategoryID)
        {
            ucMessage.ShowError("Bạn Không Thể Update Trạng Thái Của Mình Cũng Như Update Trạng Thái Của Admin Khác Vì Bạn Không Đủ Quyền Vui Lòng Liên Hệ Với Quản Trị Cao Cấp");
            return;
        }
        else
        {
            LinkButton LinkButton_Status = sender as LinkButton;
            string username = LinkButton_Status.CommandArgument;

            // kiểm tra username đang dc đăng nhập nếu là tài khoản đăng nhập thì k cho cập nhật trạng thái
            if (username == SessionUtility.AdminUsername)
            {
                ucMessage.ShowError("Bạn Không Thể Update Trạng Thái Của Chính Mình");
                return;
            }
            // Vào DB tìm account phù hợp
            var item = db.Accounts.Where(x => x.Username == username).FirstOrDefault();
            // nếu k tồn tại thì load lại
            if (item == null)
            {
                LoadData();
                return;
            }
            //update status
            item.Status = !item.Status;
            db.SaveChanges();
            // load lại dữ liệu
            LoadData();

            // thông báo
            ucMessage.ShowSuccess("Đã Update Trạng Thái");
        }



    }


    protected void DropDownList_Category_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadData();
    }

    protected void LinkButton_Search_Click(object sender, EventArgs e)
    {
        LoadData();
    }

    protected void LinkButton_ClearSearch_Click(object sender, EventArgs e)
    {
        DropDownList_Category.SelectedValue = string.Empty;
        input_Keyword.Value = string.Empty;
        LoadData();
    }

    protected void LinkButton_Add_Click(object sender, EventArgs e)
    {
        DBEntities db = new DBEntities();
        string checkaccount = "SupperAdmin";
        if (checkaccount != SessionUtility.AdminCategoryID)
        {
            ucMessage.ShowError("Bạn Không Đủ Quyền Thêm Mới Tài Khoản Admin Vui Lòng Liên Hệ Với Quản Trị Cao Cấp");
            return;
        }
        else
        {
            Response.Redirect("/Admin/AccountEdit.aspx");
        }
    }

    protected void LinkButton_AccountEdit_Click(object sender, EventArgs e)
    {
        string checkaccount = "SupperAdmin";
        LinkButton LinkButton_AccountEdit = sender as LinkButton;
        string userNameID = LinkButton_AccountEdit.CommandArgument;
        if (checkaccount != SessionUtility.AdminCategoryID)
        {
            if (userNameID != SessionUtility.AdminUsername)
            {
                ucMessage.ShowError("Bạn Không Đủ Quyền Chỉnh Sửa Tài Khoản Admin Khác Vui Lòng Liên Hệ Với Quản Trị Cao Cấp");
                return;
            }
            else
            {
                Response.Redirect("/Admin/AccountEdit.aspx?id=" + userNameID);
            }
            return;
        }
        else
        {
            Response.Redirect("/Admin/AccountEdit.aspx?id=" + userNameID);
        }




    }

    protected void LinkButton_ChangePassword_Click(object sender, EventArgs e)
    {
        string checkaccount = "SupperAdmin";
        LinkButton LinkButton_ChangePassword = sender as LinkButton;
        string userNameID = LinkButton_ChangePassword.CommandArgument;
        if (checkaccount != SessionUtility.AdminCategoryID)
        {
            if (userNameID != SessionUtility.AdminUsername)
            {
                ucMessage.ShowError("Bạn Không Đủ Quyền Thay Đổi Mật Khẩu Tài Khoản Admin Khác Vui Lòng Liên Hệ Với Quản Trị Cao Cấp");
                return;
            }
            else
            {
                Response.Redirect("/Admin/AccountPasswordChange.aspx?id=" + userNameID);
            }
            return;
        }
        else
        {
            Response.Redirect("/Admin/AccountPasswordChange.aspx?id=" + userNameID);
        }
    }


}