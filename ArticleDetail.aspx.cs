using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class _Default : System.Web.UI.Page
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
        int id = Request.QueryString["id"].ToInt();
        DBEntities db = new DBEntities();
        var query = from a in db.Articles
                    where a.Status == true
                    orderby a.ArticleID
                    select new
                    {
                        a.ArticleID,
                        a.Title,
                        a.Avatar,
                        a.Thumb,
                        a.Content,
                        a.sourcelink
                    };
        if (id > 0)
        {
            query = query.Where(x => x.ArticleID == id);
        }
        else
        {
            Response.Redirect("/ArticleList.aspx");
        }
        Repeater_Main.DataSource = query.ToList();
        Repeater_Main.DataBind();
    }

}