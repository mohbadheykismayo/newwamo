using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace waamowaste
{
    public partial class userreport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }




        public class housepay
        {
            public string NeighborhoodName;
            public string SubNeighborhoodName;
            public string HouseID;
            public string HouseNumber;
            public string IsActive;
            public string fullname;
            public string number;

            public string PaymentStatusID;
            public string amount;
            public string DueAmount;
            public string shaqaale;
        }

        [WebMethod]
        public static housepay[] datadisplay(string id , string id1)
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
					    INNER JOIN Users ON Employees.UserID = Users.UserID
						where Users.UserID = @id and PaymentStatus.HasPaid = @id1
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
                cmd.Parameters.AddWithValue("@id1", id1);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    housepay field = new housepay();
                    field.NeighborhoodName = dr["NeighborhoodName"].ToString();

                    field.SubNeighborhoodName = dr["SubNeighborhoodName"].ToString();
                    field.HouseID = dr["HouseID"].ToString();


                    field.shaqaale = dr["shaqaale"].ToString();

                    field.HouseNumber = dr["HouseNumber"].ToString();

                    field.fullname = dr["fullname"].ToString();
                    field.number = dr["number"].ToString();
                    field.DueAmount = dr["TotalDueAmount"].ToString();
                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }


    }
}