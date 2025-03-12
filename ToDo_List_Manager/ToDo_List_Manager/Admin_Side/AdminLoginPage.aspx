<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="AdminLoginPage.aspx.vb" Inherits="ToDo_List_Manager.AdminLoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>TaskTrek - Admin Login</title>
    <link href="AdminStyleSheet.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="admin-auth-form">

        <h1>Admin Login Form</h1>

        <asp:TextBox ID="UsernameBox" Required="" Pattern="[A-Z_a-z]+" Title="Enter only Alphabets & Underscore" CssClass="admin-auth-form-textbox" PlaceHolder="Enter Username" runat="server" />
        <br />
        <br />
        <br />
        <asp:TextBox ID="PasswordBox" Required="" TextMode="Password" MinLength=8 CssClass="admin-auth-form-textbox" PlaceHolder="Enter Password" runat="server" />
        <br />
        <br />
        <br />
        <asp:Button Text="Login Now" ID="LoginButton" CssClass="admin-auth-btn"  runat="server" />
        <br />
        <br />
        <asp:Button Text="Go Back" ID="GoBackButton" OnClientClick="goBackToHomePage()" CssClass="admin-auth-back-btn" runat="server" />

    </div>

    <script>

        function goBackToHomePage() {
            window.location = '../Default.aspx';
        }

    </script>

</asp:Content>