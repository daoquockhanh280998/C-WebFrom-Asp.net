<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductList.aspx.cs" Inherits="ProductList" %>

<%@ Register Src="~/UserControl/ucPagging.ascx" TagPrefix="uc1" TagName="ucPagging" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Danh Sách Sản Phẩm</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <div class="product-list">
        <div class="container">
            <div class="row">
                <asp:Repeater ID="Repeater_SubCat" runat="server">
                    <ItemTemplate>
                        <div class="col-md-12">
                            <aside class="styled_header">
                                <div class="title-line">
                                    <h3><%# Eval("Title") %></h3>
                                </div>
                            </aside>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <ul data-aos="fade-right">
                    <asp:Repeater ID="Repeater_Main" runat="server">
                        <ItemTemplate>
                            <li class="col-md-3 col-sm-6 col-12">
                                <div class="thumbnail ">
                                    <div class="carousel-inner">
                                        <a href="ProductDetail.html">
                                            <img src='<%# Eval("Avatar") %>' /></a>
                                        <span class=" product-sale"></span>
                                    </div>
                                </div>
                                <div class="thumbSetting">
                                    <div class="thumbTitle">
                                        <a href="ProductDetail.html" class="invarseColor">
                                            <%# Eval("Title") %></a>
                                    </div>
                                </div>
                                 <div class="thumbPrice">
                                        <span><%# Eval("Price") %>
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
                <%--<ul data-aos="fade-left">
                    <asp:Repeater ID="Repeater_SubSub" DataSource='<%# Eval("Sub") %>' runat="server">
                        <ItemTemplate>
                            <li class="col-md-3 col-sm-6 col-12">
                                <div class="thumbnail ">
                                    <div class="carousel-inner">
                                        <a href="ProductDetail.html">
                                            <img src='<%# Eval("Avatar") %>' /></a>
                                        <span class=" product-sale"></span>
                                    </div>
                                </div>
                                <div class="thumbSetting">
                                    <div class="thumbTitle">
                                        <a href="ProductDetail.html" class="invarseColor">
                                            <%# Eval("Title") %></a>
                                    </div>
                                    <div class="thumbPrice">
                                        <span><%# Eval("Price") %>
                                            <span class="strike-through"></span>
                                        </span>
                                    </div>
                                    <div class="thumbButtons">
                                        <button class="btn btn-primary btn-small">
                                            <i class="fa fa-shopping-cart"></i>
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>--%>

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

