Public Class ClientHomePage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GoBackButton_Click(sender As Object, e As EventArgs) Handles GoBackButton.Click

        Response.Redirect("\Default.aspx")

    End Sub

    Protected Sub NewUserButton_Click(sender As Object, e As EventArgs) Handles NewUserButton.Click

        Response.Redirect("NewUserRegister.aspx")

    End Sub

    Protected Sub ExistingUserButton_Click(sender As Object, e As EventArgs) Handles ExistingUserButton.Click

        Response.Redirect("ExistingUserLogin.aspx")

    End Sub
End Class