using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

namespace LK
{
    public partial class cabinet : System.Web.UI.Page
    {
        public int n_ls;
        public string fio = "";
        public string pwdFromBD = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            //string strcon = "";
            //strcon += Request.QueryString["str"];
            string nnls = Request.QueryString["str"];
            string pwd = Request.QueryString["pass"];

            if (nnls == "admin") {
                Response.Redirect("admin.aspx");
            }
            else
            {
                if (Request.QueryString.Count==0)
                {
                    n_ls = 1;
                    pwd = "12345";
                }
            else n_ls = int.Parse(nnls);
            }
            
           /* if (strcon.Length != 0)
            {
                string[] sall = strcon.Split(';');
                nnls = sall[0];
                pwd = sall[1];

                Label2.Text = nnls;
                n_ls = int.Parse(nnls);
            }
            else
            {
                n_ls = 1;
                pwd = "12345";
            }*/
            
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
            comm.CommandText = "select * from NewsTable where n_ls=" + n_ls.ToString() + " order by dateofnew desc";
            comm.Connection = cnn;

            SqlCommand getFIO = new SqlCommand();
            getFIO.CommandType = System.Data.CommandType.Text;
            getFIO.CommandText = "select fio, password from sotrudniki where n_ls=" + n_ls.ToString();
            getFIO.Connection = cnn;
            SqlDataReader fc = getFIO.ExecuteReader();
            fc.Read();
            fio = fc["fio"].ToString();
            pwdFromBD = fc["password"].ToString().TrimEnd();
            fc.Close();

            //проверка правильности пароля
           if(pwd!=pwdFromBD)
           {
               Response.Redirect("index.aspx?code=0");
           }

           fio_hello.Text = "Приветствуем Вас," + fio + "!";// +pwdFromBD.Replace(' ', '_');

            SqlDataReader cursor = comm.ExecuteReader();
            int i = 1;
            
            while (cursor.Read())
            {
                Thenew curr_new = new Thenew();
                curr_new.SetText(cursor["News"].ToString());
                curr_new.SetDate((DateTime)cursor["dateofnew"]);
                curr_new.OutNew(Panel1,i++);
            }
           
            cursor.Close();
            cnn.Close();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx?code=1");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("discussion.aspx?n_ls="+n_ls.ToString()+"&pass="+pwdFromBD); 
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            
        }
    }
}