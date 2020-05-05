<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/UserControl/ucPagging.ascx" TagPrefix="uc1" TagName="ucPagging" %>
<%@ Register Src="~/UserControl/ucCarousel.ascx" TagPrefix="uc1" TagName="ucCarousel" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Trang Chủ</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <main>
        <uc1:ucCarousel runat="server" ID="ucCarousel" />

        <div class="product-list">
            <div class="container">
                <asp:Repeater ID="Repeater_Main" runat="server">
                    <ItemTemplate>
                        <div class="row" data-aos="fade-up">
                            <div class="col-md-12">
                                <aside class="styled_header">
                                    <div class="title-line">
                                        <h3><%# Eval("Title") %></h3>
                                    </div>
                                </aside>
                            </div>
                            <ul>
                                <asp:Repeater ID="Repeater_Sub" DataSource='<%# Eval("Sub") %>' runat="server">
                                    <ItemTemplate>
                                        <li class="col-md-3 col-sm-6 col-12">
                                            <div class="thumbnail ">
                                                <div class="carousel-inner">
                                                    <a href='<%# Eval("ProductID","/ProductDetail.aspx?id={0}") %>'>
                                                        <img src='<%# Eval("Avatar") %>' /></a>
                                                    <span class=" product-sale">chỉnh sale</span>
                                                </div>
                                            </div>
                                            <div class="thumbSetting">
                                                <div class="thumbTitle">
                                                    <a href='<%# Eval("ProductID","/ProductDetail.aspx?id={0}") %>' class="invarseColor">
                                                        <%# Eval("Title") %></a>
                                                </div>
                                                <div class="thumbPrice">
                                                    <span><%# Eval("Price") %>
                                                        <span class="strike-through"></span>
                                                    </span>
                                                </div>
                                                <div class="thumbButtons">
                                                    <asp:LinkButton ID="LinkButton_AddToCart" OnClick="LinkButton_AddToCart_Click"
                                                        CommandArgument='<%# Eval("ProductID") %>' OnClientClick="alert('Đã Thêm Vào Giỏ Hàng')"
                                                        runat="server" class="btn btn-primary btn-small" >
                                                         <i class="fa fa-shopping-cart"></i>
                                                        Thêm vào giỏ hàng
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                            <div class="col-md-12">
                                <div class="buttonMain">
                                    <div class="btn">
                                        <a href='<%# Eval("ProductMainCategoryID", "/ProductList.aspx?mid={0}") %>'>Xem thêm
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="service-home">
            <div class="container">
                <div class="row">
                    <div
                        class="serviceLeft col-12 col-sm-6 col-md-6"
                        data-aos="fade-right">
                        <a href="ProductList.aspx?PhuKien">
                            <img
                                class="img-fluid"
                                src="FileUpload/image/servicehome/servicehome.jpg" />
                        </a>
                    </div>
                    <div
                        class="serviceRight col-12 col-sm-6 col-md-6"
                        data-aos="fade-left">
                        <a href="ArticleList.aspx">
                            <img
                                class="img-fluid"
                                src="FileUpload/image/servicehome/servicehome1.jpg" />
                        </a>
                    </div>
                </div>
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

