<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AccountList.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Trang Chủ</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">

    <!-- MAIN CONTENT-->
    <div class="main-content">
        <div class="workplace">
            <div class="page-header">
                <h1>Quản lý tài khoản

                </h1>
            </div>
            <div>
                <div>
                    <div class="head clearfix">
                        <div class="isw-users">
                        </div>
                        <h1>Danh sách tài khoản
                        </h1>
                        <ul class="buttons">
                            <li>
                                <a href="AccountEdit.html" class="isw-plus tip" title="Thêm mới"></a>
                            </li>
                            <li>
                                <a href="#" class="isw-delete tip" title="Xóa chọn"></a>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <div class="bl">
                            <div class="row">
                                <!--Filter-->
                                <div class="col-md-8 dataTables_filter">
                                    <div class="input-append">

                                        <select style="margin-right: 10px; border-radius: 4px;"></select>
                                        <input type="text" placeholder="Lọc theo: tên đăng nhập, họ tên, email hoặc SĐT" />
                                        <a class="mybtn  fas fa-search">
                                            <i class="isw-zoom"></i>&nbsp;
                                        </a>

                                    </div>
                                </div>

                                <div class="col-md-4 dataTables_length">
                                    <a class="btn input-icon" style="width: 80px;">
                                        <i class="isw-cancel"></i>Hủy bộ lọc
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!--Content-->
                        <table cellpadding="0" cellspacing="0" width="100%" class="tablelistAccounts">
                            <tbody>
                                <tr>
                                    <td width="130">
                                        <a href="images/nguoi.png" class="fancybox lightbox-preview" rel="group" title="Lê Minh Hiếu - SĐT: 0979 876 678 - Email: mrhieuit@gmail.com">
                                            <img src="images/nguoi.png" alt="avatar" style="width: 92px; height: 92px; margin-bottom: 2px;" class="default-image img-polaroid avatar-preview-admin" original="~/FileUploads/Account/thumbs/8761ea0b-776c-4504-a845-58d5617d90f4.png" title="Lê Minh Hiếu" />
                                        </a>
                                        <div class="btn-group">
                                            <button class="btn btn-small btn-success btn-file" style="width: 102px; cursor: pointer;">
                                                <span class="icon-camera icon-white"></span>Thay hình
                                                        <input type="file" class="skip" preview="avatar-preview-admin" />
                                            </button>
                                        </div>
                                        <div class="btn-group none-margin hide save-cancel-function">
                                            <a title="Lưu hình" class="btn btn-warning tip save">
                                                <i class="isw-save"></i>
                                            </a>
                                            <button class="btn btn-inverse tip cancel" title="Hủy lệnh">
                                                <i class="isw-cancel"></i>
                                            </button>
                                        </div>
                                    </td>
                                    <td width="250">
                                        <a href="#" class="account">Lê Minh Hiếu
                                        </a>
                                        <p class="about">
                                            <span class="tip icon-user" title="Username"></span>
                                            admin
                                                    <br />
                                            <span class="tip icon-envelope" title="Email"></span>
                                            mrhieuit@gmail.com
                                                    <br />
                                            <span class="tip icon-time" title="Ngày khởi tạo tài khoản"></span>
                                            07/09/2014
                                                    <br />
                                            <span class="tip icon-bell" title="Số điện thoại"></span>
                                            0979 876 678
                                                    <br />
                                            <span class="tip icon-adjust" title="Phái"></span>
                                            Nam
                                                    <br />
                                        </p>
                                    </td>
                                    <td>
                                        <p class="about">
                                            <span class="tip icon-warning-sign" title="Vai trò"></span>
                                            SupperAdmin-Quản trị cao cấp
                                                    <br />
                                            <span class="tip icon-home" title="Địa chỉ"></span>
                                            Thủ Dầu Một, Bình Dương
                                        </p>
                                    </td>
                                    <td width="200" class="function">
                                        <p class="info">
                                            <a class="btn btn-small btn-block block tip" href="AccountPasswordChange.html?id=admin">
                                                <span class="icon-refresh icon-white"></span>Đổi mật khẩu mới
                                            </a>

                                            <a class="btn btn-small btn-block block tip" href="AccountEdit.html?id=admin">
                                                <span class="icon-edit icon-white"></span>Chỉnh sửa thông tin
                                            </a>

                                            <a class="btn btn-small btn-block block tip">
                                                <span class="icon-trash icon-white"></span>Xóa dữ liệu này
                                            </a>

                                            <a class="btn btn-small btn-success tip">
                                                <span class='icon-ok icon-white'></span>
                                                Đang kích hoạt, Tạm khóa lại
                                            </a>
                                        </p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!--Pagging-->

                    </div>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="Server">
</asp:Content>

