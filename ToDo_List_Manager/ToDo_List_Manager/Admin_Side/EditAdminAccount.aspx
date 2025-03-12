<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin_Side/AdminMaster.Master" CodeBehind="EditAdminAccount.aspx.vb" Inherits="ToDo_List_Manager.EditAdminAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>TaskTrek - Edit Account</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="admin-edit-account-container">

        <div class="admin-edit-account-form">

            <h1>Edit Your Account</h1>

            <asp:TextBox ID="UsernameBox" Required="" Pattern="[A-Z_a-z]+" Title="Enter only Alphabets & Underscore" CssClass="admin-edit-account-form-textbox" PlaceHolder="Enter Username" runat="server" />
            <br />
            <br />
            <br />
            <asp:TextBox ID="PasswordBox" Required="" MinLength="8" CssClass="admin-edit-account-form-textbox" PlaceHolder="Enter Password" runat="server" />
            <br />
            <br />
            <br />
            <asp:Button Text="Update Account" ID="UpdateAccountButton" CssClass="admin-edit-account-update-btn" runat="server" />
            <br />
            <br />
            <button type="button" class="admin-edit-account-cancel-btn" onclick="goBack()">Cancel Editing</button>

        </div>

    </div>

    <script type="text/javascript">

        function goBack() {
            window.location = "AdminAccountSection.aspx";
        }

    </script>

</asp:Content>