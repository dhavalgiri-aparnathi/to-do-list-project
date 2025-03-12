Imports System.Data.SqlClient

Public Class EditUserTask
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

        If Request.QueryString("TaskId") = Nothing Then
            Response.Write("<script>alert('Please Do not use such means...'); window.location = 'TaskSection.aspx';</script>")
            Return
        End If

        conn = New SqlConnection(Connection.GetString)
        UsernameLabel.Text = Session("username")

        If Not IsPostBack Then
            PopulateTaskDetails()
        End If

    End Sub

    Private Sub PopulateTaskDetails()

        Try
            conn.Open()

            cmd = New SqlCommand("SELECT * FROM tasks WHERE TaskId = @tid;", conn)
            cmd.Parameters.AddWithValue("@tid", Request.QueryString("TaskId").ToString())

            sda = New SqlDataAdapter(cmd)
            dt = New DataTable()

            sda.Fill(dt)

            ViewState("TaskId") = dt.Rows(0)("TaskId").ToString()
            TaskCompletionList.SelectedValue = dt.Rows(0)("IsCompleted").ToString()
            TaskCatList.SelectedValue = dt.Rows(0)("TaskCategory").ToString()
            TaskBox.Text = dt.Rows(0)("Task").ToString()
        Catch ex As Exception
            Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
        Finally
            conn.Close()
        End Try

    End Sub

    Protected Sub EditTaskButton_Click(sender As Object, e As EventArgs) Handles EditTaskButton.Click

        Try
            conn.Open()
            cmd = New SqlCommand("EXEC editUserTask @tid, @tc, @t, @ic", conn)
            cmd.Parameters.AddWithValue("@tid", ViewState("TaskId"))
            cmd.Parameters.AddWithValue("@tc", TaskCatList.SelectedValue)
            cmd.Parameters.AddWithValue("@t", TaskBox.Text)
            cmd.Parameters.AddWithValue("@ic", TaskCompletionList.SelectedValue)

            cmd.ExecuteNonQuery()
            Response.Write("<script>alert('Task Updated Successfully !!!'); window.location = 'TaskSection.aspx';</script>")
        Catch ex As Exception
            Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
        Finally
            conn.Close()
        End Try

    End Sub
End Class