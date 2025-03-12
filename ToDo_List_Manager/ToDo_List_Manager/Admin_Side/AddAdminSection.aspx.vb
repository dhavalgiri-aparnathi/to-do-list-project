Imports System.Data.SqlClient

Public Class AddAdminSection
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
            cmd = New SqlCommand("EXEC showAllAdminDetails", conn)
            sda = New SqlDataAdapter(cmd)
            dt = New DataTable()
            sda.Fill(dt)
            GridView1.DataSource = dt
            GridView1.DataBind()
        Catch ex As Exception
            Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
        Finally
            conn.Close()
        End Try

    End Sub

    Protected Sub GoBackButton_Click(sender As Object, e As EventArgs) Handles GoBackButton.Click

        Response.Redirect("AdminDashboard.aspx")

    End Sub

    Protected Sub ViewAdminsButton_Click(sender As Object, e As EventArgs) Handles ViewAdminsButton.Click

        GridView1.Visible = True
        AddAdminButton.Visible = True
        ViewAdminsButton.Visible = False
        AddAdminForm.Visible = False

    End Sub

    Protected Sub AddAdminButton_Click(sender As Object, e As EventArgs) Handles AddAdminButton.Click

        GridView1.Visible = False
        ViewAdminsButton.Visible = True
        AddAdminButton.Visible = False
        AddAdminForm.Visible = True

    End Sub

    Protected Sub InsertNewAdmin_Click(sender As Object, e As EventArgs) Handles InsertNewAdmin.Click

        Try
            cmd = New SqlCommand("EXEC addNewAdmin @u, @p", conn)
            cmd.Parameters.AddWithValue("@u", UsernameBox.Text)
            cmd.Parameters.AddWithValue("@p", PasswordBox.Text)
            conn.Open()
            cmd.ExecuteNonQuery()
            Response.Write("<script>alert('New Admin Successfully Added...'); window.location = 'AddAdminSection.aspx';</script>")
        Catch ex As Exception
            Response.Write("<script>alert('Such a Username Already Exists, Try another one...');</script>")
        Finally
            conn.Close()
            PopulateGridView()
        End Try

    End Sub
End Class