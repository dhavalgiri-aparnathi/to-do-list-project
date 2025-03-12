<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin_Side/AdminMaster.Master" CodeBehind="UserTasks.aspx.vb" Inherits="ToDo_List_Manager.UserTasks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>TaskTrek - User Tasks</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="admin-user-task-container">

        <h1>
            Hello, <asp:Label ID="UsernameLabel" Text="Username Here" runat="server" />,
        </h1>

        <p>
            To maintain user autonomy, you cannot Modify / Delete Tasks
        </p>

        <asp:Label CssClass="admin-user-task-error-label" Text="There are no user tasks as of now !!!" ID="ErrorLabel" runat="server" />

        <asp:GridView runat="server" ID="GridView1">
        </asp:GridView>

        <button type="button" class="admin-user-task-section-btn" onclick="navigateToDashboard()">Go Back</button>

    </div>

    <script>

        function navigateToDashboard() {
            window.location = "AdminDashboard.aspx";
        }

    </script>

</asp:Content>