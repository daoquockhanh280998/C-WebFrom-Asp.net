<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductSearch.aspx.cs" Inherits="ProductSearch" %>

<%@ Register Src="~/UserControl/ucPagging.ascx" TagPrefix="uc1" TagName="ucPagging" %>
<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>
<%@ Register Src="~/UserControl/ucSearch.ascx" TagPrefix="uc1" TagName="ucSearch" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Trang Tìm Kiếm</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <div class="product-list">
        <div class="container">
            <uc1:ucMessage runat="server" ID="ucMessage" />
            <div class="row">
                <ul data-aos="fade-left">
                    <asp:Repeater ID="Repeater_Main" runat="server">
                        <ItemTemplate>
                            <li class="col-md-3 col-sm-6 col-12">
                                <div class="thumbnail ">
                                    <div class="carousel-inner">
                                        <a href='<%# Eval("ProductID","ProductDetail.aspx?id={0}") %>'>
                                            <img src='<%# Eval("Avatar") %>' /></a>
                                        <span class=" product-sale"></span>
                                    </div>
                                </div>
                                <div class="thumbSetting">
                                    <div class="thumbTitle">
                                        <a href='<%# Eval("ProductID","ProductDetail.aspx?id={0}") %>' class="invarseColor"><%# Eval("Title") %></a>
                                    </div>
                                </div>
                                <div class="thumbPrice">
                                    <span><%# Eval("Price","{0:0,00}") %>
                                        <span class="strike-through"></span>
                                    </span>
                                </div>
                                <div class="thumbButtons">
                                    <button class="btn btn-primary btn-small">
                                        <i class="fa fa-shopping-cart"></i>
                                        Thêm vào giỏ hàng
                                    </button>
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>

                </ul>
            </div>
            <uc1:ucPagging runat="server" ID="ucPagging" />

        </div>
    </div>
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

