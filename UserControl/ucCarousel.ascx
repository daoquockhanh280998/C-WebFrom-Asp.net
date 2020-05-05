<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucCarousel.ascx.cs" Inherits="ucCarousel" %>

<div
    id="carouselExampleIndicators"
    class="carousel slide"
    data-ride="carousel">

    <ol class="carousel-indicators">
        <li
            data-target="#carouselExampleIndicators"
            data-slide-to="0"
            class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img runat="server" id="img_MainImages" src="../FileUpload/image/trangbia/3.jpg" alt="First slide" />
            <div class="carousel-caption">
                <h3>Chào mừng bạn đến</h3>
                <h1>SEN ĐÁ <span>BÌNH DƯƠNG</span></h1>
                <div class="btn">
                    <a href="Product.html">Xem thêm
                    </a>
                </div>
            </div>
        </div>
        <asp:Repeater ID="Repeater_Main" runat="server">
            <ItemTemplate>
                <div class="carousel-item">
                    <img
                        class="d-block w-100"
                        src='<%# Eval("Avatar") %>'
                        alt="Second slide" />
                    <div class="carousel-caption">
                        <h3><%# Eval("Title") %></h3>
                        <h1><%# Eval("Description") %></h1>
                        <div class="btn">
                            <a href='<%#Eval("Link") %>'>Xem thêm
                            </a>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <a
        class="carousel-control-prev"
        href="#carouselExampleIndicators"
        role="button"
        data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a
        class="carousel-control-next"
        href="#carouselExampleIndicators"
        role="button"
        data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>

</div>
