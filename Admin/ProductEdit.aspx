<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ProductEdit.aspx.cs" Inherits="Admin_ProductCategoryList" %>

<%@ Register Src="~/Admin/UserControl/ucScriptAdmin.ascx" TagPrefix="uc1" TagName="ucScriptAdmin" %>
<%@ Register Src="~/Admin/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <div class="main-content">
        <div class="workplace">
            <!--Tiêu đề-->
            <div class="page-header">
                <h1>Thêm / Chỉnh sửa Sản Phẩm
                </h1>
            </div>
            <!--Nội dung-->
            <div class="col-md-12">
                <div class="head clearfix">
                    <div class="isw-list col-md-11">
                        <i class="fa fa-list-ul"></i>
                        <h2>Đăng / cập nhật Sản Phẩm
                        </h2>
                    </div>

                </div>
                <div class="block-fluid">
                    <div class="account-category-post">
                        <div class="bl bl clearfix">
                            <div class="col-md-2">
                                Chọn Thể Loại:
                            </div>
                            <div class="col-md-10">
                                <asp:DropDownList ID="DropDownList_Category"
                                    OnSelectedIndexChanged="DropDownList_Category_SelectedIndexChanged"
                                    AutoPostBack="true"
                                    runat="server" class="col-md-12" Style="margin: 0;" />
                                <div class="title">
                                </div>
                            </div>
                        </div>

                        <div class="bl clearfix">
                            <!--Mã loại tài khoản-->
                            <div class="col-md-2">
                                Mã loại:
                            </div>
                            <div class="col-md-2">
                                <input runat="server" placeholder="Mã Loại " id="input_ID" type="text" class="col-md-12" readonly />
                                <div class="title">
                                    <span>Mã Loại Tự Tăng Không Cần Nhập</span>
                                </div>
                            </div>
                            <div class="col-md-1">
                                Vị trí:
                            </div>
                            <div class="col-md-2">
                                <input runat="server" id="input_Position" type="text" placeholder="Vị trí" class="col-md-12" data-toggle="tooltip" data-placement="top" title="Dùng để sắp xếp thứ tự" />
                                <div class="title">
                                    <span></span>
                                </div>
                            </div>
                            <div class="col-md-1">
                                Code:
                            </div>
                            <div class="col-md-4">
                                <input runat="server" id="input_Code" type="text" class="col-md-12" placeholder="Code" title="Dùng để tìm kiếm hoặc phân loại" />
                                <div class="title">
                                    <span>Có Thể Để Trống</span>
                                </div>
                            </div>
                        </div>
                        <!--Tiêu đề-->
                        <div class="bl clearfix">
                            <div class="col-md-2">
                                Tiêu đề:
                            </div>
                            <div class="col-md-10 form-select">
                                <input runat="server" id="input_Title" class="col-md-12" placeholder="Tiêu đề" type="text" />
                                <div class="title">
                                    <span>VD: Quản trị viên cao cấp, Quản trị viên...</span>
                                </div>
                            </div>
                        </div>
                        <!--Giá Cũ-->
                        <div class="bl clearfix">
                            <div class="col-md-2">
                                Giá Cũ:
                            </div>
                            <div class="col-md-10 form-select">
                                <input runat="server" id="input_OldPrice" class="col-md-12" placeholder="Giá Cũ:" type="text" />
                                <div class="title">
                                    <span>VD: Giá Cũ là Giá Mặc Định Của Sản Phẩm</span>
                                </div>
                            </div>
                        </div>
                        <!--Giá Mới-->
                        <div class="bl clearfix">
                            <div class="col-md-2">
                                Giá Mới:
                            </div>
                            <div class="col-md-10 form-select">
                                <input runat="server" id="input_Price" class="col-md-12" placeholder="Giá Mới:" type="text" />
                                <div class="title">
                                    <span>VD: Giá Mới là Giá Mặc Định - Cho khuyến mãi Sản Phẩm</span>
                                </div>
                            </div>
                        </div>
                        <!--Mô Tả-->
                        <div class="bl clearfix">
                            <div class="col-md-2">
                                Mô Tả:
                            </div>
                            <div class="col-md-10 form-select">
                                <textarea runat="server" id="textarea_Decription" class="col-md-12" placeholder="Mô Tả........." type="text" />

                            </div>
                        </div>
                        <!--Mô Tả Chi Tiết-->
                        <div class="bl clearfix">
                            <div class="col-md-2">
                                Mô Tả Chi Tiết:
                            </div>
                            <div class="col-md-10 form-select">
                                <textarea runat="server" id="textarea_Content" class="col-md-12" placeholder="Mô Tả Chi Tiết........." type="text" />
                            </div>
                        </div>
                        <!-- Khuyến Mãi-->
                        <div class="bl clearfix">
                            <div class="col-md-2">
                                Khuyến Mãi:
                            </div>
                            <div class="col-md-10 form-select">
                                <input runat="server" id="input_Promotions" class="col-md-12" placeholder="khuyến mãi" type="text" />
                                <div class="title">
                                    <span>VD: Giá Mới là Giá Mặc Định - Cho khuyến mãi Sản Phẩm</span>
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
                        <!--Danh Sách Hình-->
                        <div class="bl clearfix">
                            <div class="col-md-2">
                                Danh Sách Hình:
                            </div>
                            <div class="col-md-2">
                                <a runat="server" id="a_ListImage1" href="images/no_image.png" class="fancybox lightbox-preview col-md-3">
                                    <img runat="server" id="img_ListImage1" class="img_ListImage1"
                                        src="images/no_image.png" alt="avatar" />
                                </a>
                                <br />
                                <asp:FileUpload runat="server" ID="FileUpload_image1"
                                    onchange="document.getElementsByClassName('img_ListImage1')[0].src = window.URL.createObjectURL(this.files[0])" class="skip" />
                                <br />
                                <div class="title">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <a runat="server" id="a_image2" href="images/no_image.png" class="fancybox lightbox-preview col-md-3">
                                    <img runat="server" id="img2" class="img_Avatar"
                                        src="images/no_image.png" alt="avatar" />
                                </a>
                                <br />
                                <asp:FileUpload runat="server" ID="FileUpload2"
                                    onchange="document.getElementsByClassName('img_Avatar')[0].src = window.URL.createObjectURL(this.files[0])" class="skip" />
                                <br />
                                <div class="title">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <a runat="server" id="a_image3" href="images/no_image.png" class="fancybox lightbox-preview col-md-3">
                                    <img runat="server" id="img3" class="img_Avatar"
                                        src="images/no_image.png" alt="avatar" />
                                </a>
                                <br />
                                <asp:FileUpload runat="server" ID="FileUpload3"
                                    onchange="document.getElementsByClassName('img_Avatar')[0].src = window.URL.createObjectURL(this.files[0])" class="skip" />
                                <br />
                                <div class="title">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <a runat="server" id="a_image4" href="images/no_image.png" class="fancybox lightbox-preview col-md-3">
                                    <img runat="server" id="img4" class="img_Avatar"
                                        src="images/no_image.png" alt="avatar" />
                                </a>
                                <br />
                                <asp:FileUpload runat="server" ID="FileUpload4"
                                    onchange="document.getElementsByClassName('img_Avatar')[0].src = window.URL.createObjectURL(this.files[0])" class="skip" />
                                <br />
                                <div class="title">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <a runat="server" id="a_image5" href="images/no_image.png" class="fancybox lightbox-preview col-md-3">
                                    <img runat="server" id="img5" class="img_Avatar"
                                        src="images/no_image.png" alt="avatar" />
                                </a>
                                <br />
                                <asp:FileUpload runat="server" ID="FileUpload5"
                                    onchange="document.getElementsByClassName('img_Avatar')[0].src = window.URL.createObjectURL(this.files[0])" class="skip" />
                                <br />
                                <div class="title">
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
                                    <span>Cho Phép Hiển thị</span>
                                </label>
                                <label class="checkbox inline col-md-6">
                                    <input runat="server" id="radio_Lock" type="radio" />
                                    <span>Tạm ẩn</span>
                                </label>
                            </div>
                        </div>
                        <!--Người đăng-->
                        <div class="bl clearfix">
                            <div class="col-md-2">
                                Người đăng:
                            </div>
                            <div class="col-md-10 form-select">
                                <input runat="server" id="input_CreateBy" class="col-md-12" type="text" readonly />
                                <div class="title">
                                    <span>Tự động Lưu của người đăng. Không cho phép chỉnh sửa.
                                    </span>
                                </div>
                            </div>
                        </div>
                        <!--Ngày giờ đăng-->
                        <div class="bl clearfix">
                            <div class="col-md-2">
                                Ngày giờ đăng:
                            </div>
                            <div class="col-md-10 form-select">
                                <input runat="server" id="input_CreateTime" class="col-md-12" type="text" readonly />
                                <div class="title">
                                    <span>Tự động lưu ngày giờ đăng bài theo giờ hệ thống. Không cho phép chỉnh sửa
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Button-->
                    <div class="bl clearfix">
                        <div class="col-md-2 save">

                            <asp:LinkButton runat="server" ID="LinkButton_Save" OnClick="LinkButton_Save_Click" class="btn mysave">
                                           <i class="fa fa-save"></i>Lưu
                            </asp:LinkButton>
                        </div>
                        <!--Thông báo-->
                        <div class="alert col-md-10 ">
                            <uc1:ucMessage runat="server" ID="ucMessage" />
                        </div>

                    </div>
                    <!--Link trở về-->
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

