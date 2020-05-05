<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="OrderDetail.aspx.cs" Inherits="Admin_OrderDetail" %>

<%@ Register Src="~/Admin/UserControl/ucScriptAdmin.ascx" TagPrefix="uc1" TagName="ucScriptAdmin" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Chi Tiết Đơn Hàng</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <div class="main-content">

        <div class="profile-card">
            <asp:Repeater ID="Repeater_Main" runat="server">
                <ItemTemplate>
                    <div class="order-box">
                        <h5>ĐƠN HÀNG: #<%# Eval("Code") %><%# Eval("OrderID") %>, <span>Ngày Đặt Hàng - <%# Eval("CreateTime","{0:dd/MM/yyyy HH:mm}") %></span></h5>

                        <div class="order">
                            <div class="order-title">Chi tiết đơn hàng</div>
                            <table class="table table-borderless">
                                <thead>
                                    <tr>
                                        <td  class="image">Hình Ảnh</td>
                                        <td class="item">Tên Sản phẩm</td>
                                        <td class="qty">Số lượng</td>
                                        <td class="price">Giá Cũ</td>
                                        <td class="price">Giá Mới</td>
                                    </tr>
                                </thead>
                                <tbody class="overflow-auto ">
                                    <asp:Repeater ID="Repeater_Sub" DataSource='<%#Eval("OrderDetailList") %>' runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td class="image"><a href='<%# Eval("ProductID","/ProductDetail.aspx?id={0}") %>'>
                                                    <img src='<%# Eval("Avatar") %>' alt="">
                                                </a></td>
                                                <td class="item"><a href='<%# Eval("ProductID","/ProductDetail.aspx?id={0}") %>'><%# Eval("Title") %></a></td>
                                                <td class="qty"><%# Eval("Quantity") %></td>
                                                <td class="price"><%# Eval("OldPrice","{0:0,00}") %>đ</td>
                                                <td class="price"><%# Eval("Price","{0:0,00}") %>đ</td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </tbody>
                                <tr class="summary">
                                    <td class="item"></td>
                                    <td class="code"></td>
                                    <td class="price"></td>
                                    <td class="qty"><span>Phí Giao Hàng:</span></td>
                                    <td class="total"><span><%# Eval("Ship","{0:0,00}") %>Đ</span></td>
                                </tr>
                                <tr class="summary">
                                    <td class="item"></td>
                                    <td class="code"></td>
                                    <td class="price"></td>
                                    <td class="qty"><span>Tổng tiền:</span></td>
                                    <td class="total"><span><%# Eval("Total","{0:0,00}") %>Đ</span></td>
                                </tr>
                            </table>
                        </div>
                        <div class="buyer-profile">
                            <div class="col-md-6 col-sm-12 col-12">
                                <h5>Thông tin khách hàng</h5>
                                <h6><span>Họ Tên: </span><%# Eval("FullName") %></h6>
                                <h6><span>Email: </span><%# Eval("Email") %></h6>
                                <h6><span>Số điện thoại 1: </span><%# Eval("Mobi") %></h6>
                                <h6><span>Số điện thoại 2: </span><%# Eval("Mobi2") %></h6>
                                <h6><span>Thanh Toán: </span><%# Eval("ChargeStatus").ToBool() == true ? "Đã Thanh Toán" : "Chưa Thanh Toán" %></h6>
                                <h6><span>Tình Trạng Giao Hàng: </span><%# Eval("DeliverStatus").ToBool() == true ? "Đã Giao Hàng" : "Chưa Giao Hàng" %></h6>
                            </div>
                            <div class="col-md-6 col-sm-12 col-12">
                                <h5>Địa chỉ giao hàng/Ghi chú</h5>
                                <h6><span>Địa chỉ giao hàng: </span><%# Eval("Address") %></h6>
                                <h6><span>Ghi chú: </span></h6>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="Server">
    <uc1:ucScriptAdmin runat="server" ID="ucScriptAdmin" />
    <script src="../js/jquery-3.0.0.js"></script>
    <script src="../js/jquery.smartmenus.js"></script>
    <script src="../js/jquery.smartmenus.bootstrap-4.js"></script>
    <link href="css/swiper.min.css" rel="stylesheet" />
    <script src="popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="../js/Script.js"></script>
</asp:Content>

