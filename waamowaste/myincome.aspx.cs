







using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static waamowaste.paymentga;

namespace waamowaste
{
    public partial class myincome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public class dis
        {
            public string TotalDifference;
            public string TotalAmount;
            public string TotalDueAmount;

        }

        public class pre
        {
            public string TotalCurrentMonth;
            public string TotalPreviousMonth;

        }



        [WebMethod]
        public static dis[] money(int id)
        {
            List<dis> details = new List<dis>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
 


		SELECT 
    SUM(PaymentStatus.amount) AS TotalAmount,
    SUM(PaymentStatus.paidamount) AS TotalDifference,
    SUM(PaymentStatus.DueAmount) AS TotalDueAmount
FROM 
    [PaymentStatus]
INNER JOIN Houses ON PaymentStatus.HouseID = Houses.HouseID
INNER JOIN SubNeighborhoods ON Houses.SubNeighborhoodID = SubNeighborhoods.SubNeighborhoodID
INNER JOIN Neighborhoods ON SubNeighborhoods.NeighborhoodID = Neighborhoods.NeighborhoodID
WHERE 
    PaymentStatus.Month = MONTH(GETDATE())  -- Current month
    AND PaymentStatus.Year = YEAR(GETDATE())  -- Current year
    AND SubNeighborhoods.SubNeighborhoodID = @id and 	Houses.IsActive = 1;



        ", con);
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    dis field = new dis();
                    field.TotalAmount = dr["TotalAmount"].ToString();
                    field.TotalDueAmount = dr["TotalDueAmount"].ToString();
                    field.TotalDifference = dr["TotalDifference"].ToString();
                    details.Add(field);
                }
            }
            return details.ToArray();
        }








        [WebMethod]
        public static pre[] previousmoney(int id)
        {
            List<pre> details = new List<pre>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
SELECT 
    SUM(CASE 
        WHEN PaymentStatus.Month = MONTH(GETDATE()) AND PaymentStatus.Year = YEAR(GETDATE()) THEN PaymentStatus.paidamount
        ELSE 0
    END) AS TotalCurrentMonth,
    SUM(CASE 
        WHEN PaymentStatus.Month = MONTH(DATEADD(MONTH, -1, GETDATE())) AND PaymentStatus.Year = YEAR(DATEADD(MONTH, -1, GETDATE())) THEN PaymentStatus.paidamount
        ELSE 0
    END) AS TotalPreviousMonth
FROM 
    [PaymentStatus]
INNER JOIN Houses ON PaymentStatus.HouseID = Houses.HouseID
INNER JOIN SubNeighborhoods ON Houses.SubNeighborhoodID = SubNeighborhoods.SubNeighborhoodID
INNER JOIN Neighborhoods ON SubNeighborhoods.NeighborhoodID = Neighborhoods.NeighborhoodID
WHERE 

     Houses.IsActive = 1 
    AND SubNeighborhoods.SubNeighborhoodID = @id;


        ", con);
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    pre field = new pre();
                    field.TotalCurrentMonth = dr["TotalCurrentMonth"].ToString();
                    field.TotalPreviousMonth = dr["TotalPreviousMonth"].ToString();

                    details.Add(field);
                }
            }
            return details.ToArray();
        }



















        [WebMethod]
        public static List<ListItem> getxafad()
        {
            string query = "\r\n   select SubNeighborhoods.SubNeighborhoodID,  CONCAT([NeighborhoodName], ' - ', [SubNeighborhoodName]) AS waxname from Neighborhoods\r\n\r\n    INNER JOIN SubNeighborhoods ON SubNeighborhoods.NeighborhoodID = Neighborhoods.NeighborhoodID";
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    List<ListItem> customers = new List<ListItem>();
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            customers.Add(new ListItem
                            {
                                Value = sdr["SubNeighborhoodID"].ToString(),
                                Text = sdr["waxname"].ToString()
                            });
                        }
                    }
                    con.Close();
                    return customers;
                }
            }
        }





        [WebMethod]
        public static housepay[] datadisplay(string id)
        {
            List<housepay> details = new List<housepay>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  
  

		SELECT 
         Employees.fullname as shaqaale,
    PaymentStatus.HouseID,
    Houses.HouseNumber,
    Houses.fullname,
    Houses.number,
    Neighborhoods.NeighborhoodName,
    SubNeighborhoods.SubNeighborhoodName,
    SUM(PaymentStatus.DueAmount) AS TotalDueAmount,
    SUM(PaymentStatus.paidamount) AS TotalPaidAmount,
    COUNT(PaymentStatus.PaymentStatusID) AS PaymentCount
FROM 
    [waamo_waste].[dbo].[PaymentStatus]
    INNER JOIN Houses ON PaymentStatus.HouseID = Houses.HouseID
    INNER JOIN SubNeighborhoods ON Houses.SubNeighborhoodID = SubNeighborhoods.SubNeighborhoodID
    INNER JOIN Neighborhoods ON SubNeighborhoods.NeighborhoodID = Neighborhoods.NeighborhoodID
	   INNER JOIN EmployeeAssignments ON SubNeighborhoods.SubNeighborhoodID = EmployeeAssignments.SubNeighborhoodID
    INNER JOIN Employees ON EmployeeAssignments.EmployeeID = Employees.EmployeeID
	where SubNeighborhoods.SubNeighborhoodID = @id and 
	Houses.IsActive = 1
GROUP BY 
    PaymentStatus.HouseID,
    Houses.HouseNumber,
    Houses.fullname,
    Houses.number,
    Neighborhoods.NeighborhoodName,
    SubNeighborhoods.SubNeighborhoodName,
    	Employees.fullname
ORDER BY 
    Houses.HouseNumber;

        ", con);
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    housepay field = new housepay();
                    field.NeighborhoodName = dr["NeighborhoodName"].ToString();

                    field.SubNeighborhoodName = dr["SubNeighborhoodName"].ToString();
                    field.HouseID = dr["HouseID"].ToString();
             
                    field.HouseNumber = dr["HouseNumber"].ToString();
                    field.shaqaale = dr["shaqaale"].ToString();
                    field.fullname = dr["fullname"].ToString();
                    field.number = dr["number"].ToString();
                    field.DueAmount = dr["TotalDueAmount"].ToString();
                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }

        [WebMethod]
        public static housepay[] datadisplay2(string id)
        {
            List<housepay> details = new List<housepay>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  
  	SELECT 
    PaymentStatus.HouseID,
    Houses.HouseNumber,
    Houses.fullname,
    Houses.number,
    Neighborhoods.NeighborhoodName,
    SubNeighborhoods.SubNeighborhoodName,
    SUM(PaymentStatus.DueAmount) AS TotalDueAmount,
    SUM(PaymentStatus.paidamount) AS TotalPaidAmount,
    COUNT(PaymentStatus.PaymentStatusID) AS PaymentCount
FROM 
    [waamo_waste].[dbo].[PaymentStatus]
    INNER JOIN Houses ON PaymentStatus.HouseID = Houses.HouseID
    INNER JOIN SubNeighborhoods ON Houses.SubNeighborhoodID = SubNeighborhoods.SubNeighborhoodID
    INNER JOIN Neighborhoods ON SubNeighborhoods.NeighborhoodID = Neighborhoods.NeighborhoodID
	where  ( PaymentStatus.HasPaid = 13 or  (PaymentStatus.HasPaid = 1 and PaymentStatus.DueAmount < 1)) and  
	Houses.IsActive = 1
GROUP BY 
    PaymentStatus.HouseID,
    Houses.HouseNumber,
    Houses.fullname,
    Houses.number,
    Neighborhoods.NeighborhoodName,
    SubNeighborhoods.SubNeighborhoodName
ORDER BY 
    Houses.HouseNumber;

        ", con);
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    housepay field = new housepay();
                    field.NeighborhoodName = dr["NeighborhoodName"].ToString();

                    field.SubNeighborhoodName = dr["SubNeighborhoodName"].ToString();
                    field.HouseID = dr["HouseID"].ToString();

                    field.HouseNumber = dr["HouseNumber"].ToString();

                    field.fullname = dr["fullname"].ToString();
                    field.number = dr["number"].ToString();
                    field.DueAmount = dr["TotalDueAmount"].ToString();
                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }










        [WebMethod]
        public static dis[] displaymoney()
        {
            List<dis> details = new List<dis>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"



	     SELECT 
   
SUM(PaymentStatus.amount) AS TotalAmount,
		
   SUM(PaymentStatus.paidamount) AS TotalDifference,
	    SUM(PaymentStatus.DueAmount) AS TotalDueAmount

    FROM 
        [PaymentStatus]

     INNER JOIN Houses ON PaymentStatus.HouseID = Houses.HouseID
    INNER JOIN SubNeighborhoods ON Houses.SubNeighborhoodID = SubNeighborhoods.SubNeighborhoodID
    INNER JOIN Neighborhoods ON SubNeighborhoods.NeighborhoodID = Neighborhoods.NeighborhoodID

    WHERE 
     
         Houses.IsActive = 1  and 
         PaymentStatus.Month = MONTH(GETDATE())  -- Current month
        AND PaymentStatus.Year = YEAR(GETDATE())  -- Current year



        ", con);


                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    dis field = new dis();
                    field.TotalAmount = dr["TotalAmount"].ToString();
                    field.TotalDueAmount = dr["TotalDueAmount"].ToString();
                    field.TotalDifference = dr["TotalDifference"].ToString();
                    details.Add(field);
                }
            }
            return details.ToArray();
        }








        public class pre2
        {
            public string TotalCurrentMonth;
            public string TotalPreviousMonth;

        }




        [WebMethod]
        public static pre2[] displaymoney2()
        {
            List<pre2> details = new List<pre2>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"




SELECT 
    SUM(CASE 
        WHEN PaymentStatus.Month = MONTH(GETDATE()) AND PaymentStatus.Year = YEAR(GETDATE()) THEN PaymentStatus.paidamount
        ELSE 0
    END) AS TotalCurrentMonth,
    SUM(CASE 
        WHEN PaymentStatus.Month = MONTH(DATEADD(MONTH, -1, GETDATE())) AND PaymentStatus.Year = YEAR(DATEADD(MONTH, -1, GETDATE())) THEN PaymentStatus.paidamount
        ELSE 0
    END) AS TotalPreviousMonth
FROM 
    [PaymentStatus]
INNER JOIN Houses ON PaymentStatus.HouseID = Houses.HouseID
INNER JOIN SubNeighborhoods ON Houses.SubNeighborhoodID = SubNeighborhoods.SubNeighborhoodID
INNER JOIN Neighborhoods ON SubNeighborhoods.NeighborhoodID = Neighborhoods.NeighborhoodID
WHERE 

  Houses.IsActive = 1

        ", con);


                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    pre2 field = new pre2();
                    field.TotalCurrentMonth = dr["TotalCurrentMonth"].ToString();
                    field.TotalPreviousMonth = dr["TotalPreviousMonth"].ToString();
                    details.Add(field);
                }
            }
            return details.ToArray();
        }
























        //    [WebMethod]
        //    public static housepay[] datadisplay6(string status, string paymentMonth, string waxda, string paymentYear)
        //    {
        //        List<housepay> details = new List<housepay>();
        //        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //        // Convert the parameters, using null for optional filters
        //        int? month = string.IsNullOrEmpty(paymentMonth) ? (int?)null : int.Parse(paymentMonth);
        //        int? year = string.IsNullOrEmpty(paymentYear) ? (int?)null : int.Parse(paymentYear);
        //        int? subNeighborhoodID = string.IsNullOrEmpty(waxda) ? (int?)null : int.Parse(waxda);
        //        // Convert `status` to integer (0 or 1), or null if not provided
        //        int? hasPaid = string.IsNullOrEmpty(status) ? (int?)null : int.Parse(status);
        //        using (SqlConnection con = new SqlConnection(cs))
        //        {
        //            con.Open();

        //            // SQL query with dynamic filtering
        //            SqlCommand cmd = new SqlCommand(@"
        //        SELECT 
        //    PaymentStatus.HouseID,
        //    Houses.HouseNumber,
        //    Houses.fullname,
        //    Houses.number,
        //    Neighborhoods.NeighborhoodName,
        //    SubNeighborhoods.SubNeighborhoodName,
        //    PaymentStatus.DueAmount,
        //    PaymentStatus.PaidAmount
        //FROM 
        //    [waamo_waste].[dbo].[PaymentStatus]
        //    INNER JOIN Houses ON PaymentStatus.HouseID = Houses.HouseID
        //    INNER JOIN SubNeighborhoods ON Houses.SubNeighborhoodID = SubNeighborhoods.SubNeighborhoodID
        //    INNER JOIN Neighborhoods ON SubNeighborhoods.NeighborhoodID = Neighborhoods.NeighborhoodID
        //WHERE  
        //    (PaymentStatus.Month = @Month OR @Month IS NULL)
        //    AND (PaymentStatus.Year = @Year OR @Year IS NULL)
        //    AND (SubNeighborhoods.SubNeighborhoodID = @SubNeighborhoodID OR @SubNeighborhoodID IS NULL)
        //    AND (PaymentStatus.HasPaid = @HasPaid OR @HasPaid IS NULL)
        //    AND Houses.IsActive = 1
        //ORDER BY 
        //    Houses.HouseNumber;", con);

        //            // Add parameters and handle nulls
        //            cmd.Parameters.AddWithValue("@month", month ?? (object)DBNull.Value);
        //            cmd.Parameters.AddWithValue("@year", year ?? (object)DBNull.Value);
        //            cmd.Parameters.AddWithValue("@waxda", subNeighborhoodID ?? (object)DBNull.Value);
        //            cmd.Parameters.AddWithValue("@status", (object)hasPaid ?? DBNull.Value);

        //            SqlDataReader dr = cmd.ExecuteReader();

        //            // Populate the result list
        //            while (dr.Read())
        //            {
        //                housepay field = new housepay
        //                {
        //                    NeighborhoodName = dr["NeighborhoodName"].ToString(),
        //                    SubNeighborhoodName = dr["SubNeighborhoodName"].ToString(),
        //                    HouseID = dr["HouseID"].ToString(),
        //                    HouseNumber = dr["HouseNumber"].ToString(),
        //                    fullname = dr["fullname"].ToString(),
        //                    number = dr["number"].ToString(),
        //                    DueAmount = dr["DueAmount"].ToString(),
        //                    //PaidAmount = dr["PaidAmount"].ToString()
        //                };
        //                details.Add(field);
        //            }
        //        }
        //        return details.ToArray();
        //    }









        [WebMethod]
        public static housepay[] datadisplay6(string status, string paymentMonth, string waxda, string paymentYear)
        {
            List<housepay> details = new List<housepay>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                // Convert the parameters, using null for optional filters
                int? month = string.IsNullOrEmpty(paymentMonth) ? (int?)null : int.Parse(paymentMonth);
                int? year = string.IsNullOrEmpty(paymentYear) ? (int?)null : int.Parse(paymentYear);
                int? subNeighborhoodID = string.IsNullOrEmpty(waxda) ? (int?)null : int.Parse(waxda);
                int? hasPaid = string.IsNullOrEmpty(status) ? (int?)null : int.Parse(status);

                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // SQL query with dynamic filtering
                    SqlCommand cmd = new SqlCommand(@"
                SELECT 
	             Employees.fullname as shaqaale,
                    PaymentStatus.HouseID,
                    Houses.HouseNumber,
                    Houses.fullname,
                    Houses.number,
                    Neighborhoods.NeighborhoodName,
                    SubNeighborhoods.SubNeighborhoodName,
                    PaymentStatus.DueAmount,
                    PaymentStatus.PaidAmount
                FROM 
                    [waamo_waste].[dbo].[PaymentStatus]
                    INNER JOIN Houses ON PaymentStatus.HouseID = Houses.HouseID
                    INNER JOIN SubNeighborhoods ON Houses.SubNeighborhoodID = SubNeighborhoods.SubNeighborhoodID
                    INNER JOIN Neighborhoods ON SubNeighborhoods.NeighborhoodID = Neighborhoods.NeighborhoodID
	   INNER JOIN EmployeeAssignments ON SubNeighborhoods.SubNeighborhoodID = EmployeeAssignments.SubNeighborhoodID
    INNER JOIN Employees ON EmployeeAssignments.EmployeeID = Employees.EmployeeID
                WHERE  
                    (PaymentStatus.Month = @Month OR @Month IS NULL)
                    AND (PaymentStatus.Year = @Year OR @Year IS NULL)
                    AND (SubNeighborhoods.SubNeighborhoodID = @SubNeighborhoodID OR @SubNeighborhoodID IS NULL)
                    AND (PaymentStatus.HasPaid = @HasPaid OR @HasPaid IS NULL)
                    AND Houses.IsActive = 1
                ORDER BY 
                    Houses.HouseNumber;", con);

                    // Add parameters and handle nulls
                    cmd.Parameters.AddWithValue("@Month", month ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@Year", year ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@SubNeighborhoodID", subNeighborhoodID ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@HasPaid", hasPaid ?? (object)DBNull.Value);

                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            housepay hp = new housepay
                            {
                                HouseNumber = rdr["HouseNumber"].ToString(),
                                fullname = rdr["fullname"].ToString(),
                                number = rdr["number"].ToString(),
                                NeighborhoodName = rdr["NeighborhoodName"].ToString(),
                                SubNeighborhoodName = rdr["SubNeighborhoodName"].ToString(),
                                DueAmount = rdr["DueAmount"].ToString(),
                                shaqaale = rdr["shaqaale"].ToString(),
                            };
                            details.Add(hp);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the error for debugging
                System.Diagnostics.Debug.WriteLine("Error in datadisplay6: " + ex.Message);
                // Optional: Log to a file, database, or error monitoring tool
                throw new Exception("An error occurred while fetching data. Please try again later.", ex);
            }

            return details.ToArray();
        }









    }
}