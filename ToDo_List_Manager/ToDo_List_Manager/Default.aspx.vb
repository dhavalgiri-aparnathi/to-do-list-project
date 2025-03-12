Public Class _Default1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub UserPanelButton_Click(sender As Object, e As EventArgs) Handles UserPanelButton.Click

        Response.Redirect("Client_Side/ClientHomePage.aspx")

    End Sub

    Protected Sub AdminPanelButton_Click(sender As Object, e As EventArgs) Handles AdminPanelButton.Click

        Response.Redirect("Admin_Side/AdminLoginPage.aspx")

    End Sub
End Class