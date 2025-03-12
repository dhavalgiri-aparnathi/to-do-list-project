<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin_Side/AdminMaster.Master" CodeBehind="AdminDashboard.aspx.vb" Inherits="ToDo_List_Manager.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>TaskTrek - Admin Dashboard</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="admin-db-welcome-message">

        Hello, <asp:Label ID="AdminUsernameLabel" ForeColor="Blue" Text="Username Here" runat="server" />,
        <br />
        Welcome to the dashboard.

    </div>

    <div class="admin-db-container">

        <a class="admin-db-section" href="UserSection.aspx">

            <img src="Admin_Images/users_logo.png" class="admin-db-img" alt="Image not Loaded" />

            <div class="admin-db-section-text"><asp:Label Text="99" ID="TotalUsersLabel" runat="server" /></div>

        </a>

        <a class="admin-db-section" href="UserTasks.aspx">

            <img src="Admin_Images/tasks_logo.png" class="admin-db-img" alt="Image not Loaded" />

            <div class="admin-db-section-text"><asp:Label Text="99" ID="TotalTasksLabel" runat="server" /></div>

        </a>

        <a class="admin-db-section" href="UserFeedbacks.aspx">

            <img src="Admin_Images/users_feedback.png" class="admin-db-img" alt="Image not Loaded" />

            <div class="admin-db-section-text"><asp:Label Text="99" ID="TotalFeedbacksLabel" runat="server" /></div>

        </a>

    </div>

    <!-- ____________________________________________________________ -->

    <div class="admin-db-container" style="margin-top: 70px;">

        <a class="admin-db-section" href="AdminAccountSection.aspx">

            <img src="Admin_Images/my_account.png" class="admin-db-img" alt="Image not Loaded" />

            <div class="admin-db-section-text">Your Account</div>

        </a>

        <a class="admin-db-section" href="AddAdminSection.aspx">

            <img src="Admin_Images/add_admin.png" class="admin-db-img" alt="Image not Loaded" />

            <div class="admin-db-section-text">View / Add Admins</div>

        </a>

        <asp:LinkButton ID="LogoutButton" runat="server" CssClass="admin-db-section">

            <img src="Admin_Images/logout_icon.png" class="admin-db-img" alt="Image not Loaded" />
                
            <div class="admin-db-section-text" style="color:red">Logout</div>

        </asp:LinkButton>

    </div>

</asp:Content>