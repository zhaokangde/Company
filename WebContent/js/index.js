$(".sidebar-menu").click(function () {
    var url = $(event.target).parent().attr("url");
    if(url != undefined){
        $(".sidebar-menu ul li").removeClass("active");
        $(".sidebar-menu ul li a i").removeClass("fa-circle");
        $(".sidebar-menu ul li a i").addClass("fa-circle-o");
        $(event.target).parent().addClass("active");
        $(event.target).children("i").removeClass("fa-circle-o");
        $(event.target).children("i").addClass("fa-circle");
        $.get(url, function (data) {
            $(".content").html(data);
        });
    }
});