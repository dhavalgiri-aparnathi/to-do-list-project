Imports System.Data.SqlClient

Public Class AdminDashboard
    Inherits System.Web.UI.Page

    Private conn As SqlConnection
    Private cmd As SqlCommand

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("a_username") = Nothing Then
            Response.Write("<script>alert('You must Log-In as an Admin to visit this page...'); window.location = 'AdminLoginPage.aspx';</script>")
            Return
        End If

        conn = New SqlConnection(Connection.GetString)
        AdminUsernameLabel.Text = Session("a_username").ToString()
        ModifyLabelData()

    End Sub

    Private Sub ModifyLabelData()

        Try
            conn.Open()
            cmd = New SqlCommand("SELECT COUNT(*) FROM users;", conn)
            Dim TotalUsers = cmd.ExecuteScalar()
            cmd = New SqlCommand("SELECT COUNT(*) FROM tasks;", conn)
            Dim TotalTasks = cmd.ExecuteScalar()
            cmd = New SqlCommand("SELECT COUNT(*) FROM feedback;", conn)
            Dim TotalFeedbacks = cmd.ExecuteScalar()

            TotalUsersLabel.Text = TotalUsers.ToString()
            TotalTasksLabel.Text = TotalTasks.ToString()
            TotalFeedbacksLabel.Text = TotalFeedbacks.ToString()
        Catch ex As Exception
            Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
        Finally
            conn.Close()
        End Try

    End Sub

    Protected Sub LogoutButton_Click(sender As Object, e As EventArgs) Handles LogoutButton.Click

        Session.Abandon()

        Response.Redirect("AdminLoginPage.aspx")

    End Sub
End Class