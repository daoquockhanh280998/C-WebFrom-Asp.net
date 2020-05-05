<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AccountEdit.aspx.cs" Inherits="Admin_Default" %>

<%@ Register Src="~/Admin/UserControl/ucScriptAdmin.ascx" TagPrefix="uc1" TagName="ucScriptAdmin" %>
<%@ Register Src="~/Admin/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <div class="main-content">
        <div class="workplace">
            <!--Tiêu đề-->
            <div class="page-header">
                <h1>Thêm / Chỉnh sửa thông tin tài khoản
                </h1>
            </div>
            <!--Nội dung-->
            <div class="col-md-12">
                <div class="head clearfix">
                    <div class="isw-list col-md-11">
                        <i class="fa fa-list-ul"></i>
                        <h2>Thêm / Chỉnh Sửa Tài Khoản
                        </h2>
                    </div>

                </div>
                <div class="block-fluid">
                    <div class="account-category-post">

                        <div class="bl bl clearfix">
                            <div class="col-md-2">
                                Chọn Loại tài khoản:
                            </div>
                            <div class="col-md-2 form-select">
                                <asp:DropDownList ID="DropDownList_Category" runat="server" />
                            </div>
                        </div>
                        <!--Username-->
                        <div class="bl clearfix">
                            <div class="col-md-2">
                                Tên đăng nhập:
                            </div>
                            <div class="col-md-12">
                                <input runat="server" id="input_UserName" type="text" class="tipb" />
                                <div class="title">
                                    <span>Tên đăng nhập và mật khẩu vui lòng không chứa dấu, không cách và không ký hiệu đặc biệt như: !@#$%^&*...</span>
                                </div>
                            </div>
                        </div>
                        <!--Mật khẩu-->
                        <div class="bl clearfix">
                            <div class="col-md-2">
                                Mật khẩu:
                            </div>
                            <div class="col-md-3">
                                <input runat="server" id="input_Password" type="password" />
                            </div>
                            <div class="col-md-1">
                                Nhập lại:
                            </div>
                            <div class="col-md-5">
                                <input runat="server" id="input_RePassword" type="password" />
                                <div class="title">
                                    <span>Mật khẩu dùng để đăng nhập, cần nhập 2 lần giống nhau.</span>
                                </div>
                            </div>
                        </div>
                        <!--Trạng thái-->
                        <div class="bl clearfix">
                            <div class="col-md-2">
                                Trạng thái:
                            </div>
                            <div class="col-md-10" style="display: flex;">
                                <label class="checkbox inline col-md-6">
                                    <input runat="server" id="radio_Active" name="raido_Status" type="radio" checked />
                                    <span>Hiển thị</span>
                                </label>
                                <label class="checkbox inline col-md-6">
                                    <input runat="server" id="radio_Lock" type="radio" />
                                    <span>Tạm ẩn</span>
                                </label>
                            </div>
                        </div>
                        <!--Họ tên-->
                        <div class="bl clearfix">
                            <div class="col-md-2">
                                Họ tên:
                            </div>
                            <div class="col-md-10">
                                <input runat="server" id="input_FullName" class="col-md-8" type="text" />
                                <div class="title">
                                    <span>Nhập họ tên đầy đủ của tài khoản. Gõ tiếng Việt có dấu. VD:Nguyễn Trọng Hiếu</span>
                                </div>
                            </div>
                        </div>
                        <!--Email-->
                        <div class="bl clearfix">
                            <div class="col-md-2">
                                Email:
                            </div>
                            <div class="col-md-10">
                                <input runat="server" id="input_Email" class="col-md-8" type="text" />
                                <div class="title">
                                    <span>Email dùng để liên lạc hoặc nhận lại mật khẩu (nếu bị mất).
                                                    VD: mrhieuit@gmail.com
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="account-contact-info">
                            <div>
                                <!--Số điện thoại-->
                                <div class="bl clearfix">
                                    <div class="col-md-2">
                                        Số điện thoại:
                                    </div>
                                    <div class="col-md-10">
                                        <input runat="server" id="input_Mobi" type="text" />
                                        <div class="title">
                                            <span>Số điện thoại liên lạc của tài khoản. VD: 0979 876 678
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <!--Địa chỉ-->
                                <div class="bl clearfix">
                                    <div class="col-md-2">
                                        Địa chỉ liên hệ:
                                    </div>
                                    <div class="col-md-10 form-select">
                                        <textarea runat="server" id="textarea_Address" class="col-md-12" type="text" />
                                        <div class="title">
                                            <span>Bạn có thể nhập địa chỉ nhà hoặc tên phòng ban nơi tài khoản làm việc hoặc thông tin mô tả thêm...</span>
                                        </div>
                                    </div>
                                </div>
                                <!--Hình đại diện-->
                                <div class="bl clearfix">
                                    <div class="col-md-2">
                                        Hình đại diện:
                                    </div>
                                    <div class="col-md-10">
                                        <a runat="server" id="a_Avatar" href="images/no_image.png" class="fancybox lightbox-preview col-md-3">
                                            <img runat="server" id="img_Avatar" class="img_Avatar"
                                                src="images/no_image.png" alt="avatar" />
                                        </a>
                                        <br />
                                        <asp:FileUpload runat="server" ID="FileUpload_Avatar"
                                            onchange="document.getElementsByClassName('img_Avatar')[0].src = window.URL.createObjectURL(this.files[0])" class="skip" />
                                        <br />
                                        <div class="title">
                                            <span>Hình đại diện cho loại tài khoản. Bạn có thể upload hình mới nếu muốn.
                                                        Các Loại file hỗ trợ : *.jpg, *.jpeg, *.gif, *.png
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <!--Giới tính-->
                                <div class="bl clearfix">
                                    <div class="col-md-2">
                                        Giới tính:
                                    </div>
                                    <div class="col-md-10">
                                        <label class="checkbox inline">
                                            <input runat="server" id="radio_Male" name="gender" type="radio" checked />
                                            Nam
                                        </label>
                                        <label class="checkbox inline">
                                            <input runat="server" id="radio_Female" name="gender" type="radio" />
                                            Nữ
                                        </label>
                                    </div>
                                </div>

                            </div>
                            <div class="account-other-info">
                                <div class="bl clearfix">
                                    <div class="col-md-2">
                                        Ngày giờ tạo tài khoản:
                                    </div>
                                    <div class="col-md-10">
                                        <input runat="server" id="input_CreateTime" type="text" readonly />
                                        <div class="title">
                                            <span>Tự động lưu ngày giờ tạo tài khoản theo giờ hệ thống. Không cho phép chỉnh sửa
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Button-->
                            <div class="bl clearfix">
                                <div class="col-md-2 save">

                                    <asp:LinkButton  runat="server" ID="LinkButton_Save" OnClick="LinkButton_Save_Click" class="btn mysave" >
                                           <i class="fa fa-save"></i>Lưu
                                    </asp:LinkButton>
                                </div>
                                <!--Thông báo-->
                                <div class="alert col-md-10 ">
                                    <uc1:ucMessage runat="server" ID="ucMessage" />
                                </div>

                            </div>
                        </div>
                    </div>
                    <!--Link trở về-->
                    <div class="tar container">
                        <a href="AccountList.aspx" type="button" class="btn active">
                            <i class="fa fa-arrow-left"></i>Trở về trang danh sách tài khoản
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

