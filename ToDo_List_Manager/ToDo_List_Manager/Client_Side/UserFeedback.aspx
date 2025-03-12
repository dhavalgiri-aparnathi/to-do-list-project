<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Client_Side/ClientMasterPage.Master" CodeBehind="UserFeedback.aspx.vb" Inherits="ToDo_List_Manager.UserFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>TaskTrek - User Feedback</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="client-feedback-container">

        <h1>Welcome, <asp:Label Text="Username Here" ID="UsernameLabel" runat="server" />,</h1>
        <p>Your details are securely stored in our system, so there's no need to enter it again.</p>

        <div class="client-feedback-form">

            <h1>Your Feedback is Valuable for us</h1>

            <asp:Label Text="How would you rate us?" ID="RatingLabel" runat="server" />
            <br />
            <asp:DropDownList Required="" CssClass="client-feedback-list" runat="server" ID="RatingList">
                <asp:ListItem Text="Select Rating" Value="" />
                <asp:ListItem Text="1 - Poor" Value="1 - Poor" />
                <asp:ListItem Text="2 - Fair" Value="2 - Fair" />
                <asp:ListItem Text="3 - Good" Value="3 - Good" />
                <asp:ListItem Text="4 - Very Good" Value="4 - Very Good" />
                <asp:ListItem Text="5 - Excellent" Value="5 - Excellent" />
            </asp:DropDownList>

            <br />
            <br />

            <asp:Label Text="Please Enter Your Feedback" ID="FeedbackLabel" runat="server" />
            <br />
            <asp:TextBox runat="server" Required="" CssClass="client-feedback-box" Rows="5" ID="FeedBackBox" TextMode="MultiLine" />

            <br />
            <br />

            <asp:Button Text="Submit Feedback" CssClass="client-feedback-button" ID="SubmitFeedbackButton" runat="server" />

        </div>

    </div>

</asp:Content>