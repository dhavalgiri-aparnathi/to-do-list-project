<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Client_Side/ClientMasterPage.Master" CodeBehind="LoginSuccess.aspx.vb" Inherits="ToDo_List_Manager.LoginSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>TaskTrek - User Home Page</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="client-login-success-image">

        <h1>TaskTrek - ToDo List Manager</h1>

        <div>Get Things Done</div>

    </div>

    <div class="client-login-success-content">

        Stay organized and boost your productivity with TaskTrek! 
        Our intuitive platform helps you manage your tasks efficiently, 
        ensuring that nothing slips through the cracks. 
        Whether you're juggling personal projects, work assignments, or daily errands, 
        TaskTrek is here to simplify your life. 
        Effortlessly create, edit, and delete tasks with just a few clicks. 
        With its user-friendly design, you can quickly customize your task lists to suit your unique workflow, 
        making it easier than ever to stay on top of your responsibilities.
        Experience a more streamlined approach to managing your tasks and reclaim your time with TaskTrek!

        <br />
        <br />

        <h2>Why Choose TaskTrek?</h2>

        <br />

        <ul style="margin-left: 20px;">
            <li>User Friendly Interface</li>
            <li>Efficient Task Management</li>
            <li>Customize Tasks Easily</li>
            <li>Simple Profile Management</li>
        </ul>

        <br />

        <asp:Button Text="Create a New Task Now" ID="CreateTaskButton" CssClass="client-login-success-create-task-button" runat="server" />

    </div>

</asp:Content>