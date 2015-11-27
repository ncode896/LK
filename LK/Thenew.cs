using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LK
{
    public class Thenew
    {
        private string Text;
        private DateTime dt;

        public Thenew()
        {
            Text = "";
        }
        public void SetText(string str)
        {
            this.Text=str;
        }
        public void SetDate(DateTime dt1)
        {
            this.dt = dt1;
        }

       /* <div class="panel panel-default">
	        <div class="panel-heading">Panel heading</div>
	        <div class="panel-body">
		        Panel content
	            </div>
            </div>
        */
        public string GenerateHtml(int i)
        {
            return string.Format("<div class=\"panel panel-info\"> <div class=\"panel-heading\">{0} Date: {1} <br/></div> <div class=\"panel-body\">  {2}<br/><br/></div></div>", i, this.dt,this.Text);
        }

        public void OutNew(System.Web.UI.WebControls.Panel p1, int i)
        {
            Label lb = new Label();
            lb.Text = this.GenerateHtml(i);
            p1.Controls.Add(lb);
        }
    }
}