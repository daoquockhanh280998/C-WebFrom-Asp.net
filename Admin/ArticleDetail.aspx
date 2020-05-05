<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ArticleDetail.aspx.cs" Inherits="Admin_Default" %>

<%@ Register Src="~/Admin/UserControl/ucScriptAdmin.ascx" TagPrefix="uc1" TagName="ucScriptAdmin" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <div class="main-content">
       <div class="workplace">
                    <!--Tiêu đề-->
                    <div class="page-header">
                        <h1>
                            Thêm / Chỉnh sửa thông tin tài khoản
                        </h1>
                    </div>
                    <!--Nội dung-->
                    <div class="row col-md-12">
                        <div class="col-md-3">
                            <div class="head clearfix">
                                <div class="isw-folder">
                                    <i class="fa fa-folder-open"></i>
                                <h2>
                                    Loại tin tức
                                </h2>
                                </div>
                            </div>
                            <div class="block-fluid" style="background-color: #fff;">
                                <div class="clearfix" style="padding: 7px 16px; border-bottom: 1px solid rgba(153, 153, 153, 0.295);">
                                    <select style="width: 100%; height: 35px;">
                                    </select>
                                    <span style="text-align: center; display: block;">Chọn Loại Cấp Cha.</span>
                                </div>
                                <div class="clearfix" style="padding: 7px 16px;">
                                    <select size="4" class="category" style="height:475px; margin-top: 5px;">
                                    </select>
                                    <span style="text-align: center; display: block;">Chọn Loại để xem.</span>
                                </div>
                            </div>
                        </div>
                    <div class="col-md-9">
                        <div class="head clearfix">
                                    <div class="isw-list col-md-11">
                                        <i class="fa fa-list-ul"></i>
                                        <h2>
                                            Đăng / cập nhật tin tức
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
                                <h3>
                                    Thông tin đăng nhập
                                </h3>
                                <div class="account-category-post">

                                    <div class="bl bl clearfix">
                                        <div class="col-md-2">
                                            Chọn Loại tài khoản:
                                        </div>
                                        <div class="col-md-2 form-select">
                                            <select></select>
                                        </div>
                                    </div>
                                    <!--Username-->
                                    <div class="bl clearfix">
                                        <div class="col-md-2">
                                            Tên đăng nhập:
                                        </div>
                                        <div class="col-md-12">
                                            <input type="text" class="tipb" />
                                            <div class="title">
                                                <%--<span>Tên đăng nhập và mật khẩu vui lòng không chứa dấu, không cách và không ký hiệu đặc biệt như: !@#$%^&*...</span>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Mật khẩu-->
                                    <div class="bl clearfix">
                                        <div class="col-md-2">
                                            Mật khẩu:
                                        </div>
                                        <div class="col-md-4">
                                            <input type="password" class="col-md-10"/>
                                        </div>
                                        <div class="col-md-1">
                                            Nhập lại:
                                        </div>
                                        <div class="col-md-5">
                                            <input type="password" class="col-md-12"/>
                                            <div class="title">
                                                <%--<span>Mật khẩu dùng để đăng nhập, cần nhập 2 lần giống nhau.</span>--%>

                                            </div>
                                        </div>
                                    </div>
                                    <!--Trạng thái-->
                                    <div class="bl clearfix">
                                        <div class="col-md-2">
                                            Trạng thái:
                                        </div>
                                        <div class="col-md-10">
                                            <label class="checkbox inline">
                                                <input type="radio" checked="checked" />
                                                Kích hoạt
                                            </label>
                                            <label class="checkbox inline">
                                                <input type="radio" />
                                                Tạm khóa
                                            </label>
                                        </div>
                                    </div>
                                    <!--Họ tên-->
                                    <div class="bl clearfix">
                                        <div class="col-md-2">
                                            Họ tên:
                                        </div>
                                        <div class="col-md-10">
                                            <input class="col-md-8" type="text" />
                                            <div class="title">
                                                <%--<span>Nhập họ tên đầy đủ của tài khoản. Gõ tiếng Việt có dấu. VD:Nguyễn Trọng Hiếu</span>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Email-->
                                    <div class="bl clearfix">
                                        <div class="col-md-2">
                                            Email:
                                        </div>
                                        <div class="col-md-10">
                                            <input class="col-md-8" type="text" />
                                            <div class="title">
                                                <%--  <span>
                                                    Email dùng để liên lạc hoặc nhận lại mật khẩu (nếu bị mất).
                                                    VD: mrhieuit@gmail.com
                                                </span>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <h3>
                                    Thông tin liên hệ
                                </h3>
                                <div class="account-contact-info">
                                    <div>
                                        <!--Số điện thoại-->
                                        <div class="bl clearfix">
                                            <div class="col-md-2">
                                                Số điện thoại:
                                            </div>
                                            <div class="col-md-10">
                                                <input type="text" />
                                                <div class="title">
                                                    <%-- <span>
                                                        Số điện thoại liên lạc của tài khoản. VD: 0979 876 678
                                                    </span>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <!--Địa chỉ-->
                                        <div class="bl clearfix">
                                            <div class="col-md-2">
                                                Địa chỉ liên hệ:
                                            </div>
                                            <div class="col-md-10 form-select">
                                                <input class="col-md-12" type="text" />
                                                <div class="title">
                                                    <%--<span>Bạn có thể nhập địa chỉ nhà hoặc tên phòng ban nơi tài khoản làm việc hoặc thông tin mô tả thêm...</span>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <!--Hình đại diện-->
                                        <div class="bl clearfix">
                                            <div class="col-md-2">
                                                Hình đại diện:
                                            </div>
                                            <div class="col-md-10">
                                                <a href="images/no_image.png" " id="content_a_Avatar" class="fancybox lightbox-preview col-md-3" rel="group">
                                                    <img src="images/no_image.png" " id="content_img_Avatar" alt="avatar" class="default-image img-polaroid avatar-preview" style="width: 180px; height: 200px;" />
                                                    <input type="file" class="skip" preview="avatar-preview" />
                                                </a>
                                                <div class="title">
                                                    <%--  <span>
                                                        Hình đại diện cho loại tài khoản. Bạn có thể upload hình mới nếu muốn.
                                                        Các Loại file hỗ trợ: *.jpg, *.jpeg, *.gif, *.png
                                                    </span>--%>
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
                                                    <input type="radio" checked="checked" />
                                                    Nam
                                                </label>
                                                <label class="checkbox inline">
                                                    <input type="radio" />
                                                    Nữ
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <h3>
                                    Thông tin khác
                                </h3>
                                <div class="account-other-info">
                                    <div class="bl clearfix">
                                        <div class="col-md-2">
                                            Ngày giờ tạo tài khoản:
                                        </div>
                                        <div class="col-md-10">
                                            <input type="text" readonly="readonly" />
                                            <div class="title">
                                                <%-- <span>
                                                    Tự động lưu ngày giờ tạo tài khoản theo giờ hệ thống. Không cho phép chỉnh sửa
                                                </span>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Button-->
                                    <div class="bl clearfix">
                                        <div class="col-md-2 save">
                                            <a class="btn mysave">
                                                <i class="fa fa-save"></i>Lưu
                                            </a>
                                        </div>
                                        <!--Thông báo-->
                                        <div class="alert col-md-10 ">
                                            <div class="alerts">
                                                <b>Thông báo:</b>
                                                <span class="message">Xin mời nhập dữ liệu rồi nhấn [Lưu] để đăng bài mới.</span>
                                                <span class="close" title="Ẩn thông báo">X</span>
                                            </div>
                                        </div>

                                    </div>
                        </div>
                        <div class="tar container">
                            <a href="AccountList.html" type="button" class="btn active">
                                <i class="fa fa-arrow-left"></i>Trở về trang danh sách tài khoản
                            </a>
                        </div>
                    </div>
                    <!--Link trở về-->
                    </div>
                </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="Server">
    <uc1:ucScriptAdmin runat="server" ID="ucScriptAdmin" />
</asp:Content>

