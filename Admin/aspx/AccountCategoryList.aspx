<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AccountCategoryList.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Trang Chủ</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <!-- HEADER DESKTOP-->
    <header class="header-desktop">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <div class="header-wrap">
                    <div class="form-header"<%-- action="" method="POST"--%>>
                        <input class="au-input au-input--xl" type="text" name="search" placeholder="Search for datas &amp; reports..." />
                        <button class="au-btn--submit" type="submit">
                            <i class="zmdi zmdi-search"></i>
                        </button>
                    </div>
                    <div class="header-button">
                        <div class="noti-wrap">
                            <div class="noti__item js-item-menu">
                                <i class="zmdi zmdi-comment-more"></i>
                                <span class="quantity">1</span>
                                <div class="mess-dropdown js-dropdown">
                                    <div class="mess__title">
                                        <p>You have 2 news message</p>
                                    </div>
                                    <div class="mess__item">
                                        <div class="image img-cir img-40">
                                            <img src="images/icon/avatar-06.jpg" alt="Michelle Moreno" />
                                        </div>
                                        <div class="content">
                                            <h6>Michelle Moreno</h6>
                                            <p>Have sent a photo</p>
                                            <span class="time">3 min ago</span>
                                        </div>
                                    </div>
                                    <div class="mess__item">
                                        <div class="image img-cir img-40">
                                            <img src="images/icon/avatar-04.jpg" alt="Diane Myers" />
                                        </div>
                                        <div class="content">
                                            <h6>Diane Myers</h6>
                                            <p>You are now connected on message</p>
                                            <span class="time">Yesterday</span>
                                        </div>
                                    </div>
                                    <div class="mess__footer">
                                        <a href="#">View all messages</a>
                                    </div>
                                </div>
                            </div>
                            <div class="noti__item js-item-menu">
                                <i class="zmdi zmdi-email"></i>
                                <span class="quantity">1</span>
                                <div class="email-dropdown js-dropdown">
                                    <div class="email__title">
                                        <p>You have 3 New Emails</p>
                                    </div>
                                    <div class="email__item">
                                        <div class="image img-cir img-40">
                                            <img src="images/icon/avatar-06.jpg" alt="Cynthia Harvey" />
                                        </div>
                                        <div class="content">
                                            <p>Meeting about new dashboard...</p>
                                            <span>Cynthia Harvey, 3 min ago</span>
                                        </div>
                                    </div>
                                    <div class="email__item">
                                        <div class="image img-cir img-40">
                                            <img src="images/icon/avatar-05.jpg" alt="Cynthia Harvey" />
                                        </div>
                                        <div class="content">
                                            <p>Meeting about new dashboard...</p>
                                            <span>Cynthia Harvey, Yesterday</span>
                                        </div>
                                    </div>
                                    <div class="email__item">
                                        <div class="image img-cir img-40">
                                            <img src="images/icon/avatar-04.jpg" alt="Cynthia Harvey" />
                                        </div>
                                        <div class="content">
                                            <p>Meeting about new dashboard...</p>
                                            <span>Cynthia Harvey, April 12,,2018</span>
                                        </div>
                                    </div>
                                    <div class="email__footer">
                                        <a href="#">See all emails</a>
                                    </div>
                                </div>
                            </div>
                            <div class="noti__item js-item-menu">
                                <i class="zmdi zmdi-notifications"></i>
                                <span class="quantity">3</span>
                                <div class="notifi-dropdown js-dropdown">
                                    <div class="notifi__title">
                                        <p>You have 3 Notifications</p>
                                    </div>
                                    <div class="notifi__item">
                                        <div class="bg-c1 img-cir img-40">
                                            <i class="zmdi zmdi-email-open"></i>
                                        </div>
                                        <div class="content">
                                            <p>You got a email notification</p>
                                            <span class="date">April 12, 2018 06:50</span>
                                        </div>
                                    </div>
                                    <div class="notifi__item">
                                        <div class="bg-c2 img-cir img-40">
                                            <i class="zmdi zmdi-account-box"></i>
                                        </div>
                                        <div class="content">
                                            <p>Your account has been blocked</p>
                                            <span class="date">April 12, 2018 06:50</span>
                                        </div>
                                    </div>
                                    <div class="notifi__item">
                                        <div class="bg-c3 img-cir img-40">
                                            <i class="zmdi zmdi-file-text"></i>
                                        </div>
                                        <div class="content">
                                            <p>You got a new file</p>
                                            <span class="date">April 12, 2018 06:50</span>
                                        </div>
                                    </div>
                                    <div class="notifi__footer">
                                        <a href="#">All notifications</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="account-wrap">
                            <div class="account-item clearfix js-item-menu">
                                <div class="image">
                                    <img src="images/icon/avatar-01.jpg" alt="John Doe" />
                                </div>
                                <div class="content">
                                    <a class="js-acc-btn" href="#">john doe</a>
                                </div>
                                <div class="account-dropdown js-dropdown">
                                    <div class="info clearfix">
                                        <div class="image">
                                            <a href="#">
                                                <img src="images/icon/avatar-01.jpg" alt="John Doe" />
                                            </a>
                                        </div>
                                        <div class="content">
                                            <h5 class="name">
                                                <a href="#">john doe</a>
                                            </h5>
                                            <span class="email">johndoe@example.com</span>
                                        </div>
                                    </div>
                                    <div class="account-dropdown__body">
                                        <div class="account-dropdown__item">
                                            <a href="#">
                                                <i class="zmdi zmdi-account"></i>Account</a>
                                        </div>
                                        <div class="account-dropdown__item">
                                            <a href="#">
                                                <i class="zmdi zmdi-settings"></i>Setting</a>
                                        </div>
                                        <div class="account-dropdown__item">
                                            <a href="#">
                                                <i class="zmdi zmdi-money-box"></i>Billing</a>
                                        </div>
                                    </div>
                                    <div class="account-dropdown__footer">
                                        <a href="#">
                                            <i class="zmdi zmdi-power"></i>Logout</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- HEADER DESKTOP-->

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
                        <div class="row">
                            <div class="isw-list">
                            </div>
                            <div class="col-md-10" >
                                <h1>Chi tiết loại tài khoản đang chọn
                                </h1>
                            </div>
                             <div class="col-md-2" >
                            <ul class="buttonss">
                                <li>
                                    <a title="Thêm mới" class="fas fa-plus-circle"></a>
                                </li>
                                <li>
                                    <a title="Xóa chọn" class="fas fa-trash-alt"></a>
                                </li>
                            </ul>
                             </div>
                        </div>
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

