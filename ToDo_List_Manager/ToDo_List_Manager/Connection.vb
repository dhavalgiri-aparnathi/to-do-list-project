Public Class Connection

    Private Shared ConnectionString As String = "Data Source=HP-VICTUS-16\SQLEXPRESS;Initial Catalog=tasktrek_todo_list_manager;Integrated Security=True;Encrypt=True;TrustServerCertificate=True"

    Public Shared ReadOnly Property GetString As String

        Get

            Return ConnectionString

        End Get

    End Property

End Class
