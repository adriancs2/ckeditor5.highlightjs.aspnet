using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace CKEditor5_SyntaxHighlight
{
    public partial class Render : System.Web.UI.Page
    {
        string text
        {
            get
            {
                string t = Session["text"] + "";
                if (t.Length == 0)
                {
                    t = File.ReadAllText(Server.MapPath("~/default.txt"));
                    Session["text"] = t;
                }
                return t;
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
                LoadText();
            }
        }

        void LoadText()
        {
            ph1.Controls.Add(new LiteralControl(text));
        }

        protected void btRefresh_Click(object sender, EventArgs e)
        {
            LoadText();
        }
    }
}