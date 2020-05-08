<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ClientInfo.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Thông Tin Tài Khoản</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <section id="account-tab-home" class="account">
        <ul class="nav nav-tabs nav-fill nav-justified">
            <li class="nav-item">
                <a
                    class="nav-link active"

                    href="#tab-information-guide">Thông tin tài khoản
                </a>
            </li>
            <li class="nav-item">
                <a
                    class="nav-link"
                    href="OrderDetail.aspx">Đơn Hàng
                </a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade show active" id="tab-information-guide">
                <div class="profile-card">
                    <div class="form-box col-12">
                        <div class="logo-box">
                            <i class="fa fa-user-circle-o"></i>
                        </div>
                        <div id="information" class="input-group">
                            <ul>
                                <li>
                                    <span>Email: </span><span runat="server" id="span_Email" class="info_group">Email</span>
                                </li>
                                <li>
                                    <span>Họ tên: </span><span runat="server" id="span_FullName" class="info_group">Full Name</span>
                                </li>
                                <li>
                                    <span>Số điện thoại: </span><span runat="server" id="span_Mobi" class="info_group">Mobi</span>
                                </li>
                                <li>
                                    <span>Giới Tính: </span><span runat="server" id="span_Gender" class="info_group">gender</span>
                                </li>
                                <li>
                                    <span>Địa Chỉ: </span><span runat="server" id="span_Address" class="info_group">address</span>
                                </li>
                            </ul>
                             <asp:LinkButton class="toggle-btn col-md-5 col-12" Text="Đăng Xuất" ID="LinkButton_Logout" OnClick="LinkButton_Logout_Click" runat="server" />
                            <a href="ClientRepair.aspx" class="toggle-btn col-md-5 col-12">Chỉnh Sửa Tài Khoản
                            </a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="Server">
    <script src="../js/jquery-3.0.0.js"></script>
    <script src="../js/jquery.smartmenus.js"></script>
    <script src="../js/jquery.smartmenus.bootstrap-4.js"></script>
    <link href="css/swiper.min.css" rel="stylesheet" />
    <script src="popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="../js/Script.js"></script>
</asp:Content>

