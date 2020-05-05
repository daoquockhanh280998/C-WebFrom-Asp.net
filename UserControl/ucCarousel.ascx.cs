using CodeUtility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucCarousel : System.Web.UI.UserControl
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
        var query = from p in db.Pictures
                    where p.Status == true && p.PictureCategoryID == 2
                    orderby p.PictureID ascending
                    select new
                    {
                        p.PictureID,
                        p.Title,
                        p.Description,
                        p.Avatar,
                        p.Link
                    };
        Repeater_Main.DataSource = query.ToList();
        Repeater_Main.DataBind();

        int imgMain = 1;
        var item = db.Pictures.Where(x => x.PictureCategoryID == imgMain && x.Status == true).FirstOrDefault();
        if (item == null)
        {
                img_MainImages.Src = "/image/tieucanh/tieu-canh-chau-tru-ms-03.jpg";
        }
        else
        {
            img_MainImages.Src = item.Avatar;
        }
    }
}