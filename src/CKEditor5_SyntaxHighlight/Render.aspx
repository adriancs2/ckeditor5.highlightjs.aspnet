<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Render.aspx.cs" Inherits="CKEditor5_SyntaxHighlight.Render" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="head" runat="server">
    <title></title>
    <style type="text/css">
        body {
            font-family: Arial;
            font-size: 10pt;
            padding: 0;
            margin: 0;
            padding-top: 45px;
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

        img {
            max-width: 600px;
        }
    </style>

    <style id="style1" type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Roboto+Mono&display=swap');

        pre, code {
            font-family: "Roboto Mono", monospace;
            font-size: 9pt;
            line-height: 140%;
        }
    </style>

    <link href="/highlight.js/styles/vs2015.min.css" rel="stylesheet" id="link_hljs" />

    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

    <%-- Styling the "Copy: Button Box --%>

    <style>
        
        /* The "copy" box container */
        .code-badge {
            background: #555 !important;
            padding: 8px !important;
            opacity: 0.5 !important;
            transition: opacity linear 0.5s !important;
        }

        /* The "copy" button */
        .code-badge-copy-icon {
            font-size: 1.3em !important;
        }

        /* The "copy" button, after clicked */
        .text-success {
            color: #b6ff00;
        }

        /* The text in the container */
        .code-badge-language {
            margin-right: 10px;
            font-weight: 700 !important;
            color: #ffafaf !important;
            transition: color linear 0.5s !important;
        }

        /* The "copy" box container, at mouse hover */
        .code-badge:hover {
            opacity: 1 !important;
            background: #4f4f4f !important;
        }

        /* The text in the container, at mouse hover */
        .code-badge:hover .code-badge-language {
            color: #ff4343 !important;
        }

    </style>

</head>
<body>

    <form id="form1" runat="server">

        <input type="submit" disabled="disabled" style="display: none;" aria-hidden="true" />

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

        Font:

        <select id="dropFont" onchange="updateFont();">
            <option value="Roboto+Mono">Roboto Mono</option>
            <option value="Consolas">Consolas</option>
            <option value="Cascadia Mono">Cascadia Mono</option>
            <option value="Inconsolata">Inconsolata</option>
            <option value="Source+Code+Pro">Source Code Pro</option>
            <option value="IBM+Plex+Mono">IBM Plex Mono</option>
            <option value="Space+Mono">Space Mono</option>
            <option value="PT+Mono">PT Mono</option>
            <option value="Ubuntu+Mono">Ubuntu Mono</option>
            <option value="Nanum+Gothic+Coding">Nanum Gothic Coding</option>
            <option value="Cousine">Cousine</option>
            <option value="Fira+Mono">Fira Mono</option>
            <option value="Share+Tech+Mono">Share Tech Mono</option>
            <option value="Courier+Prime">Courier Prime</option>
            <option value="Fira+Code">Fira Code</option>
            <option value="Anonymous+Pro">Anonymous Pro</option>
            <option value="Cutive+Mono">Cutive Mono</option>
            <option value="VT323">VT323</option>
            <option value="JetBrains+Mono">JetBrains Mono</option>
            <option value="DM+Mono">DM Mono</option>
            <option value="Overpass+Mono">Overpass Mono</option>
            <option value="Noto+Sans+Mono">Noto Sans Mono</option>
            <option value="Oxygen+Mono">Oxygen Mono</option>
            <option value="Nova+Mono">Nova Mono</option>
            <option value="Azeret+Mono">Azeret Mono</option>
            <option value="B612+Mono">B612 Mono</option>
            <option value="Syne+Mono">Syne Mono</option>
            <option value="Major+Mono+Display">Major Mono Display</option>
            <option value="Xanh+Mono">Xanh Mono</option>
            <option value="Red+Hat+Mono">Red Hat Mono</option>
            <option value="Fragment+Mono">Fragment Mono</option>
            <option value="Spline+Sans+Mono">Spline Sans Mono</option>
            <option value="Chivo+Mono">Chivo Mono</option>
            <option value="Martian+Mono">Martian Mono</option>

        </select>

        <div style="height: 5px"></div>

        Font Size:
        <input id="inputFontSize" type="number" style="width: 50px" value="9" step=".1" oninput="updateFont();" />
        pt 

        <span style="display: inline-block; width: 30px;"></span>

        Line Height:
        <input id="inputLineHeight" type="text" style="width: 80px" value="140%" oninput="updateFont();" />
    </form>

    <div class="content">
        <asp:PlaceHolder ID="ph1" runat="server"></asp:PlaceHolder>
    </div>

    <script>
        function updateThemeStyle() {

            let cssfile = document.getElementById("dropStyle").value;
            let newurl = `/highlight.js/styles/${cssfile}`;

            let link_hljs = document.getElementById("link_hljs");
            link_hljs.href = newurl;
        }

        function updateFont() {
            try {
                let newFont = document.getElementById("dropFont").value;
                let newFontSize = document.getElementById("inputFontSize").value;
                let newLineHeight = document.getElementById("inputLineHeight").value;

                let style = document.getElementById("style1");

                let newFontFamily = newFont.replaceAll("+", " ");
                let newStyle = `
@import url('https://fonts.googleapis.com/css2?family=${newFont}&display=swap');
pre, code {
    font-family: "${newFontFamily}", monospace;
    font-size: ${newFontSize}pt;
    line-height: ${newLineHeight};
}`;

                style.textContent = newStyle;

            }
            catch (err) {
                alert(err);
            }
        }
    </script>

    <script src="/highlight.js/highlight.min.js"></script>
    <script>hljs.highlightAll();</script>

    <%-- Add on plugin to display language type and "copy" button --%>
    <script src="/highlight.js/highlightjs-badge.min.js"></script>

    <script>
        
        // wait for the page to fully loaded
        window.onload = new function () {

            // set a timer to delay the execution
            // for waiting highlight.js to complete
            setTimeout(function () {
                window.highlightJsBadge();
            }, 100);
        }
        
    </script>

</body>
</html>
