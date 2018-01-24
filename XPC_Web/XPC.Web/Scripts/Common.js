
var currentImage;
var currentIndex = -1;
var interval;
function showImage(index) {
    if (index < $('#bigPic .pic').length) {
        var indexImage = $('#bigPic .pic')[index];
        if (currentImage) {
            if (currentImage != indexImage) {
                $(currentImage).css('z-index', 2);
                clearTimeout(myTimer);
                $(currentImage).fadeOut(250, function () {
                    myTimer = setTimeout("showNext()", 5000);
                    $(this).css({ 'display': 'none', 'z-index': 1 });
                });
            }
        }
        $(indexImage).css({ 'display': 'block', 'opacity': 1 });
        currentImage = indexImage;
        currentIndex = index;
        $('#thumbs li').removeClass('active');
        $($('#thumbs li')[index]).addClass('active');
    }
}

function showNext() {
    var len = $('#bigPic .pic').length;
    var next = currentIndex < (len - 1) ? currentIndex + 1 : 0;
    showImage(next);
}

var myTimer;

$(document).ready(function () {
    myTimer = setTimeout("showNext()", 5000);
    showNext(); //loads first image
    $('#thumbs li').bind('mouseenter', function (e) {
        var count = $(this).attr('rel');
        showImage(parseInt(count) - 1);
    });
    $('.cate_horizontal_home p.sum').ellipsis({
        row: 4
        
    });
    $('.cate_vertical_home p.sum').ellipsis({
        row: 2
        
    });
    
    var mytime = setTimeout('display_ct()', 1000);
    

    var wrapper = $("#wrapper");
    var hidd = $("#popup img");
    var hidd_click = $("#click img");
    var lock = $("#lock");
    var dangkymuahang = $(".lock2");
    var btnMuaHang = $(".btnMuaHang");
    var click = $("#click");
    var click_1 = $("#click #span");
    var left = $("#bannerLeft a");
    var right = $("#bannerRight a");
    var btnDangKyNgay = $("#btnDangKyNgay img");
    var btnCancel = $("#btnCancel img");
    
    left.click(function () {
        wrapper.fadeTo(500, 0.5, function () {
            lock.show(500);
            return false;
        });
    });
    right.click(function () {
        wrapper.fadeTo(500, 0.5, function () {
            lock.show(500);
            return false;
        });
    });
    btnMuaHang.click(function () {
        wrapper.fadeTo(500, 0.5, function () {
            dangkymuahang.show(500);
            //click.hide(); 
        });
    });
    hidd.click(function () {
        wrapper.fadeTo(500, 1, function () {
            lock.hide(500);
            click.show();
        });
    });
    btnCancel.click(function () {
        wrapper.fadeTo(500, 1, function () {
            dangkymuahang.hide(500);
        });
    });
    hidd_click.click(function () {
        click.animate({
            opacity: 0.25,
            bottom: "-=200"
        }, 5000);
    });

    $("#buttonSubmit").click(function () {
        fullname = $("input[name='fullname']").val();
        address = $("input[name='address']").val();
        email = $("input[name='email']").val();
        phone = $("input[name='phone']").val();
        gift = $("select[name='gift']").val();
        $.ajax({
            url: "/Services/dangkyquatang.asmx/DangKy",
            type: "POST",
            contentType: 'application/json; charset=UTF-8',
            dataType: 'json',
            data: '{ "fullname":"' + fullname + '", "address":"' + address + '", "email":"' + email + '", "phone":"' + phone + '","gift":"' + gift + '" }',
            success: function (msg) {
                if (msg.d == "Đăng ký thành công. Xin cảm ơn") {
                    lock.hide(500);
                    click.show();
                }
            },
            error: function (msg) {
                alert("Request failed: " + msg);
            }
        });
        return false;
    });
    $("#btnDangKyNgay").click(function () {
        fullname = $("#txtHoTen").val();
        address = $("#txtAddress").val();
        email = $("#txtEmail").val();
        phone = $("#txtTel").val();
        gift = $("#hidProductID").val();
        if (gift && gift!="0") {
            $.ajax({
                url: "/Services/dangkymuahang.asmx/DangKy",
                type: "POST",
                contentType: 'application/json; charset=UTF-8',
                dataType: 'json',
                data: '{ "CusName":"' + fullname + '", "CusAddress":"' + address + '", "CusMobile":"' + phone + '", "CusEmail":"' + email + '","ProductId":"' + gift + '" }',
                success: function (msg) {
                    if (msg.d == "Đăng ký thành công. Xin cảm ơn") {
                        alert("Đăng ký thành công. Xin cảm ơn");
                        wrapper.fadeTo(500, 1, function () {
                            dangkymuahang.hide(500);
                        });
                    }
                },
                error: function (msg) {
                    alert("Request failed: " + msg);
                    wrapper.fadeTo(500, 1, function () {
                        dangkymuahang.hide(500);
                    });
                }
            });
        }
       
        return false;
       
    });
});

function LoadImage(id, src) {
    id.src = src;
    id.onerror = null;
}


function ActiveMenu(item) {
    $("#" + item).addClass("active");
}

(function ($) {
    // VERTICALLY ALIGN FUNCTION
    $.fn.vAlign = function () {
        return this.each(function (i) {
            var ah = $(this).height();
            var ph = $(this).parent().height();
            var mh = (ph - ah) / 2;
            $(this).css('margin-top', mh);
        });
    };
})(jQuery);


function adjustHeights() {
    var max = 0;
    var len;
    for (var i = 0; i < arguments.length; i++) {
        len = $('#' + arguments[i]).outerHeight();
        if (len > max) { max = len; }
    }
    var pad = 0;
    var bor = 0;
    for (var i = 0; i < arguments.length; i++) {
        pad = parseInt($('#' + arguments[i]).css("padding-top"), 10) + parseInt($('#' + arguments[i]).css("padding-bottom"), 10);
        $('#' + arguments[i]).height(max - pad);
    }
}

function ValidateSearch() {
    if (!require_txt("txtSearchBox", "Bạn chưa nhập từ khóa")) return false;
    key = removeHTMLTags("txtSearchBox");
    window.location = '/Pages/SearchResult.aspx?key=' + key;
    return false;
}
function TDTEnterPressSearch(e) {
    var characterCode;
    if (e && e.which)
    { e = e; characterCode = e.which; }
    else
    { e = window.event; characterCode = e.keyCode; }
    if (characterCode == 13)
    { ValidateSearch(); return false; }
    return true;
}
function removeHTMLTags(ctrID) {

    var strInputCode = document.getElementById(ctrID).value;

    strInputCode = strInputCode.replace(/&(lt|gt);/g, function (strMatch, p1) {
        return (p1 == "lt") ? "<" : ">";
    });
    var strTagStrippedText = strInputCode.replace(/<\/?[^>]+(>|$)/g, "");
    while (strTagStrippedText.indexOf('"') != -1)
        strTagStrippedText = strTagStrippedText.replace('"', '');
    //    while (strTagStrippedText.indexOf('\'') != -1)
    //        strTagStrippedText = strTagStrippedText.replace('\'', '');
    document.getElementById(ctrID).value = strTagStrippedText;
    return strTagStrippedText;



}

function require_txt(control, msg) {
    if (document.getElementById(control).value == "") {
        alert(msg);
        document.getElementById(control).focus();
        return false;
    }
    return true;
}


function display_ct() {
   // var strcount;
    var x = new Date();
   // var x1 = x.toUTCString();// changing the display to UTC string
    $(".clock").html(x.getDate()+'/' + (x.getMonth() + 1) + '/'+ x.getFullYear()+ ' | ' + x.toLocaleTimeString());
   // tt = display_c();
}

function display_c() {
    var refresh = 1000; // Refresh rate in milli seconds
    mytime = setTimeout('display_ct()', refresh);
}