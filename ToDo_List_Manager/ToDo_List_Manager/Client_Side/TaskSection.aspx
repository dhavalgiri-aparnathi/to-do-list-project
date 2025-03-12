<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Client_Side/ClientMasterPage.Master" CodeBehind="TaskSection.aspx.vb" Inherits="ToDo_List_Manager.TaskSection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>TaskTrek - User Task Section</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="client-task-section-container">

        <h1>Hey There, <asp:Label Text="Username Here" ID="UsernameLabel" runat="server" />,</h1>
        <p>Here are the tasks that you've created so far.</p>

        <asp:Label Text="You Have Not Created any Tasks !!!" ID="ErrorLabel" Visible="false" CssClass="client-task-section-notasklabel" runat="server" />

        <asp:GridView ID="GridView1" runat="server">
            
            <Columns>
            
                <asp:TemplateField HeaderText="Remove Task">
                
                    <ItemTemplate>
            
                        <asp:LinkButton ID="LinkButton1" CssClass="client-task-section-container-delete-btn" runat="server" CommandArgument='<%# Bind("TaskId") %>' CommandName="DeleteTaskBtn">Delete</asp:LinkButton>
                    
                    </ItemTemplate>
                
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Edit Task">
                
                    <ItemTemplate>
                    
                        <asp:LinkButton ID="LinkButton2" CssClass="client-task-section-container-update-btn" runat="server" CommandArgument='<%# Bind("TaskId") %>' CommandName="ChangeTaskBtn">Change</asp:LinkButton>
                    
                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>

        </asp:GridView>

        <asp:Button Text="Create a New Task" CssClass="client-task-section-new-button" ID="CreateNewTaskButton" runat="server" />

    </div>

</asp:Content>