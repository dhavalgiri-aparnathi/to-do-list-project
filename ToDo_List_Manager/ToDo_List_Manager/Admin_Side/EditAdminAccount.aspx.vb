Imports System.Data.SqlClient

Public Class EditAdminAccount
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

        If Not IsPostBack Then
            PopulateTextBoxes()
        End If

    End Sub

    Protected Sub PopulateTextBoxes()

        Try
            cmd = New SqlCommand("EXEC displayLoggedInAdminDetails @u", conn)
            cmd.Parameters.AddWithValue("@u", Session("a_username"))

            conn.Open()

            sda = New SqlDataAdapter(cmd)
            dt = New DataTable()

            sda.Fill(dt)

            ViewState("Id") = dt.Rows(0)("Id").ToString()
            UsernameBox.Text = dt.Rows(0)("Username").ToString()
            PasswordBox.Text = dt.Rows(0)("Password").ToString()
        Catch ex As Exception
            Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
        Finally
            conn.Close()
        End Try

    End Sub

    Protected Sub UpdateAccountButton_Click(sender As Object, e As EventArgs) Handles UpdateAccountButton.Click

        Try
            cmd = New SqlCommand("EXEC updateAdminAccount @id, @u, @p;", conn)
            cmd.Parameters.AddWithValue("@id", ViewState("Id").ToString())
            cmd.Parameters.AddWithValue("@u", UsernameBox.Text)
            cmd.Parameters.AddWithValue("@p", PasswordBox.Text)
            conn.Open()
            cmd.ExecuteNonQuery()
            Session.Abandon()
            Response.Write("<script>alert('Account Details Successfully Updated, Please Login again to Continue !!!'); window.location = 'AdminLoginPage.aspx';</script>")
        Catch ex As Exception
            Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
        Finally
            conn.Close()
        End Try

    End Sub
End Class