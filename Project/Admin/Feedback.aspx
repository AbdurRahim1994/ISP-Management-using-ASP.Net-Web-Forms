<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="Project.Admin.Feedback" %>

<%@ Register Src="~/FeedbackControl.ascx" TagPrefix="uc1" TagName="FeedbackControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <uc1:FeedbackControl runat="server" ID="FeedbackControl" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
</asp:Content>
