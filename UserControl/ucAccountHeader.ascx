<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucAccountHeader.ascx.cs" Inherits="ucAccountHeader" %>


<div class="registration-login">
    <span runat="server" id="span_Login" class="cart-phone">
        <b><i class="fa fa-phone"></i>0354 249 595 |</b>
        <a href="Client.aspx">Đăng Nhập | Đăng Kí </a>
    </span>

    <span runat="server" id="span_info" class="cart-phone">
        <b><i class="fa fa-phone"></i>0354 249 595 |</b>
        <a href="~/ClientInfo.aspx" runat="server" id="a_name"> Tài Khoản Của Bạn</a>,
            <asp:LinkButton class="account-out" Text="Thoát" ID="LinkButton_Logout" OnClick="LinkButton_Logout_Click" runat="server" />
    </span>

    <div class="header-line">
        <span>Miễn Phí Ship Khi <a>ĐƠN HÀNG TRÊN 300K</a></span>
    </div>
</div>

