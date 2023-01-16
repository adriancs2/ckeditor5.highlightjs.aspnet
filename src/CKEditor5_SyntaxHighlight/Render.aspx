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
            z-index: 2;
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
            <option value="3024.min.css">3024.min.css</option>
            <option value="a11y-dark.min.css">a11y-dark.min.css</option>
            <option value="a11y-light.min.css">a11y-light.min.css</option>
            <option value="agate.min.css">agate.min.css</option>
            <option value="an-old-hope.min.css">an-old-hope.min.css</option>
            <option value="androidstudio.min.css">androidstudio.min.css</option>
            <option value="apathy.min.css">apathy.min.css</option>
            <option value="apprentice.min.css">apprentice.min.css</option>
            <option value="arduino-light.min.css">arduino-light.min.css</option>
            <option value="arta.min.css">arta.min.css</option>
            <option value="ascetic.min.css">ascetic.min.css</option>
            <option value="ashes.min.css">ashes.min.css</option>
            <option value="atelier-cave-light.min.css">atelier-cave-light.min.css</option>
            <option value="atelier-cave.min.css">atelier-cave.min.css</option>
            <option value="atelier-dune-light.min.css">atelier-dune-light.min.css</option>
            <option value="atelier-dune.min.css">atelier-dune.min.css</option>
            <option value="atelier-estuary-light.min.css">atelier-estuary-light.min.css</option>
            <option value="atelier-estuary.min.css">atelier-estuary.min.css</option>
            <option value="atelier-forest-light.min.css">atelier-forest-light.min.css</option>
            <option value="atelier-forest.min.css">atelier-forest.min.css</option>
            <option value="atelier-heath-light.min.css">atelier-heath-light.min.css</option>
            <option value="atelier-heath.min.css">atelier-heath.min.css</option>
            <option value="atelier-lakeside-light.min.css">atelier-lakeside-light.min.css</option>
            <option value="atelier-lakeside.min.css">atelier-lakeside.min.css</option>
            <option value="atelier-plateau-light.min.css">atelier-plateau-light.min.css</option>
            <option value="atelier-plateau.min.css">atelier-plateau.min.css</option>
            <option value="atelier-savanna-light.min.css">atelier-savanna-light.min.css</option>
            <option value="atelier-savanna.min.css">atelier-savanna.min.css</option>
            <option value="atelier-seaside-light.min.css">atelier-seaside-light.min.css</option>
            <option value="atelier-seaside.min.css">atelier-seaside.min.css</option>
            <option value="atelier-sulphurpool-light.min.css">atelier-sulphurpool-light.min.css</option>
            <option value="atelier-sulphurpool.min.css">atelier-sulphurpool.min.css</option>
            <option value="atlas.min.css">atlas.min.css</option>
            <option value="atom-one-dark-reasonable.min.css">atom-one-dark-reasonable.min.css</option>
            <option value="atom-one-dark.min.css">atom-one-dark.min.css</option>
            <option value="atom-one-light.min.css">atom-one-light.min.css</option>
            <option value="bespin.min.css">bespin.min.css</option>
            <option value="black-metal-bathory.min.css">black-metal-bathory.min.css</option>
            <option value="black-metal-burzum.min.css">black-metal-burzum.min.css</option>
            <option value="black-metal-dark-funeral.min.css">black-metal-dark-funeral.min.css</option>
            <option value="black-metal-gorgoroth.min.css">black-metal-gorgoroth.min.css</option>
            <option value="black-metal-immortal.min.css">black-metal-immortal.min.css</option>
            <option value="black-metal-khold.min.css">black-metal-khold.min.css</option>
            <option value="black-metal-marduk.min.css">black-metal-marduk.min.css</option>
            <option value="black-metal-mayhem.min.css">black-metal-mayhem.min.css</option>
            <option value="black-metal-nile.min.css">black-metal-nile.min.css</option>
            <option value="black-metal-venom.min.css">black-metal-venom.min.css</option>
            <option value="black-metal.min.css">black-metal.min.css</option>
            <option value="brewer.min.css">brewer.min.css</option>
            <option value="bright.min.css">bright.min.css</option>
            <option value="brogrammer.min.css">brogrammer.min.css</option>
            <option value="brown-paper.min.css">brown-paper.min.css</option>
            <option value="brush-trees-dark.min.css">brush-trees-dark.min.css</option>
            <option value="brush-trees.min.css">brush-trees.min.css</option>
            <option value="chalk.min.css">chalk.min.css</option>
            <option value="circus.min.css">circus.min.css</option>
            <option value="classic-dark.min.css">classic-dark.min.css</option>
            <option value="classic-light.min.css">classic-light.min.css</option>
            <option value="codepen-embed.min.css">codepen-embed.min.css</option>
            <option value="codeschool.min.css">codeschool.min.css</option>
            <option value="color-brewer.min.css">color-brewer.min.css</option>
            <option value="colors.min.css">colors.min.css</option>
            <option value="cupcake.min.css">cupcake.min.css</option>
            <option value="cupertino.min.css">cupertino.min.css</option>
            <option value="danqing.min.css">danqing.min.css</option>
            <option value="darcula.min.css">darcula.min.css</option>
            <option value="dark-violet.min.css">dark-violet.min.css</option>
            <option value="dark.min.css">dark.min.css</option>
            <option value="darkmoss.min.css">darkmoss.min.css</option>
            <option value="darktooth.min.css">darktooth.min.css</option>
            <option value="decaf.min.css">decaf.min.css</option>
            <option value="default-dark.min.css">default-dark.min.css</option>
            <option value="default-light.min.css">default-light.min.css</option>
            <option value="default.min.css">default.min.css</option>
            <option value="devibeans.min.css">devibeans.min.css</option>
            <option value="dirtysea.min.css">dirtysea.min.css</option>
            <option value="docco.min.css">docco.min.css</option>
            <option value="dracula.min.css">dracula.min.css</option>
            <option value="edge-dark.min.css">edge-dark.min.css</option>
            <option value="edge-light.min.css">edge-light.min.css</option>
            <option value="eighties.min.css">eighties.min.css</option>
            <option value="embers.min.css">embers.min.css</option>
            <option value="equilibrium-dark.min.css">equilibrium-dark.min.css</option>
            <option value="equilibrium-gray-dark.min.css">equilibrium-gray-dark.min.css</option>
            <option value="equilibrium-gray-light.min.css">equilibrium-gray-light.min.css</option>
            <option value="equilibrium-light.min.css">equilibrium-light.min.css</option>
            <option value="espresso.min.css">espresso.min.css</option>
            <option value="eva-dim.min.css">eva-dim.min.css</option>
            <option value="eva.min.css">eva.min.css</option>
            <option value="far.min.css">far.min.css</option>
            <option value="felipec.min.css">felipec.min.css</option>
            <option value="flat.min.css">flat.min.css</option>
            <option value="foundation.min.css">foundation.min.css</option>
            <option value="framer.min.css">framer.min.css</option>
            <option value="fruit-soda.min.css">fruit-soda.min.css</option>
            <option value="gigavolt.min.css">gigavolt.min.css</option>
            <option value="github-dark-dimmed.min.css">github-dark-dimmed.min.css</option>
            <option value="github-dark.min.css">github-dark.min.css</option>
            <option value="github.min.css">github.min.css</option>
            <option value="gml.min.css">gml.min.css</option>
            <option value="google-dark.min.css">google-dark.min.css</option>
            <option value="google-light.min.css">google-light.min.css</option>
            <option value="googlecode.min.css">googlecode.min.css</option>
            <option value="gradient-dark.min.css">gradient-dark.min.css</option>
            <option value="gradient-light.min.css">gradient-light.min.css</option>
            <option value="grayscale-dark.min.css">grayscale-dark.min.css</option>
            <option value="grayscale-light.min.css">grayscale-light.min.css</option>
            <option value="grayscale.min.css">grayscale.min.css</option>
            <option value="green-screen.min.css">green-screen.min.css</option>
            <option value="gruvbox-dark-hard.min.css">gruvbox-dark-hard.min.css</option>
            <option value="gruvbox-dark-medium.min.css">gruvbox-dark-medium.min.css</option>
            <option value="gruvbox-dark-pale.min.css">gruvbox-dark-pale.min.css</option>
            <option value="gruvbox-dark-soft.min.css">gruvbox-dark-soft.min.css</option>
            <option value="gruvbox-light-hard.min.css">gruvbox-light-hard.min.css</option>
            <option value="gruvbox-light-medium.min.css">gruvbox-light-medium.min.css</option>
            <option value="gruvbox-light-soft.min.css">gruvbox-light-soft.min.css</option>
            <option value="hardcore.min.css">hardcore.min.css</option>
            <option value="harmonic16-dark.min.css">harmonic16-dark.min.css</option>
            <option value="harmonic16-light.min.css">harmonic16-light.min.css</option>
            <option value="heetch-dark.min.css">heetch-dark.min.css</option>
            <option value="heetch-light.min.css">heetch-light.min.css</option>
            <option value="helios.min.css">helios.min.css</option>
            <option value="hopscotch.min.css">hopscotch.min.css</option>
            <option value="horizon-dark.min.css">horizon-dark.min.css</option>
            <option value="horizon-light.min.css">horizon-light.min.css</option>
            <option value="humanoid-dark.min.css">humanoid-dark.min.css</option>
            <option value="humanoid-light.min.css">humanoid-light.min.css</option>
            <option value="hybrid.min.css">hybrid.min.css</option>
            <option value="ia-dark.min.css">ia-dark.min.css</option>
            <option value="ia-light.min.css">ia-light.min.css</option>
            <option value="icy-dark.min.css">icy-dark.min.css</option>
            <option value="idea.min.css">idea.min.css</option>
            <option value="intellij-light.min.css">intellij-light.min.css</option>
            <option value="ir-black.min.css">ir-black.min.css</option>
            <option value="isbl-editor-dark.min.css">isbl-editor-dark.min.css</option>
            <option value="isbl-editor-light.min.css">isbl-editor-light.min.css</option>
            <option value="isotope.min.css">isotope.min.css</option>
            <option value="kimber.min.css">kimber.min.css</option>
            <option value="kimbie-dark.min.css">kimbie-dark.min.css</option>
            <option value="kimbie-light.min.css">kimbie-light.min.css</option>
            <option value="lightfair.min.css">lightfair.min.css</option>
            <option value="lioshi.min.css">lioshi.min.css</option>
            <option value="london-tube.min.css">london-tube.min.css</option>
            <option value="macintosh.min.css">macintosh.min.css</option>
            <option value="magula.min.css">magula.min.css</option>
            <option value="marrakesh.min.css">marrakesh.min.css</option>
            <option value="materia.min.css">materia.min.css</option>
            <option value="material-darker.min.css">material-darker.min.css</option>
            <option value="material-lighter.min.css">material-lighter.min.css</option>
            <option value="material-palenight.min.css">material-palenight.min.css</option>
            <option value="material-vivid.min.css">material-vivid.min.css</option>
            <option value="material.min.css">material.min.css</option>
            <option value="mellow-purple.min.css">mellow-purple.min.css</option>
            <option value="mexico-light.min.css">mexico-light.min.css</option>
            <option value="mocha.min.css">mocha.min.css</option>
            <option value="mono-blue.min.css">mono-blue.min.css</option>
            <option value="monokai-sublime.min.css">monokai-sublime.min.css</option>
            <option value="monokai.min.css">monokai.min.css</option>
            <option value="nebula.min.css">nebula.min.css</option>
            <option value="night-owl.min.css">night-owl.min.css</option>
            <option value="nnfx-dark.min.css">nnfx-dark.min.css</option>
            <option value="nnfx-light.min.css">nnfx-light.min.css</option>
            <option value="nord.min.css">nord.min.css</option>
            <option value="nova.min.css">nova.min.css</option>
            <option value="obsidian.min.css">obsidian.min.css</option>
            <option value="ocean.min.css">ocean.min.css</option>
            <option value="oceanicnext.min.css">oceanicnext.min.css</option>
            <option value="one-light.min.css">one-light.min.css</option>
            <option value="onedark.min.css">onedark.min.css</option>
            <option value="outrun-dark.min.css">outrun-dark.min.css</option>
            <option value="panda-syntax-dark.min.css">panda-syntax-dark.min.css</option>
            <option value="panda-syntax-light.min.css">panda-syntax-light.min.css</option>
            <option value="papercolor-dark.min.css">papercolor-dark.min.css</option>
            <option value="papercolor-light.min.css">papercolor-light.min.css</option>
            <option value="paraiso-dark.min.css">paraiso-dark.min.css</option>
            <option value="paraiso-light.min.css">paraiso-light.min.css</option>
            <option value="paraiso.min.css">paraiso.min.css</option>
            <option value="pasque.min.css">pasque.min.css</option>
            <option value="phd.min.css">phd.min.css</option>
            <option value="pico.min.css">pico.min.css</option>
            <option value="pojoaque.min.css">pojoaque.min.css</option>
            <option value="pop.min.css">pop.min.css</option>
            <option value="porple.min.css">porple.min.css</option>
            <option value="purebasic.min.css">purebasic.min.css</option>
            <option value="qtcreator-dark.min.css">qtcreator-dark.min.css</option>
            <option value="qtcreator-light.min.css">qtcreator-light.min.css</option>
            <option value="qualia.min.css">qualia.min.css</option>
            <option value="railscasts.min.css">railscasts.min.css</option>
            <option value="rainbow.min.css">rainbow.min.css</option>
            <option value="rebecca.min.css">rebecca.min.css</option>
            <option value="ros-pine-dawn.min.css">ros-pine-dawn.min.css</option>
            <option value="ros-pine-moon.min.css">ros-pine-moon.min.css</option>
            <option value="ros-pine.min.css">ros-pine.min.css</option>
            <option value="routeros.min.css">routeros.min.css</option>
            <option value="sagelight.min.css">sagelight.min.css</option>
            <option value="sandcastle.min.css">sandcastle.min.css</option>
            <option value="school-book.min.css">school-book.min.css</option>
            <option value="seti-ui.min.css">seti-ui.min.css</option>
            <option value="shades-of-purple.min.css">shades-of-purple.min.css</option>
            <option value="shapeshifter.min.css">shapeshifter.min.css</option>
            <option value="silk-dark.min.css">silk-dark.min.css</option>
            <option value="silk-light.min.css">silk-light.min.css</option>
            <option value="snazzy.min.css">snazzy.min.css</option>
            <option value="solar-flare-light.min.css">solar-flare-light.min.css</option>
            <option value="solar-flare.min.css">solar-flare.min.css</option>
            <option value="solarized-dark.min.css">solarized-dark.min.css</option>
            <option value="solarized-light.min.css">solarized-light.min.css</option>
            <option value="spacemacs.min.css">spacemacs.min.css</option>
            <option value="srcery.min.css">srcery.min.css</option>
            <option value="stackoverflow-dark.min.css">stackoverflow-dark.min.css</option>
            <option value="stackoverflow-light.min.css">stackoverflow-light.min.css</option>
            <option value="summercamp.min.css">summercamp.min.css</option>
            <option value="summerfruit-dark.min.css">summerfruit-dark.min.css</option>
            <option value="summerfruit-light.min.css">summerfruit-light.min.css</option>
            <option value="sunburst.min.css">sunburst.min.css</option>
            <option value="synth-midnight-terminal-dark.min.css">synth-midnight-terminal-dark.min.css</option>
            <option value="synth-midnight-terminal-light.min.css">synth-midnight-terminal-light.min.css</option>
            <option value="tango.min.css">tango.min.css</option>
            <option value="tender.min.css">tender.min.css</option>
            <option value="tokyo-night-dark.min.css">tokyo-night-dark.min.css</option>
            <option value="tokyo-night-light.min.css">tokyo-night-light.min.css</option>
            <option value="tomorrow-night-blue.min.css">tomorrow-night-blue.min.css</option>
            <option value="tomorrow-night-bright.min.css">tomorrow-night-bright.min.css</option>
            <option value="tomorrow-night.min.css">tomorrow-night.min.css</option>
            <option value="tomorrow.min.css">tomorrow.min.css</option>
            <option value="twilight.min.css">twilight.min.css</option>
            <option value="unikitty-dark.min.css">unikitty-dark.min.css</option>
            <option value="unikitty-light.min.css">unikitty-light.min.css</option>
            <option value="vs.min.css">vs.min.css</option>
            <option value="vs2015.min.css" selected>vs2015.min.css</option>
            <option value="vulcan.min.css">vulcan.min.css</option>
            <option value="windows-10-light.min.css">windows-10-light.min.css</option>
            <option value="windows-10.min.css">windows-10.min.css</option>
            <option value="windows-95-light.min.css">windows-95-light.min.css</option>
            <option value="windows-95.min.css">windows-95.min.css</option>
            <option value="windows-high-contrast-light.min.css">windows-high-contrast-light.min.css</option>
            <option value="windows-high-contrast.min.css">windows-high-contrast.min.css</option>
            <option value="windows-nt-light.min.css">windows-nt-light.min.css</option>
            <option value="windows-nt.min.css">windows-nt.min.css</option>
            <option value="woodland.min.css">woodland.min.css</option>
            <option value="xcode-dusk.min.css">xcode-dusk.min.css</option>
            <option value="xcode.min.css">xcode.min.css</option>
            <option value="xt256.min.css">xt256.min.css</option>
            <option value="zenburn.min.css">zenburn.min.css</option>
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
