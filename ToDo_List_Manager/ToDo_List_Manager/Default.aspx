<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="Default.aspx.vb" Inherits="ToDo_List_Manager._Default1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>TaskTrek - Home Page</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="home-page-button-group">

        <asp:Button Text="User / Client" ID="UserPanelButton" CssClass="user-panel-btn" runat="server" />
        <br />
        <br />
        <br />
        <br />
        <asp:Button Text="Admin" ID="AdminPanelButton" CssClass="admin-panel-btn" runat="server" />

    </div>

</asp:Content>