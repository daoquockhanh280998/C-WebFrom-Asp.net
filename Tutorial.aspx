<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Tutorial.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Hướng Dẫn Mua Hàng</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <section id="tutorial-tab-home">
        <ul class="nav nav-tabs nav-fill nav-justified">
            <li class="nav-item">
                <a class="nav-link active"
                    data-toggle="tab"
                    href="#tab-ordering-guide">hướng dẫn đặt hàng
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab-payment-guide">hướng dẫn thanh toán
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab-transport">giao hàng
                </a>
            </li>
        </ul>
        <div class="container">
            <div class="tab-content">
                <div class="tab-pane fade show active" id="tab-ordering-guide">
                    <h3>hướng dẫn đặt hàng</h3>
                      <p>
                        Quý khách có thể đặt hàng trực tuyến ở website vuonsendabd
                            thông qua các bước đặt hàng đơn giản
                    </p>
                    <h5>Đầu Tiên Quý Khách Hãy Đăng Nhập Tài Khoản Nếu Chưa Có Tài Khoản Hãy Đăng Ký</h5>
                      <img class="col-12" src="FileUpload/image/huongdanmuahang/1.PNG" />
                     <img class="col-12" src="FileUpload/image/huongdanmuahang/2.PNG" />
                    <p>
                        Vui lòng tham khảo thông tin chi tiết về từng bước đặt hàng như
                            sau:
                    </p>
                    <h5>1. Tìm kiếm sản phẩm</h5>
                    <p>Quý khách có thể tìm sản phẩm theo 3 cách:</p>
                    <p>1. Gõ tên sản phẩm vào thanh tìm kiếm</p>
                    <p>2. Tìm theo danh mục sản phẩm</p>
                    <img class="col-12" src="FileUpload/image/huongdanmuahang/3.PNG" />
                    <h5>2. Thêm sản phẩm vào giỏ hàng</h5>
                    <p>
                        Khi đã tìm được sản phẩm mong muốn, quý khách vui lòng bấm vào
                            hình hoặc tên sản phẩm để vào được trang thông tin chi tiết của
                            sản phẩm, sau đó:
                    </p>
                    <p>a. Chọn loại chậu mong muốn</p>
                    <p>b. Chọn số lượng mong muốn.</p>
                    <p>c. Thêm sản phẩm vào giỏ hàng.</p>
                    <img class="col-12" src="Admin/images/no_image.png" />
                    <h5>3. Kiểm tra giỏ hàng và đặt hàng</h5>
                    <p>
                        Để đặt nhiều sản phẩm khác nhau vào cùng 1 đơn hàng, vui lòng
                            thực hiện theo các bước sau:
                    </p>
                    <p>
                        a. Chọn "Tiếp tục mua sắm" hoặc click vào logo Vuonsenda để trở
                            về trang chủ
                    </p>
                    <p>b. Thêm sản phẩm vào giỏ hàng như ở Bước 2.</p>
                    <p>
                        *Quá trình này có thể lặp lại cho đến khi quý khách hoàn tất
                            việc bỏ tất cả các sản phẩm cần đặt mua vào giỏ hàng.
                    </p>
                    <p>
                        Sau khi quý khách đã có đủ sản phẩm cần đặt trong giỏ hàng, vui
                            lòng sự dụng mã giảm giá (nếu có) và tiếp tục các bước sau để
                            đặt hàng:
                    </p>
                    <p>c. Điều chỉnh số lượng và cập nhật giỏ hàng</p>
                    <p>
                        d. Ghi chú đơn hàng (Màu sắc chậu, giao hàng giờ hành chính,
                            v.v...)
                    </p>
                    <p>e. Bấm "Thanh toán" để bắt đầu đặt hàng.</p>
                   <img class="col-12" src="FileUpload/image/huongdanmuahang/5.PNG" />
                    <h5>4. Đăng nhập hoặc đăng ký tài khoản</h5>
                    <p>
                        Quý khách vui lòng đăng nhập bằng tài khoản đã có ở Vuonsenda.
                            Trong trường hợp chưa đăng ký tài khoản, quý khách chỉ điền
                            thông tin cần thiết theo mẫu.
                    </p>
                     <img class="col-12" src="FileUpload/image/huongdanmuahang/6.PNG" />
                    <h5>6. Chọn phương thức thanh toán, nhập mã giảm giá (nếu có) và
                            "Đặt Mua"
                    </h5>
                    <p>
                        Vuonsenda hỗ trợ giao hàng và thanh toán tận nơi cho các đơn
                            hàng và được free ship khi đơn hàng trên 300k tại các
                            tỉnh Bình Dương. Quý khách vui lòng tham khảo thêm tại: Các
                            phương thức thanh toán.
                    </p>
                    <p>
                        Tiếp theo quý khách nhập mã giảm giá nếu có và vui lòng bấm
                            "Hoàn tất đơn hàng", hệ thống sẽ bắt đầu tiến hành tạo đơn hàng
                            dựa trên các thông tin quý khách đã đăng ký.
                    </p>
                     <img class="col-12" src="FileUpload/image/huongdanmuahang/7.PNG" />
                     <img class="col-12" src="FileUpload/image/huongdanmuahang/8.PNG" />
                    <h5>7. Sao Khi Đã Điền Đầy Đủ Thông Tin Hãy Chọn Nút Hoàn Tất Đơn Hàng Để Hoàn Thành Đơn Hàng</h5>
                     <img class="col-12" src="FileUpload/image/huongdanmuahang/9.PNG" />
                </div>
                <div class="tab-pane fade" id="tab-payment-guide">
                    <h3>hướng dẫn thanh toán</h3>
                    <p>
                        Hiện tại Vườn sen đá chấp nhận hai phương thức thanh toán như
                            sau:
                    </p>
                    <h5>1. Giao hàng và thu tiền tại nhà (COD):</h5>
                    Vườn đen đá giao hàng và thu tiền tại nhà các đơn hàng có giá trị
                        từ 100.000đ - 2.000.000đ tại các tỉnh Bình Dương
                        <h5>2. Chuyển khoản qua Ngân Lượng <span class="tab-pane_nganluong">nganluong.vn</span></h5>
                    <p>
                        Hướng Dẫn Cách Thanh Toán Qua Ngân Lượng:
                    </p>
                    <h5>B1: Truy Cập Vào <span class="tab-pane_nganluong">nganluong.vn</span> </h5>
                    <p>
                        <img src="FileUpload/image/huongdanthanhtoan/1.PNG" />

                    </p>
                    <h5>B2: Đăng Kí Tài Khoản Và Đăng Nhập </h5>
                    <p>
                        <img src="FileUpload/image/huongdanthanhtoan/2.PNG" />
                        <img src="FileUpload/image/huongdanthanhtoan/3.PNG" />
                    </p>
                    <h5>B3: Vào Phần Ví Ngân Lượng Chọn Cách Hình Thức Nạp Tiền Vào Ví </h5>
                    <p>

                        <img src="FileUpload/image/huongdanthanhtoan/4.PNG" />

                    </p>
                    <p>Lưu Ý : Hãy Xác Thực Tài Khoản Mới Có Thể Nạp Tiền</p>
                    <p>
                        Vậy Là Quý Khách Đã Có Thể Thanh Toán Qua Ngân Lượng
                    </p>
                </div>
                <div class="tab-pane fade" id="tab-transport">
                    <h3>giao hàng</h3>
                    <h5>1. Khu vực giao hàng</h5>
                    <p>Bình Dương: Phú Giáo, Thủ Dầu Một, Thuận An</p>
                    <h5>2. Thời gian giao hàng</h5>
                    <p>
                        Thời gian giao hàng được tính từ khi quý khách hoàn tất bước đặt
                            hàng. Vườn sen đá sẽ tiến hành giao hàng trong thời gian 7 ngày
                            làm việc. Vườn sẽ thông báo cho quý khách trước 1 ngày.
                    </p>
                    <p>
                        Vườn sen đá giao hàng trong giờ hành chính từ Thứ 2 đến Thứ 7.
                            Do vậy quý khách vui lòng nhập địa chỉ nhận hàng trong giờ hành
                            chính lúc đặt hàng. Ngoài ra, vườn không có dịch vụ giao hàng
                            hẹn ngày, hẹn giờ.
                    </p>
                    <h3>3. Kiểm tra sản phẩm lúc đặt hàng</h3>
                    <p>
                        Khi nhận hàng, quý khách vui lòng kiểm tra số lượng và chất
                            lượng cây khi có mặt nhân viên giao hàng. Vườn sen đá chấp nhận
                            thu lại những cây gẫy lá, hư hỏng do quá trình vận chuyển. Sản
                            phẩm thiếu giao thiếu sẽ được vườn giao lại miễn phí hoặc hoàn
                            tiền lúc nhận hàng. Vườn sen đá không giải quyết các khiếu nại
                            sau khi nhân viên giao hàng đã đi khỏi.
                    </p>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="Server">

    <script src="../js/jquery-3.0.0.js"></script>
    <script src="../js/jquery.smartmenus.js"></script>
    <script src="../js/jquery.smartmenus.bootstrap-4.js"></script>
    <link href="css/swiper.min.css" rel="stylesheet" />
    <script src="popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="../js/Script.js"></script>
</asp:Content>

