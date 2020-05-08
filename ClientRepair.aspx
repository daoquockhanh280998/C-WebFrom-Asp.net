<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ClientRepair.aspx.cs" Inherits="Default2" %>

<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>


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
                    >Chỉnh Sửa thông tin tài khoản
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
                        <div class="input-group">
                            <input runat="server" id="input_Email"
                                type="text"
                                class="input-field"
                                placeholder="Email..."
                                title="Vui lòng nhập email"
                                required />
                            <input runat="server" id="input_Fullname"
                                type="text"
                                class="input-field"
                                placeholder="Họ tên: Nguyễn Trọng Hiếu"
                                title="Họ tên"
                                required />
                            <input runat="server" id="input_Mobi"
                                type="text"
                                class="input-field"
                                placeholder="SĐT: 0969905304"
                                title="Số điện thoại"
                                required />
                              <input runat="server" id="input_Mob2"
                                type="text"
                                class="input-field"
                                placeholder="SĐT: 0969905304"
                                title="Số điện thoại 2"
                                required />

                             <input runat="server" id="input_Gender"
                                type="text"
                                class="input-field"
                                placeholder="Phái..."
                                title="Vui lòng nhập Giới Tính"
                                required />
                            <input runat="server" id="input_Address"
                                type="text"
                                class="input-field"
                                placeholder="Địa chỉ:"
                                title="Chúng tôi sẽ giao hàng tới địa chỉ này"
                                required />
                            <uc1:ucMessage runat="server" ID="ucMessage" />
                            <asp:LinkButton ID="LinkButton_Update" OnClick="LinkButton_Update_Click"  Text="Cập nhật" runat="server" class="toggle-btn col-md-5 col-12" />
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

