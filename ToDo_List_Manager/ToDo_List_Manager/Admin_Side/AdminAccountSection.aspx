<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin_Side/AdminMaster.Master" CodeBehind="AdminAccountSection.aspx.vb" Inherits="ToDo_List_Manager.AdminAccountSection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>TaskTrek - Manage Your Account</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="admin-account-container">

        <h1>Your Account Details are as below: </h1>

        <br />

        <table>

            <tr>
                <td><b>Username</b></td>
                <td><asp:Label Text="Username Here" ID="UsernameLabel" runat="server" /></td>
            </tr>

            <tr>
                <td><b>Password</b></td>
                <td><asp:Label Text="Password Here" ID="PasswordLabel" runat="server" /></td>
            </tr>

        </table>

        <br />
        <br />
        <br />

        <asp:Button Text="Edit Account Details" ID="EditButton" CssClass="admin-account-editbtn" runat="server" />

        <br />
        <br />

        <asp:Button Text="Delete Your Account" OnClientClick="return confirm('Are you sure? Do you want to delete your account? You cannot undo it');" ID="DeleteButton" CssClass="admin-account-deletebtn" runat="server" />

        <br />
        <br />

        <asp:Button Text="Go Back" CssClass="admin-account-back-btn" ID="GoBackButton" runat="server" />

    </div>

</asp:Content>