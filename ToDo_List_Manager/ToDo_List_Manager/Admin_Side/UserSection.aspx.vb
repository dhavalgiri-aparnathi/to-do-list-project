Imports System.Data.SqlClient

Public Class UserSection
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

        PopulateGridView()

    End Sub

    Private Sub PopulateGridView()

        Try
            conn.Open()
            cmd = New SqlCommand("EXEC displayAllUsers", conn)
            sda = New SqlDataAdapter(cmd)
            dt = New DataTable()
            sda.Fill(dt)
            If dt.Rows.Count = 0 Then
                ErrorLabel.Visible = True
                GridView1.Visible = False
                SearchBox.Visible = False
            Else
                ErrorLabel.Visible = False
                GridView1.Visible = True
                SearchBox.Visible = True
                GridView1.DataSource = dt
                GridView1.DataBind()
            End If
        Catch ex As Exception
            Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
        Finally
            conn.Close()
        End Try

    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand

        If e.CommandName.Equals("DeleteBtn") Then
            Try
                cmd = New SqlCommand("EXEC deleteUserAccount @u", conn)
                cmd.Parameters.AddWithValue("@u", e.CommandArgument.ToString())
                conn.Open()
                cmd.ExecuteNonQuery()
            Catch ex As Exception
                Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
            Finally
                conn.Close()
                PopulateGridView()
            End Try
        ElseIf e.CommandName.Equals("UpdateBtn") Then
            Response.Redirect("UpdateUserAccount.aspx?UpdationId=" & e.CommandArgument.ToString())
        End If

    End Sub

    Protected Sub AddUserButton_Click(sender As Object, e As EventArgs) Handles AddUserButton.Click

        AddUserForm.Visible = True
        GridView1.Visible = False
        ViewUsersButton.Visible = True
        SearchBox.Visible = False
        AddUserButton.Visible = False
        ErrorLabel.Visible = False

    End Sub

    Protected Sub ViewUsersButton_Click(sender As Object, e As EventArgs) Handles ViewUsersButton.Click

        AddUserForm.Visible = False
        GridView1.Visible = True
        SearchBox.Visible = True
        ViewUsersButton.Visible = False
        AddUserButton.Visible = True

    End Sub

    Protected Sub InsertNewUser_Click(sender As Object, e As EventArgs) Handles InsertNewUser.Click

        Try
            cmd = New SqlCommand("EXEC registerNewUser @u, @e, @p", conn)
            cmd.Parameters.AddWithValue("@u", UsernameBox.Text)
            cmd.Parameters.AddWithValue("@e", EmailBox.Text)
            cmd.Parameters.AddWithValue("@p", PasswordBox.Text)
            conn.Open()
            cmd.ExecuteNonQuery()
            Response.Write("<script>alert('New User Added Successfully...'); window.location = 'UserSection.aspx';</script>")
        Catch ex As Exception
            Response.Write("<script>alert('Such a Username Already Exists, Try another one...');</script>")
        Finally
            conn.Close()
        End Try

    End Sub

    Protected Sub SearchBox_TextChanged(sender As Object, e As EventArgs) Handles SearchBox.TextChanged

        Try
            cmd = New SqlCommand("SELECT * FROM users WHERE Username LIKE @u;", conn)
            cmd.Parameters.AddWithValue("@u", SearchBox.Text + "%")
            conn.Open()
            sda = New SqlDataAdapter(cmd)
            dt = New DataTable()
            sda.Fill(dt)
            If dt.Rows.Count = 0 Then
                ErrorLabel.Visible = True
            Else
                ErrorLabel.Visible = False
            End If
            GridView1.DataSource = dt
            GridView1.DataBind()
        Catch ex As Exception
            Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
        Finally
            conn.Close()
        End Try

    End Sub
End Class