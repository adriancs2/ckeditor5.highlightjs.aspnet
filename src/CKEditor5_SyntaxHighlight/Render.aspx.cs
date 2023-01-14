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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //string styleFolder = Server.MapPath("~/highlight.js/styles");
                //string[] styles = Directory.GetFiles(styleFolder);

                //foreach (var style in styles)
                //{
                //    string filename = Path.GetFileName(style);
                //    dropStyle.Items.Add(new ListItem(filename));
                //}

                //try
                //{
                //    dropStyle.SelectedValue = "vs2015.min.css";
                //}
                //catch { }

                LoadText();
            }
        }

        void LoadText()
        {
            //string style = dropStyle.SelectedValue;

            //string cssThemeFile = $@"<link rel='stylesheet' href='/highlight.js/styles/{style}' >";

            //phStyle.Controls.Add(new LiteralControl(cssThemeFile));

            string filePath = Server.MapPath("~/file.txt");

            if (File.Exists(filePath))
            {
                string html = File.ReadAllText(filePath);

                ph1.Controls.Add(new LiteralControl(html));
            }
        }

        protected void btRefresh_Click(object sender, EventArgs e)
        {
            LoadText();
        }

        protected void dropStyle_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadText();
        }
    }
}