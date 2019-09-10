<%@ Page Language="C#" %>

<script runat="server">
    protected void UploadFileButton_Click(object sender, EventArgs e)
    {
        if (ChangeFileNameTextBox.Text == string.Empty)
        {
            MessageLabel.Text = "Please type your file's name.";
        }
        else if (FileUpload.HasFile)
        {
            try
            {
                FileUpload.SaveAs(Server.MapPath("~/") + "/Uploads/" + ChangeFileNameTextBox.Text +
                        System.IO.Path.GetExtension(FileUpload.FileName));
                MessageLabel.Text = "File name: " +
                        FileUpload.PostedFile.FileName + "<br>" +
                        FileUpload.PostedFile.ContentLength + " kb<br>" +
                        "Content type: " +
                        FileUpload.PostedFile.ContentType;
            }
            catch (Exception ex)
            {
                MessageLabel.Text = "ERROR: " + ex.Message.ToString();
            }
        }
        else
        {
            MessageLabel.Text = "You have not specified a file.";
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
        <asp:Label ID="ChangeFileNameLabel" runat="server" Text="File's name:"/>
        <asp:TextBox ID="ChangeFileNameTextBox" runat="server" /><br />
        <br />
        <asp:Button ID="UploadFileButton" runat="server" OnClick="UploadFileButton_Click" 
         Text="Upload File" />&nbsp;<br />
        <br />
        <asp:Label ID="MessageLabel" runat="server"></asp:Label></div>
    </form>
</body>
</html>