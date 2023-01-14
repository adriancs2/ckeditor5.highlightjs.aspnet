<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CKEditor5_SyntaxHighlight.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Using CKEditor 5 (with Code Block) + Highlight.js (output) in ASP.NET</title>
    <style type="text/css">
        html, body, form {
            height: 100%;
            width: 100%;
            margin: 0;
            padding: 0;
            font-family: Arial;
            font-size: 10pt;
        }

        h1 {
            border-bottom: 1px solid #c1c1c1;
            margin-top: 0;
            margin-bottom: 5px;
            padding: 0;
        }

        h2 {
            padding: 0;
            margin: 0;
            margin-bottom: 8px;
        }

        .framerender {
            width: 100%;
            height: calc(100vh - 130px);
            overflow: scroll;
            border: 1px solid #bbbbbb;
        }

        .ck-source-editing-area,
        .ck-editor__editable {
            min-height: calc(100vh - 250px);
        }

        .ck-editor__main {
            height: calc(100vh - 250px);
            overflow-y: scroll;
            border: 1px solid #bbbbbb;
        }

    </style>

</head>
<body>

    <div style="padding: 8px;">
        <h1>Using CKEditor 5 (with Code Block) + Highlight.js (output) in ASP.NET</h1>
        Source Code / Tutorial / Article: 
        <a href="https://github.com/adriancs2/ckeditor5.highlightjs.aspnet">Github.com</a> |
        <a href="https://adriancs.com/aspnet-webforms/884/using-ckeditor-5-with-code-block-highlight-js-output-in-asp-net/" target="_blank">adriancs.com</a> |
        <a href="https://www.codeproject.com/Articles/5351960/Using-CKEditor-5-with-Code-Block-Highlight-js">CodeProject.com</a>
    </div>

    <form id="form1" runat="server">

        <table style="border-collapse: collapse; width: calc(100vw - 30px); height: 100%; table-layout: fixed;">
            <tr>
                <td style="width: 49%; vertical-align: top;">
                    <div style="padding: 10px;">



                        <asp:Button ID="btSave" runat="server" Text="Save" OnClick="btSave_Click" />
                        <asp:Button ID="btLoadDefault" runat="server" Text="Load Default" OnClick="btLoadDefault_Click" />

                        <div style="height: 2px"></div>

                        <asp:TextBox ID="txtEditor" runat="server" TextMode="MultiLine" CssClass="editor" ValidateRequestMode="Disabled"></asp:TextBox>
                    </div>
                </td>
                <td style="width: 2%;"></td>
                <td style="width: 49%; vertical-align: top;">
                    <h2>Output</h2>
                    <asp:PlaceHolder ID="ph1" runat="server"></asp:PlaceHolder>
                </td>
            </tr>
        </table>

    </form>

    <script src="/CKEditor5/ckeditor.js"></script>
    <script>

        ClassicEditor
            .create(document.querySelector('.editor'), {

                licenseKey: '',

                toolbar: {
                    shouldNotGroupWhenFull: true
                },

                codeBlock: {
                    languages: [
                        { language: "plaintext", label: "Plain text" },
                        { language: "html", label: "HTML" },
                        { language: "css", label: "CSS" },
                        { language: "javascript", label: "JavaScript" },
                        { language: "cs", label: "C#" },
                        { language: "sql", label: "SQL" },
                        { language: "json", label: "JSON" },
                        { language: "c", label: "C" },
                        { language: "cpp", label: "C++" },
                        { language: "diff", label: "Diff" },
                        { language: "java", label: "Java" },
                        { language: "php", label: "PHP" },
                        { language: "python", label: "Python" },
                        { language: "ruby", label: "Ruby" },
                        { language: "typescript", label: "TypeScript" },
                        { language: "xml", label: "XML" }
                    ],
                    indentSequence: "    "
                }

            });
    </script>




</body>
</html>
