Imports System.Data.SqlClient

Public Class AddNewTask
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

        UsernameLabel.Text = Session("Username").ToString()
        conn = New SqlConnection(Connection.GetString)

    End Sub

    Protected Sub AddTaskButton_Click(sender As Object, e As EventArgs) Handles AddTaskButton.Click

        Try
            conn.Open()
            cmd = New SqlCommand("EXEC displayLoggedInUserDetails @u", conn)
            cmd.Parameters.AddWithValue("@u", Session("username"))

            sda = New SqlDataAdapter(cmd)
            dt = New DataTable()

            sda.Fill(dt)

            Dim UserId = dt.Rows(0)("Id").ToString()

            cmd = New SqlCommand("EXEC addUsersTask @uid, @tc, @t", conn)
            cmd.Parameters.AddWithValue("@uid", UserId)
            cmd.Parameters.AddWithValue("@tc", TaskCatList.SelectedValue)
            cmd.Parameters.AddWithValue("@t", TaskBox.Text)
            cmd.ExecuteNonQuery()
            Response.Write("<script>alert('New Task has been successfully added !!!'); window.location = 'TaskSection.aspx';</script>")
        Catch ex As Exception
            Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
        Finally
            conn.Close()
        End Try

    End Sub
End Class