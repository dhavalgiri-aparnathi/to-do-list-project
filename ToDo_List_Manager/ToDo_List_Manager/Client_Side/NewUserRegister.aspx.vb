Imports System.Data.SqlClient

Public Class NewUserRegister
    Inherits System.Web.UI.Page

    Private conn As SqlConnection
    Private cmd As SqlCommand

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        conn = New SqlConnection(Connection.GetString)

    End Sub

    Protected Sub RegisterButton_Click(sender As Object, e As EventArgs) Handles RegisterButton.Click

        Try
            cmd = New SqlCommand("EXEC registerNewUser @u, @e, @p", conn)
            cmd.Parameters.AddWithValue("@u", UsernameBox.Text)
            cmd.Parameters.AddWithValue("@e", EmailBox.Text)
            cmd.Parameters.AddWithValue("@p", PasswordBox.Text)
            conn.Open()
            cmd.ExecuteNonQuery()
            Response.Write("<script>alert('Registration Success, You can now login...'); window.location = 'ExistingUserLogin.aspx';</script>")
        Catch ex As Exception
            Response.Write("<script>alert('Such a Username Already Exists, Try another one...');</script>")
        Finally
            conn.Close()
        End Try

    End Sub
End Class