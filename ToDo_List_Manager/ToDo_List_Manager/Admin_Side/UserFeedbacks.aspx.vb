Imports System.Data.SqlClient

Public Class UserFeedbacks
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
            cmd = New SqlCommand("EXEC displayUserFeedbacks", conn)
            sda = New SqlDataAdapter(cmd)
            dt = New DataTable()
            sda.Fill(dt)
            If dt.Rows.Count = 0 Then
                ErrorLabel.Visible = True
                GridView1.Visible = False
            Else
                ErrorLabel.Visible = False
                GridView1.Visible = True
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

        If e.CommandName.Equals("DeleteUserFeedback") Then
            Try
                conn.Open()
                cmd = New SqlCommand("EXEC deleteUserFeedback @id", conn)
                cmd.Parameters.AddWithValue("@id", e.CommandArgument.ToString())
                cmd.ExecuteNonQuery()
            Catch ex As Exception
                Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
            Finally
                conn.Close()
                PopulateGridView()
            End Try
        End If

    End Sub

    Protected Sub GoBackButton_Click(sender As Object, e As EventArgs) Handles GoBackButton.Click

        Response.Redirect("AdminDashboard.aspx")

    End Sub
End Class