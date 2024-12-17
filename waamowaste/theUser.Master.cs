using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace waamowaste
{
    public partial class theUser : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                // Session variables are null, redirect to the login page
                Response.Redirect("login.aspx"); // Replace "LoginPage.aspx" with the actual login page URL
            }
            else
            {
                // Session variables are not null, display them in labels

                Label1.Text = Session["Username"]?.ToString() ?? "N/A";
                Label2.Text = Session["UserRole"]?.ToString() ?? "N/A";
                Label8.Text = Session["UserID"]?.ToString() ?? "N/A";
            }
        }


        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear session data (logout user)
            Session.Clear();
            Session.Abandon();

            // Optionally, clear any authentication cookies if needed
            if (Request.Cookies[".ASPXAUTH"] != null)
            {
                var authCookie = new HttpCookie(".ASPXAUTH")
                {
                    Expires = DateTime.Now.AddDays(-1) // Set expiration to past date to delete the cookie
                };
                Response.Cookies.Add(authCookie);
            }

            // Redirect the user to the login page
            Response.Redirect("Login.aspx");
        }
    }
}