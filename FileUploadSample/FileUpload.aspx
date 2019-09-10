<%@ Page Language="C#" %>

<script runat="server">
    protected void ButtonUploadFile_Click(object sender, EventArgs e)
    {
        if (FileUpload.HasFile)
            try
            {
                FileUpload.SaveAs(Server.MapPath("~/") + "/Uploads/" +
                     FileUpload.FileName);
                Label1.Text = "File name: " +
                     FileUpload.PostedFile.FileName + "<br>" +
                     FileUpload.PostedFile.ContentLength + " kb<br>" +
                     "Content type: " +
                     FileUpload.PostedFile.ContentType;
            }
            catch (Exception ex)
            {
                Label1.Text = "ERROR: " + ex.Message.ToString();
            }
        else
        {
            Label1.Text = "You have not specified a file.";
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Upload Files</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="FileUpload" runat="server" /><br />
        <br />
        <asp:Button ID="ButtonUploadFile" runat="server" OnClick="ButtonUploadFile_Click" 
         Text="Upload File" />&nbsp;<br />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label></div>
    </form>
</body>
</html>