<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin_Side/AdminMaster.Master" CodeBehind="UserSection.aspx.vb" Inherits="ToDo_List_Manager.UserSection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>TaskTrek - Manage Users</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="admin-manage-users-container">

        <h1>View / Manage Users</h1>

        <asp:TextBox AutoPostBack="true" CausesValidation="false" runat="server" Placeholder="Search by Username" CssClass="admin-manage-users-search" ID="SearchBox" />

        <asp:Label Text="There are No users as of Now !!!" ID="ErrorLabel" CssClass="admin-manage-users-error-label" runat="server" />
         
        <asp:Panel Visible="false" ID="AddUserForm" CssClass="admin-manage-users-form" runat="server">

            <asp:TextBox ID="UsernameBox" CssClass="admin-manage-users-form-textbox" PlaceHolder="Enter Username" runat="server" />
            <asp:RequiredFieldValidator 
                Display="None" 
                ID="UsernameRequiredValidator" 
                ControlToValidate="UsernameBox" 
                ErrorMessage="Username is required." 
                CssClass="admin-manage-users-form-validation-error-message" 
                runat="server" />
            <asp:RegularExpressionValidator 
                Display="None" 
                ID="UsernameRegexValidator" 
                ControlToValidate="UsernameBox" 
                ErrorMessage="Username must contain only letters and underscores." 
                CssClass="admin-manage-users-form-validation-error-message" 
                runat="server" 
                ValidationExpression="^[a-zA-Z_]+$" />
            
            <br />
            <br />

            <asp:TextBox ID="EmailBox" CssClass="admin-manage-users-form-textbox" PlaceHolder="Enter Email Address" runat="server" />
             <asp:RequiredFieldValidator 
                Display="None"
                ID="EmailRequiredValidator" 
                ControlToValidate="EmailBox" 
                ErrorMessage="Email is required." 
                CssClass="admin-manage-users-form-validation-error-message" 
                runat="server"  />
            <asp:RegularExpressionValidator
                Display="None"
                ID="EmailRegexValidator"
                ControlToValidate="EmailBox"
                ErrorMessage="Email is Invalid."
                CssClass="admin-manage-users-form-validation-error-message"
                runat="server"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />

             <br />
             <br />
            
            <asp:TextBox ID="PasswordBox" TextMode="Password" CssClass="admin-manage-users-form-textbox" PlaceHolder="Enter Password" runat="server" />
            <asp:RequiredFieldValidator 
                Display="None"
                ID="PasswordRequiredValidator" 
                ControlToValidate="PasswordBox" 
                ErrorMessage="Password is required." 
                CssClass="admin-manage-users-form-validation-error-message" 
                runat="server"  />
            <asp:RegularExpressionValidator
                Display="None"
                ID="PasswordRegexValidator"
                ControlToValidate="PasswordBox"
                ErrorMessage="Password must be at least 8 characters long."
                CssClass="admin-manage-users-form-validation-error-message"
                runat="server"
                ValidationExpression="^.{8,}$" />

            <br />
            <br />
            
            <asp:Button Text="Add New User" ID="InsertNewUser" CssClass="admin-manage-users-form-btn" runat="server" />

            <asp:ValidationSummary runat="server" DisplayMode="List" CssClass="admin-manage-users-form-validation-error-message" />

        </asp:Panel>

        <asp:GridView runat="server" ID="GridView1">

            <Columns>

                <asp:TemplateField HeaderText="Remove Record">

                    <ItemTemplate>

                        <asp:LinkButton Text="Delete" ID="DeleteLinkButton" CommandName="DeleteBtn" CssClass="admin-manage-users-delete-btn" runat="server" CommandArgument='<%# Bind("Username") %>' />

                    </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="Update Record">

                     <ItemTemplate>

                        <asp:LinkButton Text="Update" ID="UpdateLinkButton" CommandName="UpdateBtn" CssClass="admin-manage-users-update-btn" runat="server" CommandArgument='<%# Bind("Id") %>' />
                         
                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>

        </asp:GridView>

        <asp:Button Text="Add Users" ID="AddUserButton" CssClass="admin-manage-users-add-btn" runat="server" />

        <asp:Button Text="View Users" CausesValidation="false" ID="ViewUsersButton" Visible="false" CssClass="admin-manage-users-add-btn" runat="server" />

        <br />
        <br />

        <button class="admin-manage-users-back-btn" type="button" onclick="navigateToDashboard()">Go Back</button>

    </div>

    <script>

        function navigateToDashboard() {
            window.location = "AdminDashboard.aspx";
        }

    </script>

</asp:Content>