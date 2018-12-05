using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebCentric1
{

    public partial class Sucess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
          
          string booker1 = (string)Session["user"];
            Response.Write(booker1);
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            con.Open();
            string query = "select booker,arrival,depature,depaturedate,arrivaldate from Flight_details where booker='" + booker1 + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
            GridView1.DataBind();
        }

      
        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("WebForm1.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Modification.aspx");
            

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            con.Open();
            string query = "delete from Flight_details where booker=@booker";
            SqlCommand cmd = new SqlCommand(query, con);
            //string booker = (string)Session["user"];
            string booker = "kar";
            cmd.Parameters.AddWithValue("@booker", booker);
            cmd.ExecuteNonQuery();
            con.Close();
            string booker1 = (string)Session["user"];
           
          SqlConnection con1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            con1.Open();
            string query1 = "select booker,arrival,depature,depaturedate,arrivaldate from Flight_details where booker='" + booker1 + "'";
            SqlCommand cmd1 = new SqlCommand(query1, con1);
            cmd1.ExecuteNonQuery();
            con1.Close();
            Response.Redirect("Sucess.aspx");
            GridView1.DataBind();
        }
    }
}