//if (document.all) window.attachEvent('onload', newsEdit_onload);
//else window.addEventListener('load', newsEdit_onload, false);

// khi them doctype, editor bi co lai trong fire fox, ham nay de fix loi do! [bacth]
function newsEdit_onload() {
    if (!ie) {
        var frame = document.getElementById("editors").getElementsByTagName("iframe").item(0);
        if (frame != null) {
            frame.parentNode.style.height = '505px';
            frame.style.height = '500px';

        }
    }
    NumberWordInSapo();
}
function showBlockEditor(id) {
    var url = '/GUI/EditoralOffice/MainOffce/editnews/default.aspx?newsId=' + id;
    openpreview(url, 800, 600);
    return false;
}


var catName = "";

Array.prototype.indexOf = function (v) {
    for (var i = this.length; i-- && this[i] !== v; );
    return i;
}


function chooseFile(type, txtID) {
    txtID = document.getElementById(txtID).value;
    openpreview('/GUI/EditoralOffice/MainOffce/FileManager/default.aspx?function=' + type + '_loadValue&mode=single&share=share&i=' + encodeURIComponent(txtID), 900, 700);
}
function avatar_loadValue(arrImage) {
    if (arrImage.length > 0) {
        arrImage[0] = arrImage[0].substr(arrImage[0].indexOf('Images2018/Uploaded/'));
        server_getElementById('txtSelectedFile').value = arrImage[0];
    }
}
function icon_loadValue(arrImage) {
    if (arrImage.length > 0) {
        arrImage[0] = arrImage[0].substr(arrImage[0].indexOf('Images2018/Uploaded/'));
        server_getElementById('txtIcon').value = arrImage[0];
    }
}
function chooseThread() {
    var lstCat = server_getElementById('lstCat');
    var catID = 0;
    if (lstCat.selectedIndex != -1)
        catID = lstCat.options[lstCat.selectedIndex].value;

    openpreview('/GUI/EditoralOffice/MainOffce/editnews/thread.aspx?function=thread_loadValue&CatID=' + catID, 900, 700);
}
function chooseThreadV2() {


    openpreview('/GUI/EditoralOffice/MainOffce/editnews/thread.aspx?function=thread_loadValueV2&CatID=', 900, 700);
}

function thread_loadValueV2(arrThread) {
    var lstLuongSuKien = server_getElementById('lstThread');
    var i = 0, count = 0;

    var tem = new Array(); count = lstLuongSuKien.options.length;
    for (i = 0; i < count; i++) {
        tem.push(lstLuongSuKien.options[i].value);    
    }
    
    count = arrThread.length;
    for (i = 0; i < count; i++)
        if (tem.indexOf(arrThread[i][0]) == -1) {
            var encode = unescape(arrThread[i][1]);
            lstLuongSuKien.options[lstLuongSuKien.options.length] = new Option(encode, arrThread[i][0]);   
        }
}

function thread_loadValue(arrThread) {
    var lstLuongSuKien = server_getElementById('lstLuongSuKien');
    var i = 0, count = 0;

    var tem = new Array(); count = lstLuongSuKien.options.length;
    for (i = 0; i < count; i++)
        tem.push(lstLuongSuKien.options[i].value);

    count = arrThread.length;
    for (i = 0; i < count; i++)
        if (tem.indexOf(arrThread[i][0]) == -1)
            lstLuongSuKien.options[lstLuongSuKien.options.length] = new Option(arrThread[i][1], arrThread[i][0]);
}

function chooseNews() {
    var lstCat = server_getElementById('lstCat');
    var catID = 0;
    if (lstCat.selectedIndex != -1)
        catID = lstCat.options[lstCat.selectedIndex].value;

    openpreview('/GUI/EditoralOffice/MainOffce/editnews/newsassign.aspx?function=news_loadValue&CatID=' + catID + '&cpmode=' + cpmode + '&type=news', 900, 700);
}
function news_loadValue(arr) {
    var cboNews = server_getElementById('cboNews');
    var i = 0, count = 0;

    var tem = new Array(); count = cboNews.options.length;
    for (i = 0; i < count; i++)
        tem.push(cboNews.options[i].value);

    count = arr.length;
    for (i = 0; i < count; i++) {
        if (tem.indexOf(arr[i][0]) == -1) {
            cboNews.options[cboNews.options.length] = new Option(arr[i][1], arr[i][0]);
        }

    }
}
function chooseMedia(NewsRef,productID) {
//    var lstCat = server_getElementById('lstCat');
//    var catID = 0;
//    if (lstCat.selectedIndex != -1)
//        catID = lstCat.options[lstCat.selectedIndex].value;
    var param = NewsRef != 0 ? ("&newsid=" + NewsRef) : (productID != 0) ? "&pid=" + productID : "";
    openpreview('/GUI/EditoralOffice/MainOffce/editnews/MediaObjectList.aspx?function=media_loadValue' + param, 900, 700);
}
function media_loadValue(arr) {
    var cboMedia = server_getElementById('cboMedia');
    var i = 0, count = 0;

    var tem = new Array(); count = cboMedia.options.length;
    for (i = 0; i < count; i++)
        tem.push(cboMedia.options[i].value);

    count = arr.length;
    for (i = 0; i < count; i++)
        if (tem.indexOf(arr[i][0]) == -1)
            cboMedia.options[cboMedia.options.length] = new Option(arr[i][1], arr[i][0]);
}
function list_movedown(cbo) {
    var si = cbo.selectedIndex;
    if (si >= 0 && si <= cbo.length - 2) {
        var text = cbo.options[si].text;
        var value = cbo.options[si].value;
        cbo.options[si] = new Option(cbo.options[si + 1].text, cbo.options[si + 1].value);
        cbo.options[si + 1] = new Option(text, value);
        cbo.selectedIndex = si + 1;
    }
}
function list_moveup(cbo) {
    var si = cbo.selectedIndex;
    if (si >= 1) {
        var text = cbo.options[si].text;
        var value = cbo.options[si].value;
        cbo.options[si] = new Option(cbo.options[si - 1].text, cbo.options[si - 1].value);
        cbo.options[si - 1] = new Option(text, value);
        cbo.selectedIndex = si - 1;
    }
}
function list_remove(cbo) {
    var si = cbo.selectedIndex;
    if (si >= 0) {
        cbo.remove(si);
        if (cbo.options.length == si)
            cbo.selectedIndex = si - 1;
        else
            cbo.selectedIndex = si;
    }
}
//Validate trước khi Save
function Validate() {
    var list = server_getElementById('lstCat');
    var title = server_getElementById('txtTitle');

    if (list.selectedIndex == -1) { AlertandFocus(list, "Bạn chưa chọn chuyên mục"); return false; }
    if (title.value.length == 0) { AlertandFocus(title, "Bạn chưa nhập tiêu đề tin"); return false; }

    // assign list box to hidden field
    var lstLuongSuKien = server_getElementById('lstThread');
    var hidLuongSuKien = server_getElementById('hidLuongSuKien');
    hidLuongSuKien.value = ListBoxToString(lstLuongSuKien);

    // assign list box to hidden field
    var cboNews = server_getElementById('cboNews');
    var hdRelatNews = server_getElementById('hdRelatNews');
    hdRelatNews.value = ListBoxToString(cboNews);
    
   
    // assign list box to hidden field
    var cboMedia = server_getElementById('cboMedia');
    var hdMedia = server_getElementById('hdMedia');
    hdMedia.value = ListBoxToString(cboMedia);

    // assign list box to hidden field
    /*var cboTag = server_getElementById('cboTag');
    var hdTag = server_getElementById('hdTag');
    hdTag.value = ListBoxToString(cboTag);*/


    return Change();
}

function AlertandFocus(ctr, msg) {
    alert(msg);
    ctr.focus();
}

function ListBoxToString(list) {
    var arr = new Array();
    var i = 0, count = list.options.length;
    for (i = 0; i < count; i++) {
        arr.push(list.options[i].value);
    }
    if (arr.length > 0)
        return arr.join(',');
    else
        return '';
}
function Change() {
    //var sapo_name = server_getElementById('txtInit').name;
    //var id = document.getElementsByName(sapo_name)[0];
    //id.value = id.value.trim();

    //while (id.value.indexOf("  ") != -1) {
    //    id.value = id.value.replace('  ', ' ');
    //}

    //var sapo_text = id.value;
    //sapo_text = RemoveHTMLTag(sapo_text);

    //var arr = sapo_text.split(' ');

    //if (arr.length > numberWord) {
    //    if (catName != "")
    //        alert("Số từ hiện tại: " + arr.length + "\n Phần tóm tắt của chuyên mục '" + catName + "' bạn đã nhập quá " + numberWord + " từ. \n Xin vui lòng nhập lại !");
    //    else
    //        alert("Số từ hiện tại: " + arr.length + ".\n Phần tóm tắt của bạn đã nhập quá " + numberWord + " từ. \n Xin vui lòng nhập lại !");
    //    id.focus();

    //    return false;
    //}

    return true;
}

function RemoveHTMLTag(s) {
    var re = new RegExp('<[^>]*>', 'gim');
    var matches = s.match(re);
    if (matches && matches.length) {
        for (var x = 0; x < matches.length; x++) {
            s = s.replace(matches[x], '');
        }
    }
    return s;
}

function insertHyperLink(title, link) {
    //try
    //{
    if (link.indexOf("http://") >= 0) {
        if (link != "http://") {
            BASIC_InsertTag('<a href="' + link + '" target="_blank">', '</a>', title);
        }
        else {
        }
    }
    else {
        alert("Bạn cần chèn đường link có http://");
    }
    //}
    //catch(e)
    //{
    //	alert(e.message);
    //}
}

var defaultWord = 500;
function NumberWordInSapo() {
    var cbxCat = server_getElementById('lstCat');
    try {
        var words = CatNumberWord[cbxCat.options[cbxCat.selectedIndex].value];
        catName = cbxCat.options[cbxCat.selectedIndex].text;
        var td_text_sapo = document.getElementById("numberOfWord");

        if (words > 0) {
            numberWord = words;
            td_text_sapo.innerHTML = "Phần tóm tắt của chuyên mục '" + catName + "' không được quá " + numberWord + " từ";
        }
        else {
            numberWord = defaultWord;
            td_text_sapo.innerHTML = "Phần tóm tắt không được quá " + numberWord + " từ";
        }
    } catch (err) {
        var td_text_sapo = document.getElementById("numberOfWord");
        numberWord = defaultWord;
        td_text_sapo.innerHTML = "Phần tóm tắt không được quá " + numberWord + " từ";
    }
}

function Preview(obj) {
    if (obj.selectedIndex != -1) {
        var path = obj.options[obj.selectedIndex].text;
        if (IsMedia(path))
            path = folder + 'Images2018/Uploaded/Share/Media/picture/' + path;
        else
            path = folder + 'Images2018/Uploaded/Share/Media/video/' + path;

        showModalPopup('ctlPopupView', false);
        document.getElementById("tdPreview").innerHTML = genPreviewhtml(path);
    }
}
function IsMedia(src) {
    src = src.toLowerCase();
    if (isExtend(src, ".jpg") || isExtend(src, ".bmp") || isExtend(src, ".gif") || isExtend(src, ".png")) return true;
    return false;
}
function isExtend(src, ext) {
    return src.indexOf(ext) != -1;
}


function insertMultipleImage_loadValue(arrImagesURL) {
    var html = '';
    for (var i = 0; i < arrImagesURL.length; i++) {
        html += '<A title="Click vào ảnh để xem hình đúng cỡ" href="' + arrImagesURL[i] + '" rel="prettyPhoto[gallery]"><img src="' + arrImagesURL[i] + '" /></a><br /><br />';
    }
    if (document.all) {
        editor.insertHTML(html);
    }
    else {
        editor.insertHTML(html);
    }
}


function BASIC_InsertTag(tagOpen, tagClose, sampleText) {
    var clientPC = navigator.userAgent.toLowerCase(); // Get client info
    var is_gecko = ((clientPC.indexOf('gecko') != -1) && (clientPC.indexOf('spoofer') == -1)
                && (clientPC.indexOf('khtml') == -1) && (clientPC.indexOf('netscape/7.0') == -1));
    var areas = document.getElementsByTagName('textarea');
    var txtarea = areas[0];
    if (document.selection && !is_gecko) {
        var theSelection = document.selection.createRange().text;
        if (!theSelection) {
            theSelection = sampleText;
        }
        txtarea.focus();
        if (theSelection.charAt(theSelection.length - 1) == " ") { // exclude ending space char, if any
            theSelection = theSelection.substring(0, theSelection.length - 1);
            document.selection.createRange().text = tagOpen + theSelection + tagClose + " ";
        } else {
            document.selection.createRange().text = tagOpen + theSelection + tagClose;
        }
        // Mozilla
    } else if (txtarea.selectionStart || txtarea.selectionStart == '0') {
        var replaced = false;
        var startPos = txtarea.selectionStart;
        var endPos = txtarea.selectionEnd;
        if (endPos - startPos) {
            replaced = true;
        }
        var scrollTop = txtarea.scrollTop;
        var myText = (txtarea.value).substring(startPos, endPos);
        if (!myText) {
            myText = sampleText;
        }
        var subst;
        if (myText.charAt(myText.length - 1) == " ") { // exclude ending space char, if any
            subst = tagOpen + myText.substring(0, (myText.length - 1)) + tagClose + " ";
        } else {
            subst = tagOpen + myText + tagClose;
        }
        txtarea.value = txtarea.value.substring(0, startPos) + subst +
   txtarea.value.substring(endPos, txtarea.value.length);
        txtarea.focus();
        if (replaced) {
            var cPos = startPos + (tagOpen.length + myText.length + tagClose.length);
            txtarea.selectionStart = cPos;
            txtarea.selectionEnd = cPos;
        } else {
            txtarea.selectionStart = startPos + tagOpen.length;
            txtarea.selectionEnd = startPos + tagOpen.length + myText.length;
        }
        txtarea.scrollTop = scrollTop;
    }
    if (txtarea.createTextRange) {
        txtarea.caretPos = document.selection.createRange().duplicate();
    }
}