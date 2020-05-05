<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Client.aspx.cs" Inherits="AccountLogin" %>

<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Account Login</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <div class="hero">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="form-box">
                    <div class="button-box">
                        <div id="btn"></div>
                        <asp:LinkButton ID="LinkButton_Login_header"  OnClick="LinkButton_Login_header_Click"
                            OnClientClick="login()"
                            runat="server"
                            class="toggle-btn"><span>Đăng Nhập</span></asp:LinkButton>
                        <asp:LinkButton runat="server" ID="LinkButton_Register_header"
                            OnClick="LinkButton_Register_header_Click" OnClientClick="register()"
                            class="toggle-btn"><span>Đăng Ký</span></asp:LinkButton>
                    </div>

                    <div runat="server" id="login" class="input-group">
                        <div class="login-register">
                            <input runat="server" id="input_Login_Email" class="input-field"
                                type="text"
                                placeholder="Tài khoản..."
                                title="Vui lòng nhập tài khoản"
                                required />
                            <input runat="server" id="input_Login_Password"
                                type="password"
                                class="input-field"
                                placeholder="Mật khẩu..."
                                title="Vui lòng nhập mật khẩu"
                                required />
                            <uc1:ucMessage runat="server" ID="ucMessage" />
                            <asp:LinkButton Text=" Đăng nhập" class="submit-btn" runat="server" ID="LinkButton_Login" OnClick="LinkButton_Login_Click" />
                        </div>
                    </div>

                    <div runat="server" id="register" class="input-group">
                        <div class="register-login">
                            <input runat="server" id="input_Register_Email"
                                type="text"
                                class="input-field"
                                placeholder="Email..."
                                title="Vui lòng nhập email"
                                required />
                            <input runat="server" id="input_Register_Password"
                                type="password"
                                class="input-field"
                                placeholder="Mật khẩu..."
                                title="Vui lòng nhập mật khẩu"
                                required />
                            <input runat="server" id="input_Register_Repassword"
                                type="password"
                                class="input-field"
                                placeholder="Nhập lại mật khẩu..."
                                title="Vui lòng nhập lại mật khẩu"
                                required />
                            <input runat="server" id="input_Register_Fullname"
                                type="text"
                                class="input-field"
                                placeholder="Họ tên..."
                                title="Vui lòng nhập họ tên"
                                required />
                            <input runat="server" id="input_Register_Mobi"
                                type="text"
                                class="input-field"
                                placeholder="Số Điện Thoại..."
                                title="Vui lòng nhập Số Điện Thoại"
                                required />
                            <div class="controls-gender">
                                <label class="radio inline">
                                    <input runat="server" id="radio_GenderMale" name="gender" checked type="radio" value="1" />
                                    Nam
                                </label>
                                <label class="radio inline">
                                    <input type="radio" runat="server" id="radio_GenderFemale" name="gender" value="0" />
                                    Nữ
                                </label>
                            </div>
                            <input runat="server" id="input_Register_Address"
                                type="text"
                                class="input-field"
                                placeholder="Nhập Địa Chỉ..."
                                title="Vui lòng nhập Địa Chỉ"
                                required />
                            <uc1:ucMessage runat="server" ID="ucMessage1" />
                            <asp:LinkButton class="submit-btn" Text="Đăng ký" runat="server" ID="LinkButton_Register" OnClick="LinkButton_Register_Click" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="Server">

    <script>

        var z = document.getElementById('btn');

        function register() {
            z.style.left = '110px';
        }

        function login() {

            z.style.left = '0';
        }
    </script>

    <script src="../js/jquery-3.0.0.js"></script>
    <script src="../js/jquery.smartmenus.js"></script>
    <script src="../js/jquery.smartmenus.bootstrap-4.js"></script>
    <link href="css/swiper.min.css" rel="stylesheet" />
    <script src="popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="../js/Script.js"></script>
</asp:Content>

