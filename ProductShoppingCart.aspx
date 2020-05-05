<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductShoppingCart.aspx.cs" Inherits="ProductShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>ProductShoppingCart</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <section id="account-tab-home" class="account">
        <div class="tab-pane" id="tab-cart">
            <div class="container">
                <h2>Giỏ hàng:</h2>
                <table class="table table-sm">
                    <thead>
                        <tr>
                            <th class="image">&nbsp</th>
                            <th class="item">Tên sản phẩm</th>
                            <th class="qty">Số lượng</th>
                            <th class="price">Giá Cũ</th>
                            <th class="price">Giá Mới</th>
                            <th class="remove">&nbsp</th>
                        </tr>
                    </thead>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <tbody>
                                <asp:Repeater ID="Repeater_Main" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="image">
                                                <a target="_blank" href='<%# Eval("ID","/ProductDetail.aspx?id={0}") %>'>
                                                    <img src='<%# Eval("Avatar") %>' alt="">
                                                </a>
                                            </td>
                                            <td class="item">
                                                <a target="_blank" href='<%# Eval("ID","/ProductDetail.aspx?id={0}") %>'>
                                                    <strong><%# Eval("Title") %></strong>
                                                </a>
                                            </td>
                                            <td class="qty">
                                                <%--<input runat="server" id="input_Quantity"  readonly type="number" name="updates[]" min="1"  value="1"
                                            onfocus="this.select();" class="tc item-quantity">--%>
                                                <div class="input-prepend input-append">
                                                    <asp:LinkButton ID="LinkButton_Down" CommandArgument='<%# Eval("ID") %>' OnClick="LinkButton_Down_Click" class="btn-quantity" runat="server"><i class="fa fa-chevron-circle-left"></i></asp:LinkButton>
                                                    <input runat="server" id="input_Quantity" readonly class="item-quantity" type="text" value='<%# Eval("Quantity") %>' />
                                                    <asp:LinkButton ID="LinkButton_Up" CommandArgument='<%# Eval("ID") %>' OnClick="LinkButton_Up_Click" class="btn-quantity" runat="server"><i class="fa fa-chevron-circle-right"></i></asp:LinkButton>
                                                </div>
                                            </td>
                                            <td class="price"><span><%# Eval("OldPrice","{0:0,00}") %> Đ</span></td>
                                            <td class="price"><span><%# Eval("Price","{0:0,00}") %> Đ</span></td>
                                            <td class="remove">
                                                <div class="button-remove">
                                                    <asp:LinkButton ID="LinkButton_Remove"
                                                        OnClientClick="return cofirm('Bạn Có Muốn Xóa Không?')"
                                                        CommandArgument='<%# Eval("ID") %>'
                                                        OnClick="LinkButton_Remove_Click"
                                                        class="button-delete" Text="x" runat="server" />
                                                </div>
                                            </td>

                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <tr class="summary">
                                    <td class="image">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td class="text-center"><b>Tạm Tính:</b></td>
                                    <td class="price">
                                        <span class="total">
                                            <strong runat="server" id="strong_Total">0₫</strong>
                                        </span>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="summary">
                                    <td class="image">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td class="text-center"><b>Giảm:</b></td>
                                    <td class="price">
                                        <span class="total"><strong runat="server" id="strong_Bonus">0₫</strong>
                                        </span>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="summary">
                                    <td class="image">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td class="text-center"><b>Tổng Cộng:</b></td>
                                    <td class="price">
                                        <span class="total">
                                            <strong runat="server" id="strong_Amount">0₫</strong>
                                        </span>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </tbody>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </table>
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12 inner-left inner-right">
                        <div class="checkout-buttons clearfix">
                            <label for="note">Ghi chú </label>
                            <textarea id="note" name="note" rows="8" cols="50"></textarea>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12 cart-buttons inner-right inner-left">
                        <div class="buttons clearfix">
                            <a href="ProductCheckouts.aspx" type="submit" id="checkout" class="button-default" name="checkout" value="">Thanh toán</a>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12  col-xs-12 continue-shop">

                        <a href="/Default.aspx">
                            <i class="fa fa-reply"></i>Tiếp tục mua hàng
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="Server">
</asp:Content>

