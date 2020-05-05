<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="OrderList.aspx.cs" Inherits="Admin_OderList" %>

<%@ Register Src="~/Admin/UserControl/ucScriptAdmin.ascx" TagPrefix="uc1" TagName="ucScriptAdmin" %>
<%@ Register Src="~/Admin/UserControl/ucPagging.ascx" TagPrefix="uc1" TagName="ucPagging" %>
<%@ Register Src="~/Admin/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Quản Lý Đơn Hàng</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <div class="main-content">
        <div class="workplace">
            <!--Tiêu đề-->
            <div class="page-header">
                <h1>Danh Sách Hóa Đơn Bán Hàng
                </h1>
            </div>
            <uc1:ucMessage runat="server" ID="ucMessage" />
            <!--Nội dung-->
            <div class="col-md-12">
                <div class="head clearfix">
                    <div class="isw-list col-md-11">
                        <i class="fa fa-list-ul"></i>
                        <h2>Danh Sách Hóa Đơn Bán Hàng
                        </h2>
                    </div>
                    <ul class="buttons col-md-1">
                        <%--   <li>
                            <a href="#" title="Thêm mới" class="fa fa-plus-circle"></a>
                        </li>
                        <li>
                            <a href="#" title="Xóa chọn" class="fa fa-trash-alt"></a>
                        </li>--%>
                    </ul>
                </div>
                <div class="block-fluid">
                    <div class="account-category-post">
                        <asp:Panel runat="server" DefaultButton="LinkButton_Search" class="bl bl clearfix" Style="padding-left: 10px;">
                            <div class="search col-md-4">
                                <input runat="server" id="input_Keyword" type="text"
                                    placeholder="Lọc theo: Mã Đơn Hàng Hoặc Email "
                                    class="col-md-12" />

                            </div>
                            <div class="col-md-4">
                                <input runat="server" id="input_StartDay" type="text"
                                    placeholder="Ngày Bắt Đầu"
                                    class="col-md-5" />
                                <input runat="server" id="input_EndDay" type="text"
                                    placeholder="Ngày Kết Thúc"
                                    class="col-md-5" />
                            </div>
                            <div class="dataTables_length col-md-2">
                                <asp:LinkButton ID="LinkButton_Search" runat="server" class="btn mybtn input-icon link-search"
                                    OnClick="LinkButton_Search_Click">
                                    <span class="message">Tìm Kiếm</span>
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
                                    <th width="120px" class="center">Mã Đơn Hàng
                                    </th>
                                    <th width="140px" class="center">Ngày Đặt Hàng
                                    </th>
                                    <th>Thông Tin Người Mua Hàng
                                    </th>
                                    <th width="200px" class="center">Số Tiền Thanh Toán
                                    </th>
                                    <th width="170px" class="center">Hình Thức Thanh Toán
                                    </th>
                                    <th width="170px" class="center">Tình Trạng Giao Hàng
                                    </th>
                                    <th width="120px" class="center">Thao Tác
                                    </th>
                                </tr>
                            </thead>
                            <tbody style="font-size: 13px;">
                                <asp:Repeater ID="Repeater_Main" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <div class="middle">
                                                    <p><%# Eval("Code") %><%# Eval("OrderID") %></p>
                                                </div>
                                            </td>
                                            <td class="center middle"><%# Eval("CreateTime","{0:dd/MM/yyy}") %>
                                            </td>
                                            <td class="middle">
                                                <h4>Họ Tên: <%# Eval("FullName") %>
                                                </h4>
                                                <h4>Email: <%# Eval("Email") %>
                                                </h4>
                                                <p>Mobi:<%# Eval("Mobi") %></p>
                                                <p>Địa Chỉ:<%# Eval("Address") %></p>
                                            </td>
                                            <td class="center middle">
                                                <p><%# Eval("Total") %></p>
                                                <%--<p>(<%# Eval("ChargeStatus").ToBool() == true ? "Đã Thanh Toán" : "Chưa Thanh Toán" %>)</p>--%>
                                                <div class="ChargeStatus">
                                                    <asp:LinkButton ID="LinkButton_ChargeStatus" OnClick="LinkButton_ChargeStatus_Click" CommandArgument='<%# Eval("OrderID") %>' runat="server"
                                                        class='<%# Eval("ChargeStatus").ToBool() == true ? "btn active btn-block" : "btn lock btn-block" %>'>
                                                            <i class='<%# Eval("ChargeStatus").ToBool() == true ? "fas fa-check" : "fas fa-lock" %>' style="padding-right: 5px;"></i>
                                                            <%# Eval("ChargeStatus").ToBool() == true ? "Đã Thanh Toán" : "Chưa Thanh Toán" %>
                                                    </asp:LinkButton>
                                                </div>
                                            </td>
                                            <td class="center middle">
                                                <%# Eval("PaymentMethod").ToBool() == true ? "Thanh Toán Qua Ngân Lượng" : "Thanh Toán Tại Nhà" %>
                                            </td>
                                            <td class="center middle">
                                                <%-- <%# Eval("DeliverStatus").ToBool() == true ? "Đã Giao Hàng" : "Chưa Giao Hàng" %>--%>
                                                <div class="DeliverStatus">
                                                    <asp:LinkButton ID="LinkButton_DeliverStatus" OnClick="LinkButton_DeliverStatus_Click" CommandArgument='<%# Eval("OrderID") %>' runat="server"
                                                        class='<%# Eval("DeliverStatus").ToBool() == true ? "btn active btn-block" : "btn lock btn-block" %>'>
                                                            <i class='<%# Eval("DeliverStatus").ToBool() == true ? "fas fa-check" : "fas fa-lock" %>' style="padding-right: 5px;"></i>
                                                            <%# Eval("DeliverStatus").ToBool() == true ? "Đã Giao Hàng" : "Chưa Giao Hàng" %>
                                                    </asp:LinkButton>
                                                </div>
                                            </td>
                                            <td>
                                                <p class="info">
                                                   <a class="btn btn-block fancybox-iframe" href='<%# Eval("OrderID","OrderDetail.aspx?id={0}") %>'>
                                                        <i class="fa fa fa-exchange-alt" style="padding-right: 5px;"></i>
                                                        <span class="icon-refresh icon-white"></span>Hiển Thị Chi Tiết
                                                    </a>
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

</asp:Content>

