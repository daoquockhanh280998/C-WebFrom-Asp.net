<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ClientRepair.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Thông Tin Tài Khoản</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <section id="account-tab-home" class="account">
        <ul class="nav nav-tabs nav-fill nav-justified">
            <li class="nav-item">
                <a
                    class="nav-link "

                    href="ClientInfo.aspx">Thông tin tài khoản
                </a>
            </li>
            <li class="nav-item">
                <a
                    class="nav-link active"
                    data-toggle="tab"
                    >Sửa thông tin tài khoản
                </a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade show active">
                <div class="profile-card">
                    <div class="form-box col-12">
                        <div class="logo-box">
                            <i class="fa fa-user-circle-o"></i>
                        </div>
                        <div class="input-group ">
                            <input
                                type="text"
                                class="input-field"
                                placeholder="Họ tên: Nguyễn Trọng Hiếu"
                                title="Họ tên"
                                required />
                            <input
                                type="text"
                                class="input-field"
                                placeholder="SĐT: 0969905304"
                                title="Số điện thoại"
                                required />
                            <input
                                type="email"
                                class="input-field"
                                placeholder="Email..."
                                title="Vui lòng nhập email"
                                required />
                            <input
                                type="text"
                                class="input-field"
                                placeholder="Địa chỉ: Lorem ipsum, dolor sit amet consectetur adipisicing elit. Et, quis."
                                title="Chúng tôi sẽ giao hàng tới địa chỉ này"
                                required />
                            <div class="alert alert-success no-margin col-md-12">
                                <button type="button" class="close" data-dismiss="alert">
                                    &times;
                                </button>
                                Cập nhật thành công.
                            </div>
                            <button type="button" class="toggle-btn col-md-5 col-12">
                                Cập nhật
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="Server">
    <script src="js/jquery-3.0.0.js"></script>
    <script src="js/jquery.smartmenus.js"></script>
    <script src="js/jquery.smartmenus.bootstrap-4.js"></script>
    <link href="css/swiper.min.css" rel="stylesheet" />
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/Script.js"></script>
    <script src="js/swiper.min.js"></script>
</asp:Content>

