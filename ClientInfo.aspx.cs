using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class Default2 : System.Web.UI.Page
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
        if (SessionUtility.Client == null)
        {
            Response.Redirect("/");
        }
        else
        {
            string email = SessionUtility.Cart.Email;
            DBEntities db = new DBEntities();
            var data = from c in db.Clients
                       where c.Email == email
                       select new
                       {
                           c.ClientID,
                           c.Email,
                           c.FullName,
                           c.Mobi,
                           c.Address,
                           c.Gender
                       };

            Repeater_Main.DataSource = data.Take(1).ToList();
            Repeater_Main.DataBind();
        }

    }

    protected void LinkButton_Logout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("/");
    }
}