Imports System.Data.SqlClient

Public Class AdminAccountSection
    Inherits System.Web.UI.Page

    Private conn As SqlConnection
    Private cmd As SqlCommand
    Private sda As SqlDataAdapter
    Private dt As DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("a_username") = Nothing Then
            Response.Write("<script>alert('You must Log-In as an Admin to visit this page...'); window.location = 'AdminLoginPage.aspx';</script>")
            Return
        End If

        conn = New SqlConnection(Connection.GetString)
        PopulateLabelWithData()

    End Sub

    Private Sub PopulateLabelWithData()

        Try
            cmd = New SqlCommand("EXEC displayLoggedInAdminDetails @u", conn)
            cmd.Parameters.AddWithValue("@u", Session("a_username").ToString())

            conn.Open()

            sda = New SqlDataAdapter(cmd)
            dt = New DataTable()

            sda.Fill(dt)

            UsernameLabel.Text = dt.Rows(0)("Username").ToString()
            PasswordLabel.Text = dt.Rows(0)("Password").ToString()
        Catch ex As Exception
            Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
        Finally
            conn.Close()
        End Try

    End Sub

    Protected Sub EditButton_Click(sender As Object, e As EventArgs) Handles EditButton.Click

        Response.Redirect("EditAdminAccount.aspx")

    End Sub

    Protected Sub DeleteButton_Click(sender As Object, e As EventArgs) Handles DeleteButton.Click

        Try
            conn.Open()
            cmd = New SqlCommand("EXEC deleteAdminAccount @u", conn)
            cmd.Parameters.AddWithValue("@u", Session("a_username"))
            cmd.ExecuteNonQuery()
            Response.Write("<script>alert('You account has been successfully deleted...'); window.location = 'AdminLoginPage.aspx';</script>")
        Catch ex As Exception
            Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
        Finally
            conn.Close()
        End Try

    End Sub

    Protected Sub GoBackButton_Click(sender As Object, e As EventArgs) Handles GoBackButton.Click

        Response.Redirect("AdminDashboard.aspx")

    End Sub
End Class