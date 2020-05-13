using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucMenu : System.Web.UI.UserControl
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
        var query = from m in db.ProductMainCategories
                    where m.Status == true
                    select new
                    {
                        m.ProductMainCategoryID,
                        m.Title,
                        Sub = (from c in m.ProductCategories
                               where c.Status == true
                               select new
                               {
                                   c.ProductCategoryID,
                                   c.Title
                               })
                    };
        Repeater_Main.DataSource = query.ToList();
        Repeater_Main.DataBind();
    }
}