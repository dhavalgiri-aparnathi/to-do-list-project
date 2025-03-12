Imports System.Data.SqlClient

Public Class UpdateUserAccount
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

        If Request.QueryString("UpdationId") = "" Then
            Response.Write("<script>alert('Please Visit this page from the User Section...'); window.location = 'UserSection.aspx';</script>")
            Return
        End If

        conn = New SqlConnection(Connection.GetString)

        If Not IsPostBack Then
            PopulateTextBoxes()
        End If

    End Sub

    Private Sub PopulateTextBoxes()

        Try
            ViewState("UpdationId") = Request.QueryString("UpdationId").ToString()

            cmd = New SqlCommand("EXEC displayAllUsers", conn)

            conn.Open()

            sda = New SqlDataAdapter(cmd)
            dt = New DataTable()

            sda.Fill(dt)

            For i = 0 To dt.Rows.Count - 1
                If dt.Rows(i)("Id").ToString().Equals(ViewState("UpdationId").ToString()) Then
                    UsernameBox.Text = dt.Rows(i)("Username").ToString()
                    EmailBox.Text = dt.Rows(i)("Email").ToString()
                    PasswordBox.Text = dt.Rows(i)("Password").ToString()
                End If
            Next
        Catch ex As Exception
            Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
        Finally
            conn.Close()
        End Try

    End Sub

    Protected Sub UpdateButton_Click(sender As Object, e As EventArgs) Handles UpdateButton.Click

        Try
            cmd = New SqlCommand("EXEC updateUserAccount @i, @u, @e, @p", conn)
            cmd.Parameters.AddWithValue("@i", ViewState("UpdationId").ToString())
            cmd.Parameters.AddWithValue("@u", UsernameBox.Text)
            cmd.Parameters.AddWithValue("@e", EmailBox.Text)
            cmd.Parameters.AddWithValue("@p", PasswordBox.Text)
            conn.Open()
            cmd.ExecuteNonQuery()
            Response.Write("<script>alert('Account Details Successfully Updated'); window.location = 'UserSection.aspx';</script>")
        Catch ex As Exception
            Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
        Finally
            conn.Close()
        End Try

    End Sub
End Class