<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ArticleList.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Trang Chủ</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">

    <!-- MAIN CONTENT-->
    <div class="main-content">
        <div class="workplace">
            <div class="page-header">
                <h1>Danh Sách Tin Tức

                </h1>
            </div>
            <div>
                <div>
                    <div class="head clearfix">
                        <div class="isw-users">
                        </div>
                        <h1>Danh Sách Tin Tức
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
                        <table cellpadding="0" cellspacing="0" width="100%" class="tablelistAccounts" id="tPagging">
                            <thead>
                                <tr>
                                    <th width="50px" class="center">
                                        <input type="checkbox" name="checkall" />
                                    </th>
                                    <th width="50px" class="center">Hình
                                    </th>
                                    <th width="50px" class="center">Mã số
                                    </th>
                                    <th>Tiêu đề / Lượt xem / Loại / Mô tả
                                    </th>
                                    <th width="150px" class="center">Người đăng /Ngày
                                    </th>
                                    <th width="200px" class="center">Xem / Xóa / Sửa
                                    </th>
                                </tr>
                            </thead>
                            <tbody>

                                <tr>
                                    <td class="center middle">
                                        <input type="checkbox" name="checkbox" />
                                    </td>
                                    <td width="102" <%--class="center middle avatar"--%>>
                                        <a href="/admin/images/no_image.png" class="fancybox lightbox-preview" rel="group" title="no-img">
                                            <img src="/admin/images/no_image.png" />
                                        </a>
                                        <div class="btn-group">
                                            <button class="btn btn-small btn-success btn-file" style="width: 102px; cursor: pointer;">
                                                <span class="icon-camera icon-white"></span>Thay hình
                                                        <input type="file" class="skip" preview="avatar-preview-793" />
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
                                    <td class="center middle">793
                                    </td>
                                    <td class="middle">
                                        <h4>Nữ phóng viên yêu những style đối lập
                                                    (143 lượt xem)
                                        </h4>
                                        <p>Loại: <b>Văn hóa - Thời trang</b></p>
                                        <p align="justify">Nữ phóng viên yêu những style đối lập. Những phong cách tưởng chừng như mẫu thuẫn trong thời trang đều được Phương Dung yêu thích.</p>
                                    </td>
                                    <td class="center middle">admin<br />
                                        <br />
                                        09/09/2014<br />
                                        12:41:00
                                    </td>
                                    <td class="center middle function">
                                        <p class="info">
                                            <a title="ID: 793 - Tiêu đề: Nữ phóng viên yêu những style đối lập" class="btn btn-small btn-block block tip fancybox-iframe" href="ArticleDetail.html?id=793">
                                                <span class="icon-zoom-in icon-white"></span>Hiển thị chi tiết
                                            </a>

                                            <a class="btn btn-small btn-block block tip" href="ArticleEdit.html?id=793">
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

                                <tr>
                                    <td class="center middle">
                                        <input type="checkbox" name="checkbox" />
                                    </td>
                                    <td width="102" <%--class="center middle avatar"--%>>
                                        <a href="/admin/images/no_image.png" class="fancybox lightbox-preview" rel="group" title="no-img">
                                            <img src="/admin/images/no_image.png" />
                                        </a>
                                        <div class="btn-group">
                                            <button class="btn btn-small btn-success btn-file" style="width: 102px; cursor: pointer;">
                                                <span class="icon-camera icon-white"></span>Thay hình
                                                        <input type="file" class="skip" preview="avatar-preview-793" />
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
                                    <td class="center middle">793
                                    </td>
                                    <td class="middle">
                                        <h4>Nữ phóng viên yêu những style đối lập
                                                    (143 lượt xem)
                                        </h4>
                                        <p>Loại: <b>Văn hóa - Thời trang</b></p>
                                        <p align="justify">Nữ phóng viên yêu những style đối lập. Những phong cách tưởng chừng như mẫu thuẫn trong thời trang đều được Phương Dung yêu thích.</p>
                                    </td>
                                    <td class="center middle">admin<br />
                                        <br />
                                        09/09/2014<br />
                                        12:41:00
                                    </td>
                                    <td class="center middle function">
                                        <p class="info">
                                            <a title="ID: 793 - Tiêu đề: Nữ phóng viên yêu những style đối lập" class="btn btn-small btn-block block tip fancybox-iframe" href="ArticleDetail.html?id=793">
                                                <span class="icon-zoom-in icon-white"></span>Hiển thị chi tiết
                                            </a>

                                            <a class="btn btn-small btn-block block tip" href="ArticleEdit.html?id=793">
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
                        <div class="dataTables_info">
                            Trang
                                    <b>1
                                    </b>
                            của
                                    <b>262
                                    </b>
                            (Tổng cộng:
                                    <b>1307
                                    </b>
                            item)
                        </div>
                        <div class="dataTables_paginate paging_full_numbers">
                            <a class="paginate_button">&lt;&lt;</a>
                            <a class="paginate_button">&lt;</a>
                            <span>
                                <a class="paginate_active">1
                                </a>

                                <a class="paginate_button">2
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
</asp:Content>

