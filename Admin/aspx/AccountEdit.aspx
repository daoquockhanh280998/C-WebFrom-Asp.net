<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AccountEdit.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Trang Chủ</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
  

    <!-- MAIN CONTENT-->
    <div class="main-content">
        <div class="workplace">
            <!--Tiêu đề-->
            <div class="page-header">
                <h1>Thêm / Chỉnh sửa thông tin tài khoản
                </h1>
            </div>
            <!--Nội dung-->
            <div>
                <div>
                    <div class="head clearfix">
                        <div class="isw-list">
                        </div>
                        <h1>Đăng / cập nhật tin tức
                        </h1>
                    </div>
                    <div class="block-fluid">
                        <h3>Thông tin đăng nhập
                        </h3>
                        <div class="account-category-post">

                            <div class="row bl bl clearfix">
                                <div class="col-md-2">
                                    Chọn Loại tài khoản:
                                </div>
                                <div class="col-md-2 form-select">
                                    <select></select>
                                </div>
                            </div>
                            <!--Username-->
                            <div class="row bl clearfix">
                                <div class="col-md-2">
                                    Tên đăng nhập:
                                </div>
                                <div class="col-md-2">
                                    <input type="text" class="tipb" />
                                </div>
                                <div class="col-md-8">
                                    <%--<span>Tên đăng nhập và mật khẩu vui lòng không chứa dấu, không cách và không ký hiệu đặc biệt như: !@#$%^&*...</span>--%>
                                </div>
                            </div>
                            <!--Mật khẩu-->
                            <div class="row bl clearfix">
                                <div class="col-md-2">
                                    Mật khẩu:
                                </div>
                                <div class="col-md-2">
                                    <input type="password" />
                                </div>
                                <div class="col-md-1">
                                    Nhập lại:
                                </div>
                                <div class="col-md-2">
                                    <input type="password" />
                                </div>
                                <div class="col-md-4">
                                    <%--<span>Mật khẩu dùng để đăng nhập, cần nhập 2 lần giống nhau.</span>--%>

                                </div>
                            </div>
                            <!--Trạng thái-->
                            <div class="row bl clearfix">
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
                            <div class="row bl clearfix">
                                <div class="col-md-2 ">
                                    Họ tên:
                                </div>
                                <div class="col-md-5 form-input">
                                    <input type="text" />
                                </div>
                                <div class="col-md-5">
                                    <%--<span>Nhập họ tên đầy đủ của tài khoản. Gõ tiếng Việt có dấu. VD: Lê Minh Hiếu</span>--%>
                                </div>
                            </div>
                            <!--Email-->
                            <div class="row bl clearfix">
                                <div class="col-md-2">
                                    Email:
                                </div>
                                <div class="col-md-5 form-input">
                                    <input type="text" />
                                </div>
                                <div class="col-md-5">
                                  <%--  <span>Email dùng để liên lạc hoặc nhận lại mật khẩu (nếu bị mất).
                                                VD: mrhieuit@gmail.com
                                    </span>--%>
                                </div>
                            </div>
                        </div>
                        <h3>Thông tin liên hệ
                        </h3>
                        <div class="account-contact-info">
                            <div>
                                <!--Số điện thoại-->
                                <div class="row bl clearfix">
                                    <div class="col-md-2">
                                        Số điện thoại:
                                    </div>
                                    <div class="col-md-5 form-input">
                                        <input type="text" />
                                    </div>
                                    <div class="col-md-5">
                                       <%-- <span>Số điện thoại liên lạc của tài khoản. VD: 0979 876 678
                                        </span>--%>
                                    </div>
                                </div>
                                <!--Địa chỉ-->
                                <div class="row bl clearfix">
                                    <div class="col-md-2">
                                        Địa chỉ liên hệ:
                                    </div>
                                    <div class="col-md-10 form-select">
                                        <textarea></textarea>
                                        <%--<span>Bạn có thể nhập địa chỉ nhà hoặc tên phòng ban nơi tài khoản làm việc hoặc thông tin mô tả thêm...</span>--%>
                                    </div>
                                </div>
                                <!--Hình đại diện-->
                                <div class="row bl clearfix">
                            <div class="col-md-3">
                                Hình đại diện:
                            </div>
                            <div class="col-md-9 form-img">
                                <a href="images/no_image.png"" id="content_a_Avatar" class="fancybox lightbox-preview" rel="group">
                                    <img src="images/no_image.png"" id="content_img_Avatar" alt="avatar" class="default-image img-polaroid avatar-preview" style="width: 180px; height: 200px;" />
                                </a>
                                <br />
                                <input type="file" class="skip" preview="avatar-preview" />
                                <br />
                              <%--  <span>Hình đại diện cho loại tài khoản. Bạn có thể upload hình mới nếu muốn.
                                            Các Loại file hỗ trợ: *.jpg, *.jpeg, *.gif, *.png
                                </span>--%>
                            </div>
                        </div>
                                <!--Giới tính-->
                                <div class="row bl clearfix">
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
                        <h3>Thông tin khác
                        </h3>
                        <div class="account-other-info">
                            <div class="row bl clearfix">
                                <div class="col-md-2">
                                    Ngày giờ tạo tài khoản:
                                </div>
                                <div class="col-md-2">
                                    <input type="text" readonly="readonly" />
                                </div>
                                <div class="col-md-8">
                                   <%-- <span>Tự động lưu ngày giờ tạo tài khoản theo giờ hệ thống. Không cho phép chỉnh sửa
                                    </span>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--Button-->
            <div class="row bl-fluid">
                <div class="col-md-12" style="margin-top: -20px; background-color: #F2F2F2;">
                    <div class="block-fluid  customize">
                        <div class="row bl clearfix">
                              <div class="col-md-2">
                                <a class="btn mysave">
                                    <i class="fa-save"></i>Lưu
                                </a>
                            </div>
                            <div class="col-md-10">

                                <!--Thông báo-->
                                <div class="alert alert-info inline-msg">
                                    <b>Thông báo:</b>
                                    <span class="message">Xin mời nhập dữ liệu rồi nhấn [Lưu] để đăng bài mới.</span>
                                    <span class="close" title="Ẩn thông báo">X</span>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--Link trở về-->
            <div class="tar">
                <a href="AccountList.html" type="button" class="btn active">
                    <i class="icon-arrow-left"></i>Trở về trang danh sách tài khoản
                </a>
            </div>

        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="Server">
</asp:Content>

