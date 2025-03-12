Imports System.Data.SqlClient

Public Class EditAccountDetails
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

        If Not IsPostBack Then
            PopulateTextBoxes()
        End If

    End Sub

    Private Sub PopulateTextBoxes()

        Try
            cmd = New SqlCommand("EXEC displayLoggedInUserDetails @u", conn)
            cmd.Parameters.AddWithValue("@u", Session("username"))

            conn.Open()

            sda = New SqlDataAdapter(cmd)
            dt = New DataTable()

            sda.Fill(dt)

            ViewState("UpdationId") = dt.Rows(0)("Id").ToString()
            UsernameBox.Text = dt.Rows(0)("Username").ToString()
            EmailBox.Text = dt.Rows(0)("Email").ToString()
            PasswordBox.Text = dt.Rows(0)("Password").ToString()
        Catch ex As Exception
            Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
        Finally
            conn.Close()
        End Try

    End Sub

    Protected Sub UpdateAccountButton_Click(sender As Object, e As EventArgs) Handles UpdateAccountButton.Click

        Try
            cmd = New SqlCommand("EXEC updateUserAccount @i, @u, @e, @p", conn)
            cmd.Parameters.AddWithValue("@i", ViewState("UpdationId").ToString())
            cmd.Parameters.AddWithValue("@u", UsernameBox.Text)
            cmd.Parameters.AddWithValue("@e", EmailBox.Text)
            cmd.Parameters.AddWithValue("@p", PasswordBox.Text)
            conn.Open()
            cmd.ExecuteNonQuery()
            Session.Abandon()
            Response.Write("<script>alert('Account Details Successfully Updated, Please Login again to Continue !!!'); window.location = 'ExistingUserLogin.aspx';</script>")
        Catch ex As Exception
            Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
        Finally
            conn.Close()
        End Try

    End Sub
End Class