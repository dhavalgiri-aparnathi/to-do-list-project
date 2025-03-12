<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Client_Side/ClientMasterPage.Master" CodeBehind="AddNewTask.aspx.vb" Inherits="ToDo_List_Manager.AddNewTask" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>TaskTrek - Add New Task</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="client-add-task-container">

        <h1>Welcome, <asp:Label Text="Username Here" ID="UsernameLabel" runat="server" />,</h1>
        <p>This is the add task section, you can create new tasks here.</p>

        <div class="client-add-task-form">

            <h1>Add a New Task</h1>

            <asp:Label Text="Select Task Category" ID="TaskCatLabel" runat="server" />
            <br />
            <asp:DropDownList Required="" CssClass="client-add-task-category" runat="server" ID="TaskCatList">
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
            <asp:Label Text="Enter Your Task Below" ID="TaskLabel" runat="server" />
            <br />
            <asp:TextBox runat="server" Required="" CssClass="client-add-task-box" Rows="5" ID="TaskBox" TextMode="MultiLine" />

            <br />
            <br />
            <asp:Button Text="Add Task" CssClass="client-add-task-button" ID="AddTaskButton" runat="server" />
            <br />
            <br />
            <button type="button" onclick="goBack()" class="client-add-task-button">Cancel</button>

        </div>

    </div>

    <script>

        function goBack() {
            window.location = "TaskSection.aspx";
        }

    </script>

</asp:Content>