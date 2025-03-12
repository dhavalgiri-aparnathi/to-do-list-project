Imports System.Data.SqlClient

Public Class UserFeedback
    Inherits System.Web.UI.Page

    Private conn As SqlConnection
    Private cmd As SqlCommand

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("username") = Nothing Then
            Response.Write("<script>alert('Please Login to Visit this Page...'); window.location = 'ExistingUserLogin.aspx';</script>")
            Return
        End If

        UsernameLabel.Text = Session("username").ToString()
        conn = New SqlConnection(Connection.GetString)
    End Sub

    Protected Sub SubmitFeedbackButton_Click(sender As Object, e As EventArgs) Handles SubmitFeedbackButton.Click

        Try
            cmd = New SqlCommand("EXEC addUsersFeedback @u, @r, @f", conn)
            cmd.Parameters.AddWithValue("@u", Session("username").ToString())
            cmd.Parameters.AddWithValue("@r", RatingList.SelectedValue)
            cmd.Parameters.AddWithValue("@f", FeedBackBox.Text)

            conn.Open()

            cmd.ExecuteNonQuery()

            Response.Write("<script>alert('Your Feedback has been Submited !!!'); window.location = 'UserFeedback.aspx';</script>")
        Catch ex As Exception
            Response.Write("<script>alert('An Error Occurred: " & ex.Message.ToString() & "');</script>")
        Finally
            conn.Close()
        End Try

    End Sub
End Class