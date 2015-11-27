using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LK
{
    public partial class statistics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           // NewsSource.InsertParameters.Add();
           // NewsSource.Insert();
            if (TextBox1.Text.Trim() != "")
            {
                for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                {
                    if (CheckBoxList1.Items[i].Selected)
                    {
                        // NewsSource.InsertParameters.Clear();
                        // NewsSource.InsertParameters.Add("@News", System.Data.DbType.String, TextBox1.Text);
                        // NewsSource.InsertParameters.Add("@n_ls", System.Data.DbType.Int32, CheckBoxList1.Items[i].Value);
                        NewsSource.InsertParameters["News"].DefaultValue = TextBox1.Text.Trim();
                        NewsSource.InsertParameters["n_ls"].DefaultValue = CheckBoxList1.Items[i].Value;
                        NewsSource.Insert();
                    }
                }
                TextBox1.Text = "";
            }
        }
    }
}