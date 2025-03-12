Imports System.Data.SqlClient

Public Class ExistingUserLogin
    Inherits System.Web.UI.Page

    Private conn As SqlConnection
    Private cmd As SqlCommand
    Private sda As SqlDataAdapter
    Private dt As DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        conn = New SqlConnection(Connection.GetString)

    End Sub

    Protected Sub LoginButton_Click(sender As Object, e As EventArgs) Handles LoginButton.Click

        Try
            conn.Open()

            cmd = New SqlCommand("EXEC verifyUserLogin @u, @p", conn)
            cmd.Parameters.AddWithValue("@u", UsernameBox.Text)
            cmd.Parameters.AddWithValue("@p", PasswordBox.Text)

            sda = New SqlDataAdapter(cmd)
            dt = New DataTable()

            sda.Fill(dt)

            If dt.Rows.Count > 0 Then
                Dim storedUsername As String = dt.Rows(0)("Username").ToString()
                Dim storedPassword As String = dt.Rows(0)("Password").ToString()

                If storedUsername.Equals(UsernameBox.Text) And storedPassword.Equals(PasswordBox.Text) Then
                    Session("username") = storedUsername
                    Response.Write("<script>alert('Login Success'); window.location = 'LoginSuccess.aspx';</script>")
                Else
                    Response.Write("<script>alert('Login Failed, Try Checking Case Sensitivity');</script>")
                End If
            Else
                Response.Write("<script>alert('Invalid Username or Password, Login Failed');</script>")
            End If
        Catch ex As Exception
            Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
        Finally
            conn.Close()
        End Try

    End Sub
End Class