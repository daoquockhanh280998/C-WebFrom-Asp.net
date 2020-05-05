<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductDetail.aspx.cs" Inherits="ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <div class="product-detail">
        <div class="container">
            <div class="row">
                <asp:Repeater ID="Repeater_Main" runat="server">
                    <ItemTemplate>
                        <div class="col-md-6 left-product">
                            <section id="main-carousel">
                                <div id="main-carousel-container" class="carousel slide carousel-fade" data-ride="carousel" data-interval="2000">
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img src='<%# Eval("Avatar") %>' />
                                        </div>
                                        <asp:Repeater ID="Repeater_ImageList_Main" DataSource='<%# Eval("ImagesList").Split(";", StringSplitOptions.RemoveEmptyEntries) %>' runat="server">
                                            <ItemTemplate>
                                                <div class="carousel-item">
                                                    <img src='<%# Container.DataItem %>' />
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <div class="control">
                                        <a class="carousel-control-prev" href="#main-carousel-container" role="button" data-slide="prev">
                                            <i class="fa fa-chevron-circle-left"></i>
                                        </a>
                                        <a class="carousel-control-next" href="#main-carousel-container" role="button" data-slide="next">
                                            <i class="fa fa-chevron-circle-right"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb row">
                                    <div data-target="#main-carousel-container" data-slide-to="0" class="active col">
                                        <a href="#">
                                            <img class="img-fluid" src='<%# Eval("Avatar") %>' />
                                        </a>
                                    </div>
                                    <asp:Repeater ID="Repeater_ImageList_Sub" DataSource='<%# Eval("ImagesList").Split(";", StringSplitOptions.RemoveEmptyEntries) %>' runat="server">
                                        <ItemTemplate>
                                            <div data-target="#main-carousel-container" data-slide-to="1" class="col">
                                                <a href="#">
                                                    <img class="img-fluid" src='<%# Container.DataItem %>' />
                                                </a>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>
                            </section>
                        </div>
                        <div class="col-md-6 right-product">
                            <address>
                                <div class="titleHeader clearfix">
                                    <h3><%# Eval("Title") %></h3>
                                    <p><%# Eval("Price","{0:0,00}") %></p>
                                </div>
                            </address>
                            <div>
                                <div class="pddt">
                                    <label>Số lượng:</label>
                                    <input type="number" name="updates[]" min="1" id="updates_1043514223" value="1" onfocus="this.select();" class="tc item-quantity">
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-12 col-sm-6 col-xs-12">
                                        <div class="buttonDetail">
                                            <div class="btn btn-danger">
                                                <asp:LinkButton ID="LinkButton_AddToCart" OnClick="LinkButton_AddToCart_Click"
                                                        CommandArgument='<%# Eval("ProductID") %>' OnClientClick="alert('Đã Thêm Vào Giỏ Hàng')"
                                                        runat="server" class="btn btn-primary btn-small" >
                                                         <i class="fa fa-cart-plus"></i>
                                                        Thêm vào giỏ hàng
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-sm-6 col-xs-12">
                                        <div class="buttonDetail">
                                            <div class="btn btn-success">
                                                <a href="ProductList.html">
                                                    <i class="fa fa-check"></i>
                                                    Mua ngay
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <aside class="styled_header">
                                    <div class="title-line">
                                        <h4>Mô tả sản phẩm:</h4>
                                    </div>
                                    <p><%# Eval("Dercription") %></p>
                                </aside>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="row">
                <div class="Related-product">
                    <div class="col-md-12">
                        <aside class="styled_foot">
                            <div class="title-line">
                                <h4>Các sản phẩm liên quan:</h4>
                            </div>
                        </aside>
                    </div>
                    <ul>
                        <asp:Repeater ID="Repeater_Related" runat="server">
                            <ItemTemplate>
                                <li class="col-md-3 col-sm-6 col-12">
                                    <div class="thumbnail ">
                                        <div class="carousel-inner">
                                            <a href="ProductDetail.html">
                                                <img src='<%# Eval("Avatar") %>' />
                                            </a>
                                            <span class=" product-sale"></span>
                                        </div>
                                    </div>
                                    <div class="thumbSetting">
                                        <div class="thumbTitle">
                                            <a href='<%# Eval("ProductID","/ProdcutDetail.aspx?id={0}") %>' class="invarseColor"><%# Eval("Title") %></a>
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
                <div class="UnRelated-product">
                    <div class="col-md-12">
                        <aside class="styled_foot">
                            <div class="title-line">
                                <h4>Các sản phẩm Không Liên quan:</h4>
                            </div>
                        </aside>
                    </div>
                    <ul>
                        <asp:Repeater ID="Repeater_UnRelated" runat="server">
                            <ItemTemplate>
                                <li class="col-md-3 col-sm-6 col-12">
                                    <div class="thumbnail ">
                                        <div class="carousel-inner">
                                            <a href="ProductDetail.html">
                                                <img src='<%# Eval("Avatar") %>' />
                                            </a>
                                            <span class=" product-sale"></span>
                                        </div>
                                    </div>
                                    <div class="thumbSetting">
                                        <div class="thumbTitle">
                                            <a href='<%# Eval("ProductID","/ProdcutDetail.aspx?id={0}") %>' class="invarseColor"><%# Eval("Title") %></a>
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
            </div>
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

