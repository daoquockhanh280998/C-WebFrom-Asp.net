using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CodeUtility;


public class SessionUtility
{
    public static string AdminUsername
    {
        get
        {
            return HttpContext.Current.Session["AdminUsername"].ToSafetyString();
        }
        set
        {
            HttpContext.Current.Session["AdminUsername"] = value;
        }
    }
    public static string AdminAvatar
    {
        get
        {
            return HttpContext.Current.Session["AdminAvatar"].ToSafetyString();
        }
        set
        {
            HttpContext.Current.Session["AdminAvatar"] = value;
        }
    }
    public static string AdminFullName
    {
        get
        {
            return HttpContext.Current.Session["AdminFullName"].ToSafetyString();
        }
        set
        {
            HttpContext.Current.Session["AdminFullName"] = value;
        }
    }
    public static string AdminEmail
    {
        get
        {
            return HttpContext.Current.Session["AdminEmail"].ToSafetyString();
        }
        set
        {
            HttpContext.Current.Session["AdminEmail"] = value;
        }
    }
    public static string AdminCategoryID
    {
        get
        {
            return HttpContext.Current.Session["AdminCategoryID"].ToSafetyString();
        }
        set
        {
            HttpContext.Current.Session["AdminCategoryID"] = value;
        }
    }

    public static Cart Cart
    {
        get
        {
            // lazy load là 1 kỹ thuật sẽ tạo 1 đối tượng khi k tồn tại chứ k trả về null
            if (HttpContext.Current.Session["Cart"] == null)
            {
                Cart newCart = new Cart();
                newCart.CartItems = new Dictionary<int, CartItem>();

                HttpContext.Current.Session["Cart"] = newCart;
            }
            return HttpContext.Current.Session["Cart"] as Cart;
        }
        set
        {
            HttpContext.Current.Session["Cart"] = value;
        }
    }

    public static Client Client
    {
        get
        {
            return HttpContext.Current.Session["Client"] as Client;
        }
        set
        {
            HttpContext.Current.Session["Client"] = value;
        }
    }


}