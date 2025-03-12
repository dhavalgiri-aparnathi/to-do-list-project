Imports System.Data.SqlClient

Public Class UserTasks
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
        UsernameLabel.Text = Session("a_username").ToString()
        PopulateGridView()

    End Sub

    Private Sub PopulateGridView()

        Try
            conn.Open()
            cmd = New SqlCommand("EXEC displayAllUserTasks", conn)
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

End Class