<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucMenu.ascx.cs" Inherits="ucMenu" %>
<%@ Register Src="~/UserControl/ucSearch.ascx" TagPrefix="uc1" TagName="ucSearch" %>


<nav class="navbar navbar-expand-lg navbar-light sticky-top">
    <div class="container">
        <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="Default.aspx">
                        TRANG CHỦ
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#">
                        SẢN PHẨM
                      <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <asp:Repeater ID="Repeater_Main" runat="server">
                            <ItemTemplate>
                                <li class="dropdown">
                                    <a class="cod dropdown-item dropdown-toggle" href='<%# Eval("ProductMainCategoryID","/ProductList.aspx?mid={0}") %>'>
                                        <p> <%# Eval("Title") %><i class="fa fa-caret-right"></i></p>

                                    </a>

                                    <ul class="dropdown-menu">
                                        <asp:Repeater ID="Repeater_Sub" DataSource='<%# Eval("Sub") %>' runat="server">
                                            <ItemTemplate>
                                                <li>
                                                    <a class="dropdown-item" href='<%# Eval("ProductCategoryID","/ProductList.aspx?cid={0}") %>'>
                                                       <span> <%# Eval("Title") %></span>
                                                    </a>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Tutorial.aspx">
                        HƯỚNG DẪN MUA HÀNG
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ArticleList.aspx">
                        CHĂM SÓC
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Contact.aspx">
                        LIÊN HỆ
                    </a>
                </li>
            </ul>
        </div>

        <uc1:ucSearch runat="server" id="ucSearch" />

    </div>
</nav>
