using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace LK
{
    public partial class discussion : System.Web.UI.Page
    {
        int n_ls;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Count!=0)
            {
                n_ls = int.Parse(Request.QueryString["n_ls"]);
            }
            else Response.Redirect("index.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Trim() != "")
            {
                SqlConnection cnn = new SqlConnection();
                cnn.ConnectionString = "Data Source=IDEA-PC\\sqlexpress;Initial Catalog=AspNet_LK;Integrated Security=True";
                try
                {
                    cnn.Open();
                }
                catch (Exception ex)
                {
                    Label1.Text = ex.Message;
                }
                if (cnn.State.ToString() == "Open") Label1.Text = "Соединение открыто";

                SqlCommand comm = new SqlCommand();
                comm.CommandType = System.Data.CommandType.Text;
                comm.CommandText = "INSERT INTO Discussion ([Message],[n_ls]) VALUES ('"+  TextBox1.Text.Trim() +"'," + n_ls.ToString() +  ")";
                comm.Connection = cnn;
                comm.ExecuteNonQuery();
                comm.Cancel();
                cnn.Close();

                GridView1.DataBind();
            }
            TextBox1.Text = "";
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("cabinet.aspx?str="+n_ls.ToString()+"&pass="+ Request.QueryString["pass"]);
            //Response.Redirect(String.Format("RegComplete.aspx?login={0}&pass={1}&email={2}", user, pass, email));
        }

        
    }
}