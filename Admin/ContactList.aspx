<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ContactList.aspx.cs" Inherits="Admin_Default" %>

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
                    <div class="col-md-12">
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
                            <div class="account-category-post">
                                <div class="bl bl clearfix" style="padding-left: 10px;">
                                    <select class="col-md-2"></select>
                                    <div class="search col-md-8">
                                        <input class="col-md-6" type="text" placeholder="Lọc theo: tên đăng nhập, họ tên, email hoặc SĐT"/>
                                        <a class="btn mybtn input-icon link-search">
                                            <i class="fa fa-search"></i>
                                        </a>
                                    </div>
                                    <div class="dataTables_length col-md-2">
                                        <a class="btn input-icon" style="width: 80px;">
                                            <span class="close" title="Ẩn thông báo">X</span>
                                            <span class="message">Hủy bộ lọc</span>
                                        </a>
                                    </div>
                                </div>
                                <!--table-->
                                <div class="bl-table clearfix">
                                    <Table>
                                        <thead>
                                            <tr>
                                                <th width="25px" class="center">
                                                    <input type="checkbox" name="checkall" />
                                                </th>
                                                <th width="102px" class="center">
                                                    Hình
                                                </th>
                                                <th width="80px" class="center">
                                                    Mã số
                                                </th>
                                                <th>
                                                    Tiêu đề / Lượt xem / Loại / Mô tả
                                                </th>
                                                <th width="100px" class="center">
                                                    Người đăng /Ngày
                                                </th>
                                                <th width="100px" class="center">
                                                    Xem / Xóa / Sửa
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody style="font-size: 13px;">
                                            <tr>
                                                <td class="center middle">
                                                    <input type="checkbox" name="checkbox" />
                                                </td>
                                                <td>
                                                    <div class="image">
                                                        <img src="images/8761ea0b-776c-4504-a845-58d5617d90f4.png" alt="">
                                                    </div>
                                                    <div>
                                                        <button class="btn btn-small btn-success btn-file">
                                                        <i class="fa fa-camera-retro"></i>
                                                        <span class="icon-camera icon-white"></span> Thay hình
                                                        </button>
                                                    </div>
                                                </td>
                                                <td class="center middle">
                                                    793
                                                </td>
                                                <td class="middle">
                                                    <h4>
                                                        Nữ phóng viên yêu những style đối lập
                                                        (143 lượt xem)
                                                    </h4>
                                                    <p>Loại: <b>Văn hóa - Thời trang</b></p>
                                                    <p>Nữ phóng viên yêu những style đối lập. Những phong cách tưởng chừng như mẫu thuẫn trong thời trang đều được Phương Dung yêu thích.</p>
                                                </td>
                                                <td class="center middle">
                                                    admin<br /><br />
                                                    09/09/2014<br />12:41:00
                                                </td>
                                                <td>
                                                    <p class="info">
                                                        <a class="btn btn-block" href="AccountPasswordChange.html?id=admin">
                                                            <i class="fa fa fa-exchange-alt" style="padding-right: 5px;"></i>
                                                            <span class="icon-refresh icon-white"></span> Đổi mật khẩu mới
                                                        </a>

                                                        <a class="btn btn-block" href="AccountEdit.html?id=admin">
                                                            <i class="fa fa fa-edit" style="padding-right: 5px;"></i>
                                                            <span class="icon-edit icon-white"></span> Chỉnh sửa thông tin
                                                        </a>

                                                        <a class="btn btn-block">
                                                            <i class="fa fa fa-trash-alt" style="padding-right: 5px;"></i>
                                                            <span class="icon-trash icon-white"></span> Xóa dữ liệu này
                                                        </a>

                                                        <a class="btn active btn-block">
                                                            <i class="fa fa fa-check" style="padding-right: 5px;"></i>
                                                            <span class='icon-ok icon-white'></span>
                                                            Đang kích hoạt, Tạm khóa lại
                                                        </a>
                                                    </p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="center middle">
                                                    <input type="checkbox" name="checkbox" />
                                                </td>
                                                <td width="102">
                                                    <div class="image">
                                                        <img src="images/8761ea0b-776c-4504-a845-58d5617d90f4.png" alt="">
                                                    </div>
                                                    <div>
                                                        <button class="btn btn-small btn-success btn-file">
                                                        <i class="fa fa-camera-retro"></i>
                                                        <span class="icon-camera icon-white"></span> Thay hình
                                                        </button>
                                                    </div>
                                                </td>
                                                <td class="center middle">
                                                    793
                                                </td>
                                                <td class="middle">
                                                    <h4>
                                                        Nữ phóng viên yêu những style đối lập
                                                        (143 lượt xem)
                                                    </h4>
                                                    <p>Loại: <b>Văn hóa - Thời trang</b></p>
                                                    <p>Nữ phóng viên yêu những style đối lập. Những phong cách tưởng chừng như mẫu thuẫn trong thời trang đều được Phương Dung yêu thích.</p>
                                                </td>
                                                <td class="center middle">
                                                    admin<br /><br />
                                                    09/09/2014<br />12:41:00
                                                </td>
                                                <td width="250">
                                                    <p class="info">
                                                        <a class="btn btn-block" href="AccountPasswordChange.html?id=admin">
                                                            <i class="fa fa fa-exchange-alt" style="padding-right: 5px;"></i>
                                                            <span class="icon-refresh icon-white"></span> Đổi mật khẩu mới
                                                        </a>

                                                        <a class="btn btn-block" href="AccountEdit.html?id=admin">
                                                            <i class="fa fa fa-edit" style="padding-right: 5px;"></i>
                                                            <span class="icon-edit icon-white"></span> Chỉnh sửa thông tin
                                                        </a>

                                                        <a class="btn btn-block">
                                                            <i class="fa fa fa-trash-alt" style="padding-right: 5px;"></i>
                                                            <span class="icon-trash icon-white"></span> Xóa dữ liệu này
                                                        </a>

                                                        <a class="btn active btn-block">
                                                            <i class="fa fa fa-check" style="padding-right: 5px;"></i>
                                                            <span class='icon-ok icon-white'></span>
                                                            Đang kích hoạt, Tạm khóa lại
                                                        </a>
                                                    </p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </Table>
                                    <!--Pagging-->
                                <div class="dataTables_info">
                                    Trang
                                    <b>
                                        1
                                    </b>
                                    của
                                    <b>
                                        262
                                    </b>
                                    (Tổng cộng:
                                    <b>
                                        1307
                                    </b>
                                    item)
                                </div>
                                <div class="dataTables_paginate paging_full_numbers">
                                    <a class="paginate_button">&lt;&lt;</a>
                                    <a class="paginate_button">&lt;</a>
                                    <span>
                                        <a class="paginate_button active">
                                            1
                                        </a>

                                        <a class="paginate_button">
                                            2
                                        </a>
                                    </span>
                                    <a class="paginate_button">&gt;</a>
                                    <a class="paginate_button">&gt;&gt;</a>
                                </div>
                                </div>
                            </div>
                        </div>
                </div>
                </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="Server">
    <uc1:ucScriptAdmin runat="server" ID="ucScriptAdmin" />
</asp:Content>

