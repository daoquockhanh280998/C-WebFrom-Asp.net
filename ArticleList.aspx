<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ArticleList.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/UserControl/ucPagging.ascx" TagPrefix="uc1" TagName="ucPagging" %>
<%@ Register Src="~/UserControl/ucCarousel.ascx" TagPrefix="uc1" TagName="ucCarousel" %>
<%@ Register Src="~/UserControl/ucArticleNews.ascx" TagPrefix="uc1" TagName="ucArticleNews" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Chăm Sóc Sen Đá</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <main>
        <div class="care-list">
            <div class="container">
                <h2>Hướng dẫn chăm sóc <span>sen đá</span></h2>
                <asp:Repeater ID="Repeater_Main" runat="server">
                    <ItemTemplate>
                    <div class="news-content" data-aos="fade-left">
                        <img src='<%# Eval("Avatar") %>' alt="" />
                        <div class="cap">
                            <h4>
                                <a href='<%# Eval("ArticleID","ArticleDetail.aspx?id={0}") %>'><%# Eval("Title") %>
                                </a>
                            </h4>
                            <div class="body-content">
                                <div>
                                    <i class="fa fa-calendar"></i>
                                    <time pubdate datetime="2019-09-22"><%# Eval("CreateTime","{0:dd/MM/yyyy HH:mm}") %></time>
                                </div>
                                <div>
                                    <i class="fa fa-file-text-o"></i>
                                    <a href="CareDetail.html">Hướng dẫn chăm sóc sen đá</a>
                                </div>
                            </div>
                            <a href='<%# Eval("ArticleID","ArticleDetail.aspx?id={0}") %>' class="btn">Xem tiếp</a>
                        </div>
                    </div>
                    </ItemTemplate>
                </asp:Repeater>
                <uc1:ucPagging runat="server" ID="ucPagging" />
            </div>
        </div>
    </main>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="Server">
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
        AOS.init({
            offset: 70,
            duration: 1000
        });
    </script>
    <script src="../js/jquery-3.0.0.js"></script>
    <script src="../js/jquery.smartmenus.js"></script>
    <script src="../js/jquery.smartmenus.bootstrap-4.js"></script>
    <link href="css/swiper.min.css" rel="stylesheet" />
    <script src="popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="../js/Script.js"></script>
</asp:Content>

