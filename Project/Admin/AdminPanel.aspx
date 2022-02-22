<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="Project.Admin.AdminPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <style type="text/css">
        #feedback{
            background: #0d0442;
            padding: 7% 10%;
        }

        .hr-style{
            border: 5px dotted white;
            border-bottom: none;
            width: 50px;
        }

        .carousel-item{
            padding: 5% 15%;
            text-align: center;
            font-style: italic;
        }

        .feedback-img{
            
            height: 350px;
        }

        .carousel-indicators{
            bottom: -20px;
        }
    </style>
    <div class="container text-white">
        <section id="feedback">
            <div class="section-title">
                <h3 class="text-center">Extreme Net Boradband Service Provider</h3>
                <hr class="hr-style"/>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="5000" data-pause="hover">
                        <ol class="carousel-indicators">
                          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                          <div class="carousel-item active">
                                
                                <img class="d-block w-100 feedback-img" src="../ProjectLogo/ISP Icon 4.jpg"/>
                                <div class="blockquote-footer">
                                    Developed by MD. Abdur Rahim
                                    Trainee at ESAD-CS
                                </div>
                            </div>
                          <div class="carousel-item">
                            
                            <img class="d-block w-100 feedback-img" src="../ProjectLogo/ISP Icon 3.jpg"/>
                            <div class="blockquote-footer">
                                    Developed by MD. Abdur Rahim
                                    Trainee at ESAD-CS
                                </div>
                          </div>
                          <div class="carousel-item">
                            
                            <img class="d-block w-100 feedback-img" src="../ProjectLogo/ISP Icon2.jpg"/>
                            <div class="blockquote-footer">
                                    Developed by MD. Abdur Rahim
                                    Trainee at ESAD-CS
                                </div>
                          </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                          <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                          <span class="carousel-control-next-icon" aria-hidden="true"></span>
                          <span class="sr-only">Next</span>
                        </a>
                      </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
</asp:Content>

