Imports System.Data.SqlClient

Public Class UserAccount
    Inherits System.Web.UI.Page

    Private conn As SqlConnection
    Private cmd As SqlCommand
    Private sda As SqlDataAdapter
    Private dt As DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("username") = Nothing Then
            Response.Write("<script>alert('Please Login to Visit this Page...'); window.location = 'ExistingUserLogin.aspx';</script>")
            Return
        End If

        conn = New SqlConnection(Connection.GetString)
        PopulateLabelWithData()

    End Sub

    Private Sub PopulateLabelWithData()

        Try
            cmd = New SqlCommand("EXEC displayLoggedInUserDetails @u", conn)
            cmd.Parameters.AddWithValue("@u", Session("Username").ToString())

            conn.Open()

            sda = New SqlDataAdapter(cmd)
            dt = New DataTable()

            sda.Fill(dt)

            UsernameLabel.Text = dt.Rows(0)("Username").ToString()
            EmailLabel.Text = dt.Rows(0)("Email").ToString()
            PasswordLabel.Text = dt.Rows(0)("Password").ToString()
        Catch ex As Exception
            Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
        Finally
            conn.Close()
        End Try

    End Sub

    Protected Sub DeleteButton_Click(sender As Object, e As EventArgs) Handles DeleteButton.Click

        Try
            cmd = New SqlCommand("EXEC deleteUserAccount @u", conn)
            cmd.Parameters.AddWithValue("@u", Session("Username").ToString())
            conn.Open()
            cmd.ExecuteNonQuery()
            Response.Write("<script>alert('Your Account has been Deleted'); window.location = 'ClientHomePage.aspx';</script>")
        Catch ex As Exception
            Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
        Finally
            conn.Close()
        End Try

    End Sub

    Protected Sub EditButton_Click(sender As Object, e As EventArgs) Handles EditButton.Click

        Response.Redirect("EditAccountDetails.aspx")

    End Sub
End Class