<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="NewUserRegister.aspx.vb" Inherits="ToDo_List_Manager.NewUserRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>TaskTrek - User Register</title>
    <link href="ClientStyleSheet.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="client-auth-form">

        <h1>User Registration Form</h1>

        <asp:TextBox ID="UsernameBox" Required="" Pattern="[A-Z_a-z]+" Title="Enter only Alphabets & Underscore" CssClass="client-auth-form-textbox" PlaceHolder="Enter Username" runat="server" />
        <br />
        <br />
        <br />
        <asp:TextBox ID="EmailBox" Required="" TextMode="Email" CssClass="client-auth-form-textbox" PlaceHolder="Enter Email Address" runat="server" />
        <br />
        <br />
        <br />
        <asp:TextBox ID="PasswordBox" Required="" TextMode="Password" MinLength=8 CssClass="client-auth-form-textbox" PlaceHolder="Enter Password" runat="server" />
        <br />
        <br />
        <br />
        <asp:Button Text="Register Now" CssClass="client-auth-btn" ID="RegisterButton" runat="server" />
        <br />
        <br />
        <asp:Button Text="Go Back" ID="GoBackButton" OnClientClick="goBackToHomePage()" CssClass="client-auth-back-btn" runat="server" />

    </div>

    <script>

        function goBackToHomePage() {
            window.location = 'ClientHomePage.aspx';
        }

    </script>

</asp:Content>