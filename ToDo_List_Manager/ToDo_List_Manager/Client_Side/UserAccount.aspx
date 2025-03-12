<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Client_Side/ClientMasterPage.Master" CodeBehind="UserAccount.aspx.vb" Inherits="ToDo_List_Manager.UserAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>TaskTrek - User Account</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="client-user-account-container">

        <h1>Your Account Details are as below: </h1>

        <br />

        <table>

            <tr>
                <td><b>Username</b></td>
                <td><asp:Label Text="Username Here" ID="UsernameLabel" runat="server" /></td>
            </tr>

            <tr>
                <td><b>Email</b></td>
                <td><asp:Label Text="Email Here" ID="EmailLabel" runat="server" /></td>
            </tr>

            <tr>
                <td><b>Password</b></td>
                <td><asp:Label Text="Password Here" ID="PasswordLabel" runat="server" /></td>
            </tr>

        </table>

        <br />
        <br />
        <br />

        <asp:Button Text="Edit Account Details" ID="EditButton" CssClass="client-user-account-editbtn" runat="server" />

        <br />
        <br />

        <asp:Button Text="Delete Your Account" OnClientClick="return confirm('Are you sure? Do you want to delete your account? You cannot undo it');" ID="DeleteButton" CssClass="client-user-account-deletebtn" runat="server" />

    </div>

</asp:Content>