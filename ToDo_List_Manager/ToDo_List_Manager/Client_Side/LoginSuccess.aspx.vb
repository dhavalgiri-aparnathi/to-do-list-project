Public Class LoginSuccess
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("username") = Nothing Then
            Response.Write("<script>alert('Please Login to Visit this Page...'); window.location = 'ExistingUserLogin.aspx';</script>")
            Return
        End If

    End Sub

    Protected Sub CreateTaskButton_Click(sender As Object, e As EventArgs) Handles CreateTaskButton.Click

        Response.Redirect("AddNewTask.aspx")

    End Sub
End Class