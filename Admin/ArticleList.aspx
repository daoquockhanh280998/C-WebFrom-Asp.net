<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ArticleList.aspx.cs" Inherits="Admin_Default" %>

<%@ Register Src="~/Admin/UserControl/ucScriptAdmin.ascx" TagPrefix="uc1" TagName="ucScriptAdmin" %>
<%@ Register Src="~/Admin/UserControl/ucPagging.ascx" TagPrefix="uc1" TagName="ucPagging" %>
<%@ Register Src="~/Admin/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Danh Sách Tin Tức</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <div class="main-content">
        <div class="workplace">
            <!--Tiêu đề-->
            <div class="page-header">
                <h1>Danh Sách Tin Tức
                </h1>
            </div>
            <uc1:ucMessage runat="server" ID="ucMessage" />
            <!--Nội dung-->
            <div class="col-md-12">
                <div class="head clearfix">
                    <div class="isw-list col-md-11">
                        <i class="fa fa-list-ul"></i>
                        <h2>Danh Sách Tin Tức
                        </h2>
                    </div>
                    <ul class="buttons col-md-1">
                        <li>
                            <a href="ArticleEdit.aspx" title="Thêm mới" class="fa fa-plus-circle"></a>
                        </li>
                        <li>
                            <a title="Xóa chọn" class="fa fa-trash-alt"></a>
                        </li>
                    </ul>
                </div>
                <div class="block-fluid">
                    <div class="account-category-post">
                        <asp:Panel runat="server" DefaultButton="LinkButton_Search" class="bl bl clearfix" Style="padding-left: 10px;">
                            <asp:DropDownList ID="DropDownList_Category" runat="server"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="DropDownList_Category_SelectedIndexChanged"
                                class="col-md-4" />
                            <div class="search col-md-6">
                                <input runat="server" id="input_Keyword" type="text"
                                    placeholder="Lọc theo: tên đăng nhập, họ tên, email hoặc SĐT"
                                    class="col-md-10" />

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
                            <thead>
                                <tr>
                                    <th width="60px" class="center">
                                        <input type="checkbox" name="checkall" />
                                    </th>
                                    <th width="200px" class="center">Hình
                                    </th>
                                    <th width="80px" class="center">Mã số
                                    </th>
                                    <th>Tiêu đề / Lượt xem / Loại / Mô tả
                                    </th>
                                    <th width="170px" class="center">Người đăng /Ngày
                                    </th>
                                    <th width="100px" class="center">Xem / Xóa / Sửa
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
                                                    <img src='<%# Eval("Avatar") %>' alt="">
                                                </div>
                                            </td>
                                            <td class="center middle"><%# Eval("ArticleID") %>
                                            </td>
                                            <td class="middle">
                                                <h4>
                                                    <%# Eval("Title") %>
                                                    (<%# Eval("ViewTime") %> lượt xem)
                                                </h4>
                                                <p>Loại: <b><%# Eval("MainCatTitle") %> - <%# Eval("CatTitle") %></b></p>
                                                <p><%# Eval("Dercription") %></p>
                                            </td>
                                            <td class="center middle"><%# Eval("CreateBy") %><br />
                                                <br />
                                                <%# Eval("CreateTime","{0:dd/MM/yyyy}") %><br />
                                                <%# Eval("CreateTime","{0:HH:mm:ss}") %>
                                            </td>
                                            <td>
                                                <p class="info">
                                                    <a class="btn btn-block fancybox-iframe" href='<%# Eval("ArticleID","ArticleDetail.aspx?id={0}") %>'>
                                                        <i class="fa fa fa-exchange-alt" style="padding-right: 5px;"></i>
                                                        <span class="icon-refresh icon-white"></span>Hiển Thị Chi Tiết
                                                    </a>

                                                    <a class="btn btn-block" href='<%# Eval("ArticleID","ArticleEdit.aspx?id={0}") %>'>
                                                        <i class="fa fa fa-edit" style="padding-right: 5px;"></i>
                                                        <span class="icon-edit icon-white"></span>Chỉnh sửa thông tin
                                                    </a>

                                                    <asp:LinkButton ID="LinkButton_Delete" OnClick="LinkButton_Delete_Click"
                                                        CommandArgument='<%# Eval("ArticleID") %>' OnClientClick="ConfirmDelete()"
                                                        runat="server" class="btn btn-block">
                                                              <i class="fa fa fa-trash-alt" style="padding-right: 5px;"></i>
                                                            <span class="icon-trash icon-white"></span>Xóa dữ liệu này
                                                    </asp:LinkButton>

                                                    <asp:LinkButton ID="LinkButton_Status" OnClick="LinkButton_Status_Click" CommandArgument='<%# Eval("ArticleID") %>' runat="server"
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
                        <!--Pagging-->
                        <uc1:ucPagging runat="server" ID="ucPagging" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="Server">
    <uc1:ucScriptAdmin runat="server" ID="ucScriptAdmin" />
    <script>
        function ConfirmDelete() {
            var x = confirm("Are you sure you want to delete?");
            if (x)
                return true;
            else
                return false;
        }

    </script>
</asp:Content>

