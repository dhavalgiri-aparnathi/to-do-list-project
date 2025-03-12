Imports System.Data.SqlClient

Public Class TaskSection
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
        UsernameLabel.Text = Session("username").ToString()

        PopulateGridView()

    End Sub

    Private Sub PopulateGridView()

        Try
            conn.Open()
            cmd = New SqlCommand("EXEC displayLoggedInUserDetails @u", conn)
            cmd.Parameters.AddWithValue("@u", Session("username"))

            sda = New SqlDataAdapter(cmd)
            dt = New DataTable()

            sda.Fill(dt)

            Dim UserId = dt.Rows(0)("Id").ToString()

            cmd = New SqlCommand("EXEC displayLoggedInUserTasks @uid", conn)
            cmd.Parameters.AddWithValue("@uid", UserId)

            sda = New SqlDataAdapter(cmd)
            dt = New DataTable()

            sda.Fill(dt)

            conn.Close()

            If dt.Rows.Count = 0 Then
                ErrorLabel.Visible = True
                GridView1.Visible = False
            Else
                ErrorLabel.Visible = False
                GridView1.DataSource = dt
                GridView1.DataBind()
            End If
        Catch ex As Exception
            Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
        End Try

    End Sub

    Protected Sub CreateNewTaskButton_Click(sender As Object, e As EventArgs) Handles CreateNewTaskButton.Click

        Response.Redirect("AddNewTask.aspx")

    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand

        If e.CommandName.Equals("DeleteTaskBtn") Then
            Try
                cmd = New SqlCommand("EXEC deleteUserTask @tid", conn)
                cmd.Parameters.AddWithValue("@tid", e.CommandArgument.ToString())
                conn.Open()
                cmd.ExecuteNonQuery()
            Catch ex As Exception
                Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
            Finally
                conn.Close()
                PopulateGridView()
            End Try
        ElseIf e.CommandName.Equals("ChangeTaskBtn") Then
            Response.Redirect("EditUserTask.aspx?TaskId=" & e.CommandArgument.ToString())
        End If

    End Sub
End Class