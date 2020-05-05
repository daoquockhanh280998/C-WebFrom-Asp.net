<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucMiniCart.ascx.cs" Inherits="ucMiniCart" %>

<span runat="server" id="span_Count" class="cart-number">0</span>
<a class="icion fa fa-cart-plus" href="ProductShoppingCart.aspx"></a>

<div class="cart-view">
    <div class="overflow-auto">
        <div runat="server" id="div_Product">
            <asp:Repeater ID="Repeater_Main" runat="server">
                <ItemTemplate>
                    <div class="row cart-view-info">
                        <div class="col-md-3 cart-view-img">
                            <a target="_blank" href='<%# Eval("ID","/ProductDetail.aspx?id={0}") %>' class="cart-view-info-a">
                                <img src='<%# Eval("Avatar") %>' />
                            </a>
                        </div>
                        <div class="col-md-8 cart-view-title">
                            <a target="_blank" href='<%# Eval("ID","/ProductDetail.aspx?id={0}") %>' class="cart-view-info-a">
                                <span><%# Eval("Title") %></span>
                            </a>
                            <div class="row cart-view-total">
                                <div class="col-md-4 cart-view-quantity">
                                    x <span><%# Eval("Quantity") %></span>
                                </div>
                                <div class="col-md-8 cart-view-price">
                                    = <span><%# Eval("Price","{0:0,00}") %> Đ</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1 cart-view-delete">
                            <asp:LinkButton ID="LinkButton_Remove" OnClientClick="return cofirm('Bạn Có Muốn Xóa Không?')"
                                CommandArgument='<%# Eval("ID") %>' OnClick="LinkButton_Remove_Click" class="button-delete" Text="x" runat="server" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div runat="server" id="div_NoProduct">
            <span>Hiện Chưa Có Sản Phẩm Nào Được Thêm Vào</span>
        </div>
    </div>


    <div class="row cart-view-text">
        <div class="col-md-6 cart-view-tt"><span>Tổng Tiền:</span></div>
        <div class="col-md-6 cart-view-tt-price"><span runat="server" id="span_Amount">0</span>Đ</div>
    </div>
    <div class="row">
        <div class="col-md-5 linktocart"><a href="ProductShoppingCart.aspx">Xem Giỏ Hàng</a></div>
        <div class="col-md-5 linktocheckout"><a href="ProductCheckouts.aspx">Thanh Toán</a></div>
    </div>
</div>

