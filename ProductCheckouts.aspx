<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductCheckouts.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Kiểm Tra Thanh Toán</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <main>
        <div id="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-7 col-12 main">
                        <div class="section">
                            <div class="section-header">
                                <h2>Thông tin giao hàng</h2>
                            </div>
                            <div class="section-content">
                                <div class="fieldset">
                                    <div class="field ">
                                        <div class="field-input-wrapper">
                                            <label class="field-label" for="billing_address_email">Email:</label>
                                            <input runat="server" id="input_Email" placeholder="Email" class="field-input" size="30" type="text" value="">
                                        </div>
                                    </div>
                                    <div class="field ">
                                        <div class="field-input-wrapper">
                                            <label class="field-label" for="billing_address_full_name">Họ và tên:</label>
                                            <input runat="server" id="input_Fullname" placeholder="Họ và tên" class="field-input" size="30" type="text" value="">
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="field-input-wrapper">
                                            <label class="field-label" for="billing_address_phone">Số điện thoại:</label>
                                            <input runat="server" id="input_Mobi" placeholder="Số điện thoại " class="field-input" maxlength="11" type="text">
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="field-input-wrapper">
                                            <label class="field-label" for="billing_address_phone">Thêm Số Điện Thoại Khác:</label>
                                            <input runat="server" id="input_Mobi2" placeholder="Số điện thoại " class="field-input" maxlength="11" type="text">
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="field-input-wrapper">
                                            <input runat="server" id="radio_GenderMale" name="gender" type="radio" value="1" checked />
                                            Nam
                                         <input runat="server" id="radio_GenderFemale" name="gender" type="radio" value="0" />
                                            Nữ
                                        </div>
                                    </div>
                                    <div class="field ">
                                        <div class="field-input-wrapper">
                                            <label class="field-label" for="billing_address_address1">Địa chỉ</label>
                                            <input runat="server" id="input_Address" placeholder="Địa chỉ" class="field-input" type="text">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="section-title">
                                <h2>Phương thức thanh toán</h2>
                            </div>
                            <div class="section-checkouts">
                                <div class="content-box">
                                    <div class="radio-wrapper content-box-row clearfix">
                                        <div class="radio-input">
                                            <input runat="server" id="radio_payment_Home" class="input-radio" type="radio" >
                                        </div>
                                        <span class="radio-label-primary">Thanh toán khi giao hàng (COD)</span>
                                    </div>
                                    <div class="radio-wrapper content-box-row clearfix">
                                        <div class="radio-input">
                                            <input runat="server" id="radio_payment_NganLuong" class="input-radio" type="radio" >
                                        </div>
                                        <span class="radio-label-primary">Chuyển Khoản Qua Ngân Lượng</span>
                                    </div>
                                </div>
                            </div>
                            <div class="step-footer">
                                <a class="step-footer-previous-link" href="/ProductShoppingCart.html">
                                    <i class="fa fa-angle-left"></i>
                                    Giỏ hàng
                                </a>
                                <div id="form_next_step" <%--accept-charset="UTF-8" method="post"--%>>
                                    <input name="utf8" type="hidden" value="✓">
                                    <asp:LinkButton ID="LinkButton_CheckOut" OnClick="LinkButton_CheckOut_Click"  runat="server" class="step-footer-continue-btn btn" >
                                        <span class="btn-content">Hoàn tất đơn hàng</span>
                                        <i class="btn-spinner icon icon-button-spinner"></i>
                                    </asp:LinkButton>

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 col-12 sidebar">
                        <div class="sidebar-content">
                            <div class="order-summary order-summary-is-collapsed">
                                <h2>Thông tin đơn hàng</h2>
                                <div class="order-summary-sections">
                                    <div class="order-summary-section order-summary-section-product-list overflow-auto" data-order-summary-section="line-items">
                                        <table class="product-table">
                                            <thead>
                                                <tr>
                                                    <th scope="col"><span class="visually-hidden"></span></th>
                                                    <th scope="col"><span class="visually-hidden"></span></th>
                                                    <th scope="col"><span class="visually-hidden"></span></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="Repeater_Main" runat="server">
                                                    <ItemTemplate>
                                                        <tr class="product" data-product-id="1023842294" data-variant-id="1053439571">
                                                            <td class="product-image">
                                                                <div class="product-thumbnail">
                                                                    <div class="product-thumbnail-wrapper">
                                                                        <a target="_blank" href='<%# Eval("ID","/ProductDetail.aspx?id={0}") %>'>
                                                                            <img class="product-thumbnail-image" src='<%# Eval("Avatar") %>' alt="">
                                                                        </a>
                                                                    </div>
                                                                    <span class="product-thumbnail-promotions" aria-hidden="true"><%# Eval("Promotions") %></span>
                                                                </div>
                                                            </td>
                                                            <td class="product-description">
                                                                <a target="_blank" href='<%# Eval("ID","/ProductDetail.aspx?id={0}") %>'>
                                                                    <span class="product-description-name order-summary-emphasis"><%# Eval("Title") %></span>
                                                                </a>
                                                            </td>
                                                            <td class="product-quantity">
                                                                <div class="input-prepend input-append">
                                                                    <asp:LinkButton ID="LinkButton_Down" CommandArgument='<%# Eval("ID") %>' OnClick="LinkButton_Down_Click" class="btn-quantity" runat="server"><i class="fa fa-chevron-circle-left"></i></asp:LinkButton>
                                                                    <input runat="server" id="input_Quantity" readonly class="item-quantity" type="text" value='<%# Eval("Quantity") %>' />
                                                                    <asp:LinkButton ID="LinkButton_Up" CommandArgument='<%# Eval("ID") %>' OnClick="LinkButton_Up_Click" class="btn-quantity" runat="server"><i class="fa fa-chevron-circle-right"></i></asp:LinkButton>
                                                                </div>
                                                            </td>
                                                            <td class="product-price">
                                                                <span class="order-summary-emphasis"><%# Eval("OldPrice","{0:0,00}") %> Đ</span>
                                                            </td>
                                                            <td class="product-delete">
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
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="order-summary-section order-summary-section-discount" data-order-summary-section="discount">
                                        <div id="form_discount_add" <%--accept-charset="UTF-8" method="post"--%>>
                                            <input name="utf8" type="hidden" value="✓">
                                            <div class="fieldset">
                                                <div class="field">
                                                    <div class="field-input-btn-wrapper">
                                                        <div class="field-input-wrapper">
                                                            <input placeholder="Mã giảm giá" class="field-input" data-discount-field="true" autocomplete="off"  spellcheck="false" size="30" type="text" id="discount.code" name="discount.code" value="">
                                                        </div>
                                                        <button type="submit" class="field-input-btn btn btn-default btn-disabled">
                                                            <span class="btn-content">Sử dụng</span>
                                                        </button>
                                                    </div>
                                                    <p class="field-message field-message-error">Không tìm thấy mã giảm giá</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="order-summary-section order-summary-section-total-lines payment-lines" data-order-summary-section="payment-lines">
                                        <table class="total-line-table">

                                            <tbody>
                                                <tr class="total-line total-line-subtotal">
                                                    <td class="total-line-name">Tạm Tính:</td>
                                                    <td class="total-line-price">
                                                        <span runat="server" id="span_Total" class="order-summary-emphasis" data-checkout-subtotal-price-target="4000000">0₫
                                                        </span>
                                                    </td>
                                                </tr>
                                                <tr class="total-line total-line-subtotal">
                                                    <td class="total-line-name">Giảm:</td>
                                                    <td class="total-line-price">
                                                        <span runat="server" id="span_Bonus" class="order-summary-emphasis" data-checkout-subtotal-price-target="4000000">- 0₫
                                                        </span>
                                                    </td>
                                                </tr>

                                                <tr class="total-line total-line-shipping">
                                                    <td class="total-line-name">Phí vận chuyển</td>
                                                    <td class="total-line-price">
                                                        <span runat="server" id="span_Ship" class="order-summary-emphasis" data-checkout-total-shipping-target="2500000">0đ

                                                        </span>
                                                    </td>
                                                </tr>

                                            </tbody>
                                            <tfoot class="total-line-table-footer">
                                                <tr class="total-line">
                                                    <td class="total-line-name payment-due-label">
                                                        <span class="payment-due-label-total">Số Tiền Thanh Toán:</span>
                                                    </td>
                                                    <td class="total-line-name payment-due">
                                                        <span class="payment-due-currency">VND</span>
                                                        <span runat="server" id="span_AmountPay" class="payment-due-price" data-checkout-payment-due-target="4000000">0₫
                                                        </span>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <uc1:ucMessage runat="server" ID="ucMessage" />

                    </div>

                </div>
            </div>
        </div>
    </main>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="Server">
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
        AOS.init({
            offset: 70,
            duration: 1000
        });
    </script>
    <script src="../js/jquery-3.0.0.js"></script>
    <script src="../js/jquery.smartmenus.js"></script>
    <script src="../js/jquery.smartmenus.bootstrap-4.js"></script>
    <link href="css/swiper.min.css" rel="stylesheet" />
    <script src="popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="../js/Script.js"></script>
</asp:Content>

