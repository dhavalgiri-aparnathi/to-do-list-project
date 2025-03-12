<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Client_Side/ClientMasterPage.Master" CodeBehind="EditAccountDetails.aspx.vb" Inherits="ToDo_List_Manager.EditAccountDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>TaskTrek - Edit User Account</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="client-edit-account-container">

        <div class="client-edit-account-form">

            <h1>Edit Your Account</h1>

            <asp:TextBox ID="UsernameBox" Required="" Pattern="[A-Z_a-z]+" Title="Enter only Alphabets & Underscore" CssClass="client-edit-account-form-textbox" PlaceHolder="Enter Username" runat="server" />
            <br />
            <br />
            <br />
            <asp:TextBox ID="EmailBox" Required="" TextMode="Email" CssClass="client-edit-account-form-textbox" PlaceHolder="Enter Email Address" runat="server" />
            <br />
            <br />
            <br />
            <asp:TextBox ID="PasswordBox" Required="" MinLength="8" CssClass="client-edit-account-form-textbox" PlaceHolder="Enter Password" runat="server" />
            <br />
            <br />
            <br />
            <asp:Button Text="Update Account" ID="UpdateAccountButton" CssClass="client-edit-account-update-btn" runat="server" />
            <br />
            <br />
            <button type="button" class="client-edit-account-cancel-btn" onclick="goBack()">Cancel Editing</button>

        </div>

    </div>

    <script type="text/javascript">

        function goBack() {
            window.location = "UserAccount.aspx";
        }

    </script>


</asp:Content>