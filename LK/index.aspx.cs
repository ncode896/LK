using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace LK
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strcon = "";
            strcon += Request.QueryString["code"];
            if (strcon != "") 
            {
                if (int.Parse(strcon) == 0) Label1.Visible = true;
                else Label1.Visible = false;
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("cabinet.aspx?str="+TextBox1.Text+"&pass="+TextBox2.Text);
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}