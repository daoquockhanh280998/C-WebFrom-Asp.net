<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AccountList.aspx.cs" Inherits="Admin_Default" %>

<%@ Register Src="~/Admin/UserControl/ucScriptAdmin.ascx" TagPrefix="uc1" TagName="ucScriptAdmin" %>
<%@ Register Src="~/Admin/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <div class="main-content">
        <div class="workplace">
            <!--Tiêu đề-->
            <div class="page-header">
                <h1>Danh Sách Tài Khoản
                </h1>
            </div>
            <uc1:ucMessage runat="server" ID="ucMessage" />

            <!--Nội dung-->
            <div class="col-md-12">
                <div class="head clearfix">
                    <div class="isw-list col-md-11">
                        <i class="fa fa-user"></i>
                        <h2>Danh sách tài khoản
                        </h2>
                    </div>
                    <ul class="buttons col-md-1">
                        <li>
                            <asp:LinkButton ID="LinkButton_Add"  OnClick="LinkButton_Add_Click" runat="server" chititle="Thêm mới" class="fa fa-plus-circle" />
                        </li>

                    </ul>
                </div>
                <div class="block-fluid">
                    <div class="account-category-post">
                        <asp:Panel runat="server" DefaultButton="LinkButton_Search" class="bl bl clearfix" Style="padding-left: 10px;">
                            <asp:DropDownList ID="DropDownList_Category" runat="server"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="DropDownList_Category_SelectedIndexChanged"
                                class="col-md-2" />
                            <div class="search col-md-8">
                                <input runat="server" id="input_Keyword" type="text"
                                    placeholder="Lọc theo: tên đăng nhập, họ tên, email hoặc SĐT"
                                    class="col-md-6" />

                                <asp:LinkButton ID="LinkButton_Search" runat="server" class="btn mybtn input-icon link-search"
                                    OnClick="LinkButton_Search_Click">
                                <i class="fa fa-search"></i>
                                &nbsp;
                                </asp:LinkButton>
                            </div>
                            <div class="dataTables_length col-md-2">
                                <asp:LinkButton runat="server"
                                    ID="LinkButton_ClearSearch"
                                    class="btn input-icon"
                                    Style="width: 80px;"
                                    OnClick="LinkButton_ClearSearch_Click">
                                        <span class="close" title="Ẩn thông báo">X</span>
                                            <span class="message">Hủy bộ lọc</span>
                                </asp:LinkButton>
                            </div>
                        </asp:Panel>
                    </div>
                    <!--table-->
                    <div class="bl-table clearfix">
                        <table>
                            <tbody>
                                <asp:Repeater ID="Repeater_Main" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td width="160">
                                                <div class="image">
                                                    <img src='<%# Eval("Avatar") %>' alt="">
                                                </div>
                                            </td>
                                            <td width="400">
                                                <a href="#" class="account"><%# Eval("FullName") %>
                                                </a>
                                                <p class="about">
                                                    <span class="fa fa-user" title="Username"></span>
                                                    <%# Eval("UserName") %>
                                                    <br />
                                                    <span class="fa fa-envelope" title="Email"></span>
                                                    <%# Eval("Email") %>
                                                    <br />
                                                    <span class="fa fa-clock" title="Ngày khởi tạo tài khoản"></span>
                                                    <%# Eval("CreateTime","{0:dd/MM/yyyy}") %>
                                                    <br />
                                                    <span class="fa fa-bell" title="Số điện thoại"></span>
                                                    <%# Eval("Mobi") %>
                                                    <br />
                                                    <span class="fa fa-adjust" title="Phái"></span>
                                                    <%# Eval("Gender").ToBool() == true ? "Nam" :"Nữ" %>
                                                    <br />
                                                </p>
                                            </td>
                                            <td>
                                                <p class="about">
                                                    <span class="fa fa-exclamation-circle" title="Vai trò"></span>
                                                    <%# Eval("CatTitle") %>
                                                    <br />
                                                    <span class="fa fa-home" title="Địa chỉ"></span>
                                                    <%# Eval("Address") %>
                                                </p>
                                            </td>
                                            <td width="250">
                                                <p class="info">
                                                    <%--<a  href='<%# Eval("UserName","AccountPasswordChange.aspx?id={0}") %>'>

                                                    </a>--%>
                                                     <asp:LinkButton ID="LinkButton_ChangePassword"  OnClick="LinkButton_ChangePassword_Click"  CommandArgument='<%# Eval("Username") %>'  runat="server" class="btn btn-block" >
                                                         <i class="fa fa fa-exchange-alt" style="padding-right: 5px;"></i>
                                                        <span class="icon-refresh icon-white"></span>Đổi mật khẩu mới
                                                     </asp:LinkButton>

                                                   <%-- <a class="btn btn-block" href='<%# Eval("UserName","AccountEdit.aspx?id={0}") %>'>

                                                    </a>--%>
                                                    <asp:LinkButton ID="LinkButton_AccountEdit" OnClick="LinkButton_AccountEdit_Click" CommandArgument='<%# Eval("Username") %>'  class="btn btn-block"  runat="server" >
                                                         <i class="fa fa fa-edit" style="padding-right: 5px;"></i>
                                                        <span class="icon-edit icon-white"></span>Chỉnh sửa thông tin
                                                    </asp:LinkButton>

                                                    <asp:LinkButton ID="LinkButton_Delete" OnClick="LinkButton_Delete_Click" CommandArgument='<%# Eval("UserName") %>' runat="server" class="btn btn-block">
                                                              <i class="fa fa fa-trash-alt" style="padding-right: 5px;"></i>
                                                            <span class="icon-trash icon-white"></span>Xóa dữ liệu này
                                                    </asp:LinkButton>

                                                    <asp:LinkButton ID="LinkButton_Status" OnClick="LinkButton_Status_Click" CommandArgument='<%# Eval("UserName") %>' runat="server"
                                                        class='<%# Eval("Status").ToBool() == true ? "btn active btn-block" : "btn lock btn-block" %>'>
                                                            <i class='<%# Eval("Status").ToBool() == true ? "fas fa-check" : "fas fa-lock" %>' style="padding-right: 5px;"></i>
                                                            <%# Eval("Status").ToBool() == true ? "Đang Kích Hoạt, Tạm Khóa Lại" : "Đang Tạm Khóa , Kích Hoạt Lại" %>
                                                    </asp:LinkButton>
                                                </p>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="Server">
    <uc1:ucScriptAdmin runat="server" ID="ucScriptAdmin" />
</asp:Content>

