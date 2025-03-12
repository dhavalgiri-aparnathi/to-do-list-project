<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin_Side/AdminMaster.Master" CodeBehind="AddAdminSection.aspx.vb" Inherits="ToDo_List_Manager.AddAdminSection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="admin-add-section-container">

        <h1>View / Add new Admins</h1>

        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>

        <asp:Panel Visible="false" ID="AddAdminForm" CssClass="admin-add-section-form" runat="server">

            <asp:TextBox ID="UsernameBox" CssClass="admin-add-section-form-textbox" PlaceHolder="Enter Username" runat="server" />
            <asp:RequiredFieldValidator 
                Display="None" 
                ID="UsernameRequiredValidator" 
                ControlToValidate="UsernameBox" 
                ErrorMessage="Username is required." 
                CssClass="admin-add-form-validation-error-message" 
                runat="server" />
            <asp:RegularExpressionValidator 
                Display="None" 
                ID="UsernameRegexValidator" 
                ControlToValidate="UsernameBox" 
                ErrorMessage="Username must contain only letters and underscores." 
                CssClass="admin-add-form-validation-error-message" 
                runat="server" 
                ValidationExpression="^[a-zA-Z_]+$" />
            
            <br />
            <br />
            <br />
            
            <asp:TextBox ID="PasswordBox" TextMode="Password" CssClass="admin-add-section-form-textbox" PlaceHolder="Enter Password" runat="server" />
            <asp:RequiredFieldValidator 
                Display="None"
                ID="PasswordRequiredValidator" 
                ControlToValidate="PasswordBox" 
                ErrorMessage="Password is required." 
                CssClass="admin-add-form-validation-error-message" 
                runat="server"  />
            <asp:RegularExpressionValidator
                Display="None"
                ID="PasswordRegexValidator"
                ControlToValidate="PasswordBox"
                ErrorMessage="Password must be at least 8 characters long."
                CssClass="admin-add-form-validation-error-message"
                runat="server"
                ValidationExpression="^.{8,}$" />

            <br />
            <br />
            
            <asp:Button Text="Add New Admin" ID="InsertNewAdmin" CssClass="admin-add-section-form-btn" runat="server" />

            <asp:ValidationSummary runat="server" DisplayMode="List" CssClass="admin-add-form-validation-error-message" />

        </asp:Panel>

        <asp:Button Text="Add Admin" ID="AddAdminButton" CssClass="admin-add-section-add-btn" runat="server" />

        <asp:Button Text="View Admins" CausesValidation="false" ID="ViewAdminsButton" Visible="false" CssClass="admin-add-section-add-btn" runat="server" />

        <br />
        <br />

        <asp:Button Text="Go Back" CausesValidation="false" CssClass="admin-add-section-back-btn" ID="GoBackButton" runat="server" />

    </div>
    
</asp:Content>