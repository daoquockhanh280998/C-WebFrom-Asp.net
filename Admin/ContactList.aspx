<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ContactList.aspx.cs" Inherits="Admin_Default" %>

<%@ Register Src="~/Admin/UserControl/ucScriptAdmin.ascx" TagPrefix="uc1" TagName="ucScriptAdmin" %>
<%@ Register Src="~/Admin/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>
<%@ Register Src="~/Admin/UserControl/ucPagging.ascx" TagPrefix="uc1" TagName="ucPagging" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <div class="main-content">
        <div class="workplace">
            <!--Tiêu đề-->
            <div class="page-header">
                <h1>Danh Sách Các Thư Liên Hệ
                </h1>
            </div>
            <uc1:ucMessage runat="server" ID="ucMessage" />
            <!--Nội dung-->
            <div class="col-md-12">
                <div class="head clearfix">
                    <div class="isw-list col-md-11">
                        <i class="fa fa-list-ul"></i>
                        <h2>Đăng / cập nhật thư liên hệ
                        </h2>
                    </div>
                    <ul class="buttons col-md-1">
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
                                <input class="col-md-6" type="text" placeholder="Lọc theo: tên đăng nhập, họ tên, email hoặc SĐT" />
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
                            <table>
                                <thead>
                                    <tr>
                                        <th width="25px" class="center">
                                            <input type="checkbox" name="checkall" />
                                        </th>
                                        <th width="102px" class="center">Hình
                                        </th>
                                        <th width="80px" class="center">Mã số
                                        </th>
                                        <th width="60px" class="center">Email
                                        </th>
                                        <th width="80px" class="center">Họ Và Tên 
                                        </th>
                                        <th width="80px" class="center">SĐT
                                        </th>
                                        <th>Chủ Đề/Nội Dung Thư 
                                        </th>
                                        <th width="100px" class="center">Ngày Gửi
                                        </th>
                                        <th width="100px" class="center">Thao Tác
                                        </th>
                                    </tr>
                                </thead>
                                <tbody style="font-size: 13px;">
                                    <asp:Repeater ID="Repeater_Main" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td class="center middle">
                                                    <input type="checkbox" name="checkbox" />
                                                </td>
                                                <td>
                                                    <div class="image">
                                                        <img src="/FileUpload/image/thư.jpg" />
                                                    </div>

                                                </td>
                                                <td class="center middle"><%# Eval("ContactID") %>
                                                </td>
                                                <td class="center middle"><%# Eval("Email") %>
                                                </td>
                                                <td class="center middle"><%# Eval("FullName") %>
                                                </td>
                                                <td class="center middle"><%# Eval("Mobi") %>
                                                </td>
                                                <td class="middle">
                                                    <h4>Chủ Đề:<%# Eval("topic") %>
                                                    </h4>
                                                    <p>Nội Dung:<%# Eval("Content") %></p>
                                                </td>
                                                <td class="center middle">
                                                    <%# Eval("CreateTime","{0:dd/MM/yyyy}") %><br />
                                                    <%# Eval("CreateTime","{0:HH:mm:ss}") %>
                                                </td>
                                                <td>
                                                    <p class="info">
                                                      
                                                        <a class="btn btn-block" href="AccountEdit.html?id=admin">
                                                            <i class="fa fa fa-edit" style="padding-right: 5px;"></i>
                                                            <span class="icon-edit icon-white"></span>Trả Lời Thư Liên Hệ
                                                        </a>

                                                        <asp:LinkButton ID="LinkButton_Delete" OnClick="LinkButton_Delete_Click"
                                                        CommandArgument='<%# Eval("ContactID") %>' OnClientClick="ConfirmDelete()"
                                                        runat="server" class="btn btn-block">
                                                              <i class="fa fa fa-trash-alt" style="padding-right: 5px;"></i>
                                                            <span class="icon-trash icon-white"></span>Xóa dữ liệu này
                                                    </asp:LinkButton>

                                                       
                                                    </p>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                            <!--Pagging-->
                            <uc1:ucPagging runat="server" ID="ucPagging" />
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

