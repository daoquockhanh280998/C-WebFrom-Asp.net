<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ContactCategoryList.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Trang Chủ</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">


    <!-- MAIN CONTENT-->
    <div class="main-content">
      <div class="workplace">
            <div class="page-header">
                <h1>Loại Tài Khoản
                </h1>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="head clearfix">
                        <div class="isw-folder">
                        </div>
                        <h1>Danh sách loại tài khoản
                        </h1>
                    </div>
                    <div class="block-fluid">
                        <div class="row-form clearfix">
                            <select size="4" class="category">
                                <option value="SupperAdmin">SupperAdmin</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="head clearfix">
                        <div class="isw-list">
                        </div>
                        <h1>Chi tiết loại tài khoản đang chọn
                        </h1>
                        <ul class="buttons">
                            <li>
                                <a title="Thêm mới" class="isw-plus tip"></a>
                            </li>
                            <li>
                                <a title="Xóa chọn" class="isw-delete tip"></a>
                            </li>
                        </ul>
                    </div>
                    <div class="block-fluid">
                        <div class="row bl clearfix">
                            <div class="col-md-3">
                                Mã loại tài khoản:
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="A1" />
                                <%--<span>Sử dụng chữ cái (hoặc thêm số). Không gõ dấu và không khoảng trắng. VD: SupperAdmin</span>--%>
                            </div>
                            <div class="col-md-1">
                                Vị trí:
                            </div>
                            <div class="col-md-2" style="float: right;">
                                <input type="text" class="A2" title="Dùng để sắp xếp thứ tự" />
                                <%--<span>Nhập số hoặc để trống</span>--%>
                            </div>
                        </div>
                        <div class="row bl clearfix">
                            <div class="col-md-3">
                                Tiêu đề:
                            </div>
                            <div class="col-md-9">
                                <input type="text" />
                                <%--<span>VD: Quản trị cao cấp, quản trị viên, ...</span>--%>
                            </div>
                        </div>
                        <div class="row bl clearfix">
                            <div class="col-md-3">
                                Mô tả:
                            </div>
                            <div class="col-md-9">
                                <textarea style="min-height: 50px; width: 100%;"></textarea>
                                <%--<span>Nên mô tả chi tiết về các quyền hoặc các giới hạn của loại tài khoản này.</span>--%>
                            </div>
                        </div>
                        <!--Hình đại diện-->
                        <div class="row bl clearfix">
                            <div class="col-md-3">
                                Hình đại diện:
                            </div>
                            <div class="col-md-9">
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
                        <div class="row bl clearfix">
                            <div class="col-md-3">
                                Trạng thái:
                            </div>
                            <div class="col-md-9">
                                <label class="checkbox inline">
                                    <input value="radio_Status_On" type="radio" checked="checked" />
                                    Hiển thị
                                </label>
                                <label class="checkbox inline">
                                    <input value="radio_Status_Off" type="radio" />
                                    Tạm ẩn
                                </label>
                            </div>
                        </div>
                        <div class="row bl clearfix">
                            <div class="col-md-2">
                                <a class="btn mysave">
                                    <i class="fa-save"></i>Lưu
                                </a>
                            </div>
                            <div class="col-md-10">

                                <!--Thông báo-->
                                <div class="alert alert-info inline-msg">
                                    <b>Hướng dẫn:</b>
                                    <span class="message">Để thêm mới, mời nhập thông tin sau đó nhấn [Lưu]</span>
                                    <span class="close" title="Ẩn thông báo">X</span>
                                </div>

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

