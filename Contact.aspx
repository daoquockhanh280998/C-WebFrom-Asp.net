<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>
<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>
<%@ Register Src="~/UserControl/ucContactForm.ascx" TagPrefix="uc1" TagName="ucContactForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Trang Liên Hệ</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <div class="contact">
        <div class="container">
            <div class="row">
                <div class="contact-left col-md-8">
                    <div class="titleHeader clearfix">
                        <h2>địa chỉ</h2>
                    </div>
                    <div class="google-map">
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3916.6248925660666!2d106.66705853400438!3d10.991653936422155!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174d1121364badb%3A0xbaede6b51906c225!2zVsaw4budbiBzZW4gxJHDoSBUaOG7pyBE4bqndSBN4buZdA!5e0!3m2!1svi!2s!4v1582091042632!5m2!1svi!2s"></iframe>
                    </div>
                    <%--ucContactForm--%>
                    <uc1:ucContactForm runat="server" id="ucContactForm" />

                </div>
                <div class="contact-right col-md-4">
                    <div class="titleHeader clearfix">
                        <h2>Thông Tin Liên Hệ</h2>
                    </div>
                    <address>
                        <strong><i class="fa fa-thumb-tack"></i>Địa chỉ liên hệ:</strong><br />
                        Thuận Giao, Thuận An, T.Bình Dương
                    </address>
                    <address>
                        <strong><i class="fa fa-phone"></i>Điện thoại:</strong><br />
                        <span title="Phone">Nguyễn Mạnh Hùng:</span>
                       0354 249 595<br />
                        <span title="Phone">Nguyễn Mạnh Hùng:</span>
                        0354 249 595<br />
                    </address>
                    <address>
                        <strong><i class="fa fa-envelope-square"></i>EMail:</strong><br />
                        <span title="Email">Nguyễn Mạnh Hùng:</span>
                        <a href="#">D16C01AN2@gmail.com</a><br />
                    </address>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" Runat="Server">
</asp:Content>

