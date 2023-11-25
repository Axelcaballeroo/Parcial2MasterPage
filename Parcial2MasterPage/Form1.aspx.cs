using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial2MasterPage
{
    public partial class Form1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["nombreCompleto"] != null)
            {
                Label1.Text = Session["nombreCompleto"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            HttpCookie cookie1 = new HttpCookie("nombreCompleto", $"{TextBox1.Text},{TextBox2.Text}");


            this.Session["nombreCompleto"] = $"{TextBox1.Text},{TextBox2.Text}";
            Response.Redirect(Request.RawUrl);
        }
    }
}