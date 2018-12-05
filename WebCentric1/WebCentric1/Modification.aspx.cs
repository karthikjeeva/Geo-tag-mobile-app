using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebCentric1
{
    public partial class Modification : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            con.Open();
            string query = "update Flight_details set arrivaldate=@arrival,depaturedate=@depature where booker=@booker";
            SqlCommand cmd = new SqlCommand(query, con);
            //string booker = (string)Session["user"];
            string booker = "kar";
            cmd.Parameters.AddWithValue("@booker", booker);
            cmd.Parameters.AddWithValue("@arrival", depatureDate.Text);
            cmd.Parameters.AddWithValue("@depature", arrivalDate.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            SqlConnection con1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            con1.Open();
            string booker1 = "kar";
            string query1 = "select booker,arrival,depature,depaturedate,arrivaldate from Flight_details where booker='" + booker1 + "'";
            SqlCommand cmd1 = new SqlCommand(query1, con1);
            cmd1.ExecuteNonQuery();
            con1.Close();
          
            Response.Redirect("Sucess.aspx");

           
        }
    }
}