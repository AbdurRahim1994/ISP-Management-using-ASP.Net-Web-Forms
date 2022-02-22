<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeedbackControl.ascx.cs" Inherits="Project.FeedbackControl" %>
<div class="container">
        <div class="jumbotron col-lg-8 m-auto badge-secondary" style="height:550px;">
            <table class="table table-borderless">  
                <tr>  
                    <td class="font-weight-bolder">To</td>  
                    <td>  
                        <asp:TextBox ID="to" runat="server" Width="99%" CssClass="form-control">  
                        </asp:TextBox>  
                    </td>  
                </tr>  
                <tr>  
                    <td class="font-weight-bolder">From</td>  
                    <td>  
                        <asp:TextBox ID="from" runat="server" Width="99%" CssClass="form-control">  
                        </asp:TextBox>  
                    </td>  
                </tr>
                <tr>  
                    <td class="font-weight-bolder">Subject</td>  
                    <td>  
                        <asp:TextBox ID="subject" runat="server" Width="99%" CssClass="form-control">

                        </asp:TextBox>  
                    </td>  
                </tr>  
                <tr>  
                    <td class="font-weight-bolder">Body</td>  
                    <td>  
                        <asp:TextBox ID="body" runat="server" Width="99%" Height="150px" TextMode="MultiLine" CssClass="form-control"> 
                        </asp:TextBox>  
                    </td>  
                </tr>  
                <tr>  
                    <td class="font-weight-bolder">File Upload</td>  
                    <td>  
                        <asp:FileUpload runat="server" AllowMultiple="true" ID="upload" CssClass="form-control">  
                        </asp:FileUpload>  
                    </td>  
                </tr>  
                <tr>  
                    <td></td>  
                    <td>  
                        <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btn btn-outline-success" OnClick="btnSend_Click"/>  
                    </td>  
                </tr>  
                <tr>  
                    <td></td>  
                    <td>  
                        <asp:Label ID="status" runat="server">  
                        </asp:Label>  
                    </td>  
                </tr>  
            </table>  
        </div>
    </div>
