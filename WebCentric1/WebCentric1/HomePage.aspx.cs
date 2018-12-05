using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebCentric1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

            Response.Write("Hi"+" "+Session["user"]);
            

        }

     
     

     protected void TextBox1_TextChanged(object sender, EventArgs e)
        {


        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void validate(object sender, EventArgs e)
        {
             //form1.Attributes.Add("onsubmit", "return validate();");
            string booker = (string)Session["user"];
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
                con.Open();
                string query = "INSERT INTO Flight_details (booker,arrival,depature,depaturedate,arrivaldate) VALUES (@booker,@arrival,@depature,@arrivaldate,@depaturedate)";
                SqlCommand cmd = new SqlCommand(query, con);
                //cmd.Parameters.AddWithValue("@Id", identifier);
                cmd.Parameters.AddWithValue("@booker", booker);
                cmd.Parameters.AddWithValue("@arrival", arrivaldrop.Text);
            Session["depture"] = arrivaldrop.Text;
                cmd.Parameters.AddWithValue("@depature", arrivaldrop1.Text);
            Session["arrival"] = arrivaldrop1.Text;
            cmd.Parameters.AddWithValue("@arrivaldate", Convert.ToDateTime(datepicker.Text));
            Session["arrivaldate"] = datepicker.Text;
            cmd.Parameters.AddWithValue("@depaturedate", Convert.ToDateTime(arrivalpicker.Text));
            Session["depaturedate"] = arrivalpicker.Text;
            /*if (.Checked)
                cmd.Parameters.AddWithValue("@gender", "Male");
            else
                cmd.Parameters.AddWithValue("@gender", "Female");*/
            cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Sucess.aspx");
            
        }

        protected void arrivaldrop_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void arrivalpicker_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        /* protected void datepicker_TextChanged(object sender, EventArgs e)
         {
             depature.Attributes.Add("oninput","validate1();")


         }*/
    }
}