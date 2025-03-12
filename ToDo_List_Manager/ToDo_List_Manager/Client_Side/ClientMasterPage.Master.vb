Public Class ClientMasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LogoutButton_Click(sender As Object, e As EventArgs) Handles LogoutButton.Click

        Session.Abandon()
        Response.Redirect("ExistingUserLogin.aspx")

    End Sub
End Class