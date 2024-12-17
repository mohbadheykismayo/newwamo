using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebGrease.Activities;

namespace waamowaste
{
    public partial class login : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblError.Text = "Please enter both username and password.";
                return;
            }

            // Check the user credentials, including the isactive status from Employees table
            string query = "SELECT U.UserID, U.Username, U.PasswordHash, U.UserRole, E.isactive " +
                           "FROM Users U " +
                           "INNER JOIN Employees E ON U.UserID = E.UserID " +
                           "WHERE U.Username = @Username";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    string storedPasswordHash = reader["PasswordHash"].ToString();
                    string userRole = reader["UserRole"].ToString();
                    int isActive = Convert.ToInt32(reader["isactive"]);

                    // Check if the user is active
                    if (isActive == 0)
                    {
                        lblError.Text = "Your account is inactive. Please contact support.";
                        return;
                    }

                    // Verify password (assuming you use a password hash verification method)
                    if (VerifyPassword(password, storedPasswordHash))
                    {
                        // Set session variables to keep track of the logged-in user
                        Session["UserID"] = reader["UserID"];
                        Session["Username"] = reader["Username"];
                        Session["UserRole"] = userRole;

                        // Redirect based on role
                        if (userRole == "Admin")
                        {
                            Response.Redirect("~/dashbourd.aspx"); // Admin Dashboard
                        }
                        else if (userRole == "Employee")
                        {
                            Response.Redirect("~/userdashbourd.aspx"); // Employee Dashboard
                        }
                    }
                    else
                    {
                        lblError.Text = "Invalid username or password.";
                    }
                }
                else
                {
                    lblError.Text = "Invalid username or password.";
                }
            }
        }


        // Example of a password hash verification method
        private bool VerifyPassword(string enteredPassword, string storedHash)
        {
            // Here, you should use a secure hash comparison mechanism (e.g., SHA256, bcrypt, etc.)
            // For simplicity, let's assume a direct comparison (you should never store plain passwords).
            return enteredPassword == storedHash; // This is just an example
        }
    }
}
