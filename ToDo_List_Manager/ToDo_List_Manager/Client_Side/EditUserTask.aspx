<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Client_Side/ClientMasterPage.Master" CodeBehind="EditUserTask.aspx.vb" Inherits="ToDo_List_Manager.EditUserTask" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>TaskTrek - Edit Task</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="client-edit-task-container">

        <h1>Welcome, <asp:Label Text="Username Here" ID="UsernameLabel" runat="server" />,</h1>
        <p>This is the Edit Task Section, you can edit tasks here.</p>

        <div class="client-edit-task-form">

            <h1>Edit Task</h1>

            <asp:Label Text="Task Category" ID="TaskCatLabel" runat="server" />
            <br />
            <asp:DropDownList Required="" CssClass="client-edit-task-category" runat="server" ID="TaskCatList">
                <asp:ListItem Text="Select Category" Value="" />
                <asp:ListItem Text="Urgent" Value="Urgent" />
                <asp:ListItem Text="Important" Value="Important" />
                <asp:ListItem Text="Personal" Value="Personal" />
                <asp:ListItem Text="Work" Value="Work" />
                <asp:ListItem Text="Low Priority" Value="Low Priority" />
                <asp:ListItem Text="High Priority" Value="High Priority" />
            </asp:DropDownList>

            <br />
            <br />

            <asp:Label Text="Is Task Completed" ID="TaskCompletionLabel" runat="server" />
            <br />
            <asp:DropDownList Required="" CssClass="client-edit-task-category" runat="server" ID="TaskCompletionList">
                <asp:ListItem Text="Select Category" Value="" />
                <asp:ListItem Text="Yes" Value="Yes" />
                <asp:ListItem Text="No" Value="No" />
            </asp:DropDownList>

            <br />
            <br />

            <asp:Label Text="Your Task" ID="TaskLabel" runat="server" />
            <br />
            <asp:TextBox runat="server" Required="" CssClass="client-edit-task-box" Rows="5" ID="TaskBox" TextMode="MultiLine" />

            <br />
            <br />
            <asp:Button Text="Edit Task" CssClass="client-edit-task-button" ID="EditTaskButton" runat="server" />
            <br />
            <br />
            <button type="button" onclick="goBack()" class="client-edit-task-button">Cancel</button>

        </div>

    </div>

    <script>

        function goBack() {
            window.location = "TaskSection.aspx";
        }

    </script>

</asp:Content>