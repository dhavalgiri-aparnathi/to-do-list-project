<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin_Side/AdminMaster.Master" CodeBehind="UserFeedbacks.aspx.vb" Inherits="ToDo_List_Manager.UserFeedbacks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>TaskTrek - User Feedbacks</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="admin-feedback-container">

        <h1>User Feedbacks are as below:</h1>

        <asp:Label CssClass="admin-feedback-error-label" Text="There are no user feedbacks as of now !!!" ID="ErrorLabel" runat="server" />

        <asp:GridView runat="server" ID="GridView1">

            <Columns>

                <asp:TemplateField HeaderText="Delete Record">

                    <ItemTemplate>

                        <asp:LinkButton ID="DeleteButton" CssClass="admin-feedback-delete-btn" runat="server" CommandName="DeleteUserFeedback" CommandArgument='<%# Bind("Id") %>'>Delete</asp:LinkButton>

                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>

        </asp:GridView>

        <asp:Button Text="Go Back" ID="GoBackButton" CssClass="admin-feedback-back-btn" runat="server" />

    </div>

</asp:Content>