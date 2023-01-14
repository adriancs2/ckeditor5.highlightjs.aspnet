<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Render.aspx.cs" Inherits="CKEditor5_SyntaxHighlight.Render" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="head" runat="server">
    <title></title>
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Roboto+Mono&display=swap');

        body {
            font-family: Arial;
            font-size: 10pt;
            padding: 0;
            margin: 0;
            padding-top: 25px;
        }

        form {
            position: fixed;
            background: #dedede;
            top: 0;
            padding: 7px;
            width: 100%;
        }

        .content {
            padding: 10px;
        }

        pre, code {
            font-family: "Roboto Mono", Consolas, "Cascadia Mono", Courier New, Courier, monospace;
            font-size: 9pt;
            line-height: 140%;
        }

        img {
            max-width: 600px;
        }
    </style>

    <link href="/highlight.js/styles/vs2015.min.css" rel="stylesheet" ishljs="1" />

</head>
<body>

    <form id="form1" runat="server">

        <asp:Button ID="btRefresh" runat="server" Text="Refresh" OnClick="btRefresh_Click" />

        Style:
            
        <select id="dropStyle" onchange="updateThemeStyle();">
            <option value="a11y-dark.min.css">a11y-dark.min.css</option>
            <option value="a11y-light.min.css">a11y-light.min.css</option>
            <option value="agate.min.css">agate.min.css</option>
            <option value="an-old-hope.min.css">an-old-hope.min.css</option>
            <option value="androidstudio.min.css">androidstudio.min.css</option>
            <option value="arduino-light.min.css">arduino-light.min.css</option>
            <option value="arta.min.css">arta.min.css</option>
            <option value="ascetic.min.css">ascetic.min.css</option>
            <option value="atom-one-dark-reasonable.min.css">atom-one-dark-reasonable.min.css</option>
            <option value="atom-one-dark.min.css">atom-one-dark.min.css</option>
            <option value="atom-one-light.min.css">atom-one-light.min.css</option>
            <option value="brown-paper.min.css">brown-paper.min.css</option>
            <option value="brown-papersq.png">brown-papersq.png</option>
            <option value="codepen-embed.min.css">codepen-embed.min.css</option>
            <option value="color-brewer.min.css">color-brewer.min.css</option>
            <option value="dark.min.css">dark.min.css</option>
            <option value="default.min.css">default.min.css</option>
            <option value="devibeans.min.css">devibeans.min.css</option>
            <option value="docco.min.css">docco.min.css</option>
            <option value="far.min.css">far.min.css</option>
            <option value="felipec.min.css">felipec.min.css</option>
            <option value="foundation.min.css">foundation.min.css</option>
            <option value="github-dark-dimmed.min.css">github-dark-dimmed.min.css</option>
            <option value="github-dark.min.css">github-dark.min.css</option>
            <option value="github.min.css">github.min.css</option>
            <option value="gml.min.css">gml.min.css</option>
            <option value="googlecode.min.css">googlecode.min.css</option>
            <option value="gradient-dark.min.css">gradient-dark.min.css</option>
            <option value="gradient-light.min.css">gradient-light.min.css</option>
            <option value="grayscale.min.css">grayscale.min.css</option>
            <option value="hybrid.min.css">hybrid.min.css</option>
            <option value="idea.min.css">idea.min.css</option>
            <option value="intellij-light.min.css">intellij-light.min.css</option>
            <option value="ir-black.min.css">ir-black.min.css</option>
            <option value="isbl-editor-dark.min.css">isbl-editor-dark.min.css</option>
            <option value="isbl-editor-light.min.css">isbl-editor-light.min.css</option>
            <option value="kimbie-dark.min.css">kimbie-dark.min.css</option>
            <option value="kimbie-light.min.css">kimbie-light.min.css</option>
            <option value="lightfair.min.css">lightfair.min.css</option>
            <option value="lioshi.min.css">lioshi.min.css</option>
            <option value="magula.min.css">magula.min.css</option>
            <option value="mono-blue.min.css">mono-blue.min.css</option>
            <option value="monokai-sublime.min.css">monokai-sublime.min.css</option>
            <option value="monokai.min.css">monokai.min.css</option>
            <option value="night-owl.min.css">night-owl.min.css</option>
            <option value="nnfx-dark.min.css">nnfx-dark.min.css</option>
            <option value="nnfx-light.min.css">nnfx-light.min.css</option>
            <option value="nord.min.css">nord.min.css</option>
            <option value="obsidian.min.css">obsidian.min.css</option>
            <option value="panda-syntax-dark.min.css">panda-syntax-dark.min.css</option>
            <option value="panda-syntax-light.min.css">panda-syntax-light.min.css</option>
            <option value="paraiso-dark.min.css">paraiso-dark.min.css</option>
            <option value="paraiso-light.min.css">paraiso-light.min.css</option>
            <option value="pojoaque.jpg">pojoaque.jpg</option>
            <option value="pojoaque.min.css">pojoaque.min.css</option>
            <option value="purebasic.min.css">purebasic.min.css</option>
            <option value="qtcreator-dark.min.css">qtcreator-dark.min.css</option>
            <option value="qtcreator-light.min.css">qtcreator-light.min.css</option>
            <option value="rainbow.min.css">rainbow.min.css</option>
            <option value="routeros.min.css">routeros.min.css</option>
            <option value="school-book.min.css">school-book.min.css</option>
            <option value="shades-of-purple.min.css">shades-of-purple.min.css</option>
            <option value="srcery.min.css">srcery.min.css</option>
            <option value="stackoverflow-dark.min.css">stackoverflow-dark.min.css</option>
            <option value="stackoverflow-light.min.css">stackoverflow-light.min.css</option>
            <option value="sunburst.min.css">sunburst.min.css</option>
            <option value="tokyo-night-dark.min.css">tokyo-night-dark.min.css</option>
            <option value="tokyo-night-light.min.css">tokyo-night-light.min.css</option>
            <option value="tomorrow-night-blue.min.css">tomorrow-night-blue.min.css</option>
            <option value="tomorrow-night-bright.min.css">tomorrow-night-bright.min.css</option>
            <option value="vs.min.css">vs.min.css</option>
            <option selected="selected" value="vs2015.min.css">vs2015.min.css</option>
            <option value="xcode.min.css">xcode.min.css</option>
            <option value="xt256.min.css">xt256.min.css</option>
        </select>

    </form>

    <div class="content">
        <asp:PlaceHolder ID="ph1" runat="server"></asp:PlaceHolder>
    </div>

    <script>
        function updateThemeStyle() {

            let cssfile = document.getElementById("dropStyle").value;
            let newurl = `/highlight.js/styles/${cssfile}`;

            let head = document.getElementById("head");

            let oldLinks = head.getElementsByTagName("link");

            for (let i = 0; i < oldLinks.length; i++) {
                if (oldLinks[i].hasAttribute("ishljs")) {
                    oldLinks[i].remove();
                }
            }

            let newlink = document.createElement("link");
            newlink.href = newurl;
            newlink.rel = "stylesheet";
            newlink.setAttribute("ishljs", "1");

            head.appendChild(newlink);
        }
    </script>

    <script src="/highlight.js/highlight.min.js"></script>
    <script>hljs.highlightAll();</script>

</body>
</html>
