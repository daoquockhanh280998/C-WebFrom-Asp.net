using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucArticleNews : System.Web.UI.UserControl
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
        var query = from a in db.Articles
                    where a.Status == true && a.ArticleCategoryID == 2
                    orderby a.CreateTime descending
                    select new
                    {
                        a.ArticleID,
                        a.Title,
                        a.Avatar,
                        a.CreateTime,
                    };
        Repeater_Main.DataSource = query.Take(5).ToList();
        Repeater_Main.DataBind();
    }

}