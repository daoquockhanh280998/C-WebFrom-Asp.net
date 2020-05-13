$(function () {
    $('.carousel').carousel({
        interval: 3300
    });

    //An cac menu chi co 1 con
    $("#navbarSupportedContent .dropdown-menu .dropdown").each(function () {
        var childCount = $(this).find("li").length;
        console.log(childCount);
        if (childCount <= 1) {
            $(this).find("ul").remove();
            $(this).find("a p i").remove();
        }
    });

    //Tự động active hình thumb trong main-carousel
    $('#main-carousel-container').on('slide.bs.carousel', function (e) {
        // Lấy vị trí slide mới
        var index = e.to;

        // Bỏ chọn active trên tất cả hình thumb
        $("#main-carousel .thumb .coll").removeClass("active");
        //Tìm hình thumb tại vị trí mới, active nó
        $("#main-carousel .thumb .coll").eq(index).addClass("active");


    })
});
