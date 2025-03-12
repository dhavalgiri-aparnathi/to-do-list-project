<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="ClientHomePage.aspx.vb" Inherits="ToDo_List_Manager.ClientHomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>TaskTrek - Client Side</title>
    <link href="ClientStyleSheet.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="client-home-page-button-group">

        <asp:Button Text="Existing User" ID="ExistingUserButton" CssClass="old-user-btn" runat="server" />
        <br />
        <br />
        <br />
        <br />
        <asp:Button Text="New User" ID="NewUserButton" CssClass="new-user-btn" runat="server" />
         <br />
        <br />
        <br />
        <br />
        <asp:Button Text="Go Back" ID="GoBackButton" CssClass="new-user-btn" runat="server" />

    </div>

</asp:Content>