using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace CKEditor5_SyntaxHighlight
{
    public partial class Default : System.Web.UI.Page
    {
        string text
        {
            get
            {
                return Session["text"] + "";
            }
            set
            {
                Session["text"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (text.Length == 0)
                {
                    text = GetDefaultText();
                }

                txtEditor.Text = text;
            }
        }

        string GetDefaultText()
        {
            string defaultFile = Server.MapPath("~/default.txt");
            return File.ReadAllText(defaultFile);
        }

        protected void btSave_Click(object sender, EventArgs e)
        {
            text = txtEditor.Text;
        }

        protected void btLoadDefault_Click(object sender, EventArgs e)
        {
            text = GetDefaultText();
            txtEditor.Text = text;
        }
    }
}