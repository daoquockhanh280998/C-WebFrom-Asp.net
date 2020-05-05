<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ContactCategoryList.aspx.cs" Inherits="Admin_Default" %>

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
                                    Danh sách loại tài khoản
                                </h2>
                                </div>
                            </div>
                            <div class="block-fluid">
                                <select size="4" class="category" style="height:475px;">
                                </select>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="head clearfix">
                                    <div class="isw-list col-md-11">
                                        <i class="fa fa-list-ul"></i>
                                        <h2>
                                            Danh sách loại tài khoản
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
                                    Thông tin liên hệ
                                </h3>
                                <div class="account-contact-info">
                                    <div>
                                        <!--Mã loại tài khoản-->
                                        <div class="bl clearfix">
                                            <div class="col-md-2">
                                                Mã Loại:
                                            </div>
                                            <div class="col-md-2">
                                                <input type="text" title="Mã số tự động (không cần nhập)" class="col-md-12" />
                                            </div>
                                            <div class="col-md-1">
                                                Vị trí:
                                            </div>
                                            <div class="col-md-2" style="margin-left: 2px;">
                                                <input type="text" class="col-md-12" title="Dùng để sắp xếp thứ tự" />
                                            </div>
                                            <div class="col-md-1">
                                                Code:
                                            </div>
                                            <div class="col-md-4">
                                                <input type="text" class="col-md-12" title="Dùng để tìm kiếm hoặc phân loại" />
                                                <div class="title">
                                                    <span>(Vị trí và Code: được phép để trống)</span>
                                                </div>
                                            </div>
                                        </div>
                                        <!--Tiêu đề-->
                                        <div class="bl clearfix">
                                            <div class="col-md-2">
                                                Tiêu đề:
                                            </div>
                                            <div class="col-md-10 form-select">
                                                <input class="col-md-12" type="text" />
                                                <div class="title">
                                                    <span>VD: Quản trị viên cao cấp, Quản trị viên...</span>
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
                                                    <span>
                                                        Hình đại diện cho loại tài khoản. Bạn có thể upload hình mới nếu muốn.
                                                        Các Loại file hỗ trợ: *.jpg, *.jpeg, *.gif, *.png
                                                    </span>
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
                                                    <input type="radio" checked="checked" />
                                                    <span>Hiển thị</span>
                                                </label>
                                                <label class="checkbox inline col-md-6">
                                                    <input type="radio" />
                                                    <span>Tạm ẩn</span>
                                                </label>
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
                    </div>
                </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="Server">
    <uc1:ucScriptAdmin runat="server" ID="ucScriptAdmin" />
</asp:Content>

