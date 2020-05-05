<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucMenu.ascx.cs" Inherits="ucMenu" %>

<nav class="navbar-sidebar">
    <ul class="list-unstyled navbar__list">
        <li>
            <a href="Default.aspx">
                <i class="fas fa-home"></i>Home
            </a>
        </li>
        <li class="has-sub">
            <a class="js-arrow" href="#">
                <i class="fas fa-user"></i>Mục Tài Khoản
            </a>
            <ul class="list-unstyled navbar__sub-list js-sub-list">
                <li>
                    <a href="AccountCategoryList.aspx">Loại Tài Khoản</a>
                </li>
                <li>
                    <a href="AccountList.aspx">Danh Sách Tài Khoản</a>
                </li>
            </ul>
        </li>
        <li class="has-sub">
            <a class="js-arrow" href="#">
                <i class="fas fa-tachometer-alt"></i>Mục Sản Phẩm
            </a>
            <ul class="list-unstyled navbar__sub-list js-sub-list">
                <li>
                    <a href="/Admin/ProductMainCategoryList.aspx">Loại Sản Phẩm-Cấp Cha</a>
                </li>
                <li>
                    <a href="/Admin/ProductCategoryList.aspx">Loại Sản Phẩm-Cấp Con</a>
                </li>
                <li>
                    <a href="/Admin/ProductList.aspx">Danh Sách Sản Phẩm </a>
                </li>
            </ul>
        </li>
        <li class="has-sub">
            <a class="js-arrow" href="#">
                <i class="fas fa-newspaper"></i>Mục Tin Tức
            </a>
            <ul class="list-unstyled navbar__sub-list js-sub-list">
                <li>
                    <a href="ArticleMainCategoryList.aspx">Loại Tin Tức-Cấp Cha</a>
                </li>
                <li>
                    <a href="ArticleCategoryList.aspx">Loại Tin Tức-Cấp Con</a>
                </li>
                <li>
                    <a href="ArticleList.aspx">Danh Sách Tin Tức </a>
                </li>
            </ul>
        </li>
        <li class="has-sub">
            <a class="js-arrow" href="#">
                <i class="fas fa-images"></i>Mục Hình Ảnh
            </a>
            <ul class="list-unstyled navbar__sub-list js-sub-list">
                <li>
                    <a href="PictureMainCategoryList.aspx">Loại Hình Ảnh-Cấp Cha</a>
                </li>
                <li>
                    <a href="PictureCategoryList.aspx">Loại Hình Ảnh-Cấp Con</a>
                </li>
                <li>
                    <a href="PictureList.aspx">Danh Sách Hình Ảnh </a>
                </li>
            </ul>
        </li>
        <li class="has-sub">
            <a class="js-arrow" href="#">
                <i class="fas fa-images"></i>Mục Đơn Hàng
            </a>
            <ul class="list-unstyled navbar__sub-list js-sub-list">
                <li>
                    <a href="/Admin/OrderList.aspx">Danh Sách Đơn Hàng</a>
                </li>

            </ul>
        </li>
        <li class="has-sub">
            <a class="js-arrow" href="#">
                <i class="far fa-envelope"></i>Thư Liên Hệ
            </a>
            <ul class="list-unstyled navbar__sub-list js-sub-list">
                <li>
                    <a href="ContactCategoryList.aspx">Loại Thư Liên Hệ</a>
                </li>
                <li>
                    <a href="ContactList.aspx">Danh Sách Thư Liên Hệ</a>
                </li>
            </ul>
        </li>

    </ul>
</nav>
