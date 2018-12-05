using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{

    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
           

           SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            con.Open();
            /*string query = "insert into UserName values()";
            SqlCommand cmd = new SqlCommand(query, con);
           
            if (Male.Checked == true)
                cmd.Parameters.AddWithValue("@Gender", "Male");
            else
                cmd.Parameters.AddWithValue("@Gender", "Female");*/
            string query = "INSERT INTO UserName (User_Name,password,Email,Gender) VALUES (@username,@password,@email,@gender)";
            SqlCommand cmd = new SqlCommand(query, con);
            //cmd.Parameters.AddWithValue("@Id", identifier);
            cmd.Parameters.AddWithValue("@username", user_name.Text);
            
            cmd.Parameters.AddWithValue("@password", password.Text);
            cmd.Parameters.AddWithValue("@email", Email.Text);
            if (Male.Checked)
                cmd.Parameters.AddWithValue("@gender", "Male");
            else
                cmd.Parameters.AddWithValue("@gender", "Female");
            //string output = cmd.ExecuteScalar().ToString();
         cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("WebForm1.aspx");
        }

        protected void Female_CheckedChanged(object sender, EventArgs e)
        {

        }

        
    }
}