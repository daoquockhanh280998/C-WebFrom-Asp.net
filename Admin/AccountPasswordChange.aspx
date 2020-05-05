<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AccountPasswordChange.aspx.cs" Inherits="Admin_AccountPasswordChange" %>

<%@ Register Src="~/Admin/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>
<%@ Register Src="~/Admin/UserControl/ucScriptAdmin.ascx" TagPrefix="uc1" TagName="ucScriptAdmin" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <div class="main-content">
        <div class="workplace">
            <!--Tiêu đề-->
            <div class="page-header">
                <h1>Đổi Mật Khẩu
                </h1>
            </div>
            <!--Nội dung-->
            <div class="row col-md-12">
                <div class="col-md-12">
                    <div class="head clearfix">
                        <div class="isw-list col-md-11">
                            <i class="fa fa-list-ul"></i>
                            <h2>Mời Nhập Mật Khẩu Mới
                            </h2>
                        </div>
                        <ul class="buttons col-md-1">
                            <li>
                                <a title="Thêm mới" class="fa fa-plus-circle"></a>
                            </li>
                            <li>
                                <a title="Xóa chọn" class="fa fa-trash-alt"></a>
                            </li>
                        </ul>
                    </div>
                    <div class="block-fluid">

                        <div class="account-contact-info">
                            <div>
                                <!--Tên Đăng Nhập-->
                                <div class="bl clearfix">
                                    <div class="col-md-2">
                                        Tên Đăng Nhập:
                                    </div>
                                    <div class="col-md-3">
                                        <input runat="server" id="input_UserName" type="text" class="col-md-12" />

                                    </div>
                                    <div class="col-md-5 title">
                                        <span>Bạn đang đổi mật khẩu cho tài khoản này
                                        </span>
                                    </div>
                                </div>
                                <!--Mật khẩu mới-->
                                <div class="bl clearfix">
                                    <div class="col-md-2">
                                        Mật khẩu mới:
                                    </div>
                                    <div class="col-md-3">
                                        <input runat="server" id="input_Password" type="password" class="col-md-12" />

                                    </div>
                                    <div class="col-md-2">
                                        Nhập Lại Mật Khẩu:
                                    </div>
                                    <div class="col-md-3">
                                        <input runat="server" id="input_RePassword" type="password" class="col-md-12" />

                                    </div>
                                    <div class="col-md-2 title">
                                        <span>Nhập Mật Khẩu 2 Lần Giống Nhau
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Button-->
                        <div class="bl clearfix">
                            <div class="col-md-2 save">
                                <asp:LinkButton ID="LinkButton_Save" OnClick="LinkButton_Save_Click" runat="server" class="btn mysave">
                                    <i class="fa fa-save"></i>Lưu
                                </asp:LinkButton>
                            </div>
                            <!--Thông báo-->
                            <div class="alert col-md-10 ">
                                <uc1:ucMessage runat="server" ID="ucMessage" />
                            </div>

                        </div>
                    </div>
                    <div class="tar container">
                        <a href="AccountList.html" type="button" class="btn active">
                            <i class="fa fa-arrow-left"></i>Trở về trang chủ
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="Server">
    <uc1:ucScriptAdmin runat="server" ID="ucScriptAdmin" />
</asp:Content>

