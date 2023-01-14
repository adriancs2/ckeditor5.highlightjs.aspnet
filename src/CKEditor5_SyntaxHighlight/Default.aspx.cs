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
        string filePath
        {
            get
            {
                return Server.MapPath("~/file.txt");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtEditor.Text = File.ReadAllText(filePath);
                LoadText();
            }
        }

        void LoadText()
        {
            string iframe = $"<iframe class='framerender' src='Render.aspx'></iframe>";
            ph1.Controls.Add(new LiteralControl(iframe));
        }

        protected void btSave_Click(object sender, EventArgs e)
        {
            File.WriteAllText(filePath, txtEditor.Text);
            LoadText();
        }

        protected void btLoadDefault_Click(object sender, EventArgs e)
        {
            string defaultFile = Server.MapPath("~/default.txt");

            if (File.Exists(filePath))
            {
                File.Delete(filePath);
            }

            File.Copy(defaultFile, filePath);

            txtEditor.Text = File.ReadAllText(filePath);
            LoadText();
        }
    }
}