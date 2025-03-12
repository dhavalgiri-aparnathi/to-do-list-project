<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin_Side/AdminMaster.Master" CodeBehind="UpdateUserAccount.aspx.vb" Inherits="ToDo_List_Manager.UpdateUserAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>TaskTrek - Update User</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="admin-update-user-form">

        <h1>User Updation Form</h1>

        <asp:TextBox ID="UsernameBox" Required="" Pattern="[A-Z_a-z]+" Title="Enter only Alphabets & Underscore" CssClass="admin-update-user-form-textbox" PlaceHolder="Enter Username" runat="server" />
        <br />
        <br />
        <br />
        <asp:TextBox ID="EmailBox" Required="" TextMode="Email" CssClass="admin-update-user-form-textbox" PlaceHolder="Enter Email Address" runat="server" />
        <br />
        <br />
        <br />
        <asp:TextBox ID="PasswordBox" Required="" MinLength=8 CssClass="admin-update-user-form-textbox" PlaceHolder="Enter Password" runat="server" />
        <br />
        <br />
        <br />
        <asp:Button Text="Update Data" CssClass="admin-update-user-form-btn" ID="UpdateButton" runat="server" />
        <br />
        <br />
        <button type="button" class="admin-update-user-form-back-btn" onclick="navigateToUserSection()">Go Back</button>

    </div>

    <script>

        function navigateToUserSection() {
            window.location = 'UserSection.aspx';
        }

    </script>

</asp:Content>