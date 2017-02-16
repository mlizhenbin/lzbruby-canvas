$("#clearGoods").click(function () {
    $("._goods_info").remove();
})

$("#addGoods").click(function () {
    var showGoodsInfo = $("#_show_goods_info").find('tr');
    var goodsSize = showGoodsInfo.length;
    if (goodsSize && goodsSize > 10) {
        alert("最多支持5条商品信息，请重新输入！")
        return;
    }

    var goodsHTML =
        ' <tr class="_goods_info"> ' +
            '<td width="10%"><input class="_goods_code" type="text" style="width:140px;" value="☆   "></td>' +
            '<td rowspan="2" width="20%">' +
                '<textarea class="_ping_size_addr" style="width: 100%; height: 100%" cols="9" rows="3"></textarea>'+
            '</td>' +
            '<td rowspan="2" width="15%">' +
                '<textarea class="_productor" style="width: 100%; height: 100%" cols="9" rows="3"></textarea>' +
             '</td>' +
            '<td width="5%" rowspan="2"><textarea class="_package" style="width: 100%; height: 100%" cols="9" rows="3"></textarea></td>'+
            '<td width="5%" rowspan="2"><textarea class="_unit" style="width: 100%; height: 100%" cols="9" rows="3"></textarea></td>'+
            '<td width="5%" rowspan="2"><textarea class="_qrt" style="width: 100%; height: 100%" cols="9" rows="3"></textarea></td>'+
            '<td width="5%" rowspan="2"><textarea class="_price" style="width: 100%; height: 100%" cols="9" rows="3"></textarea></td>'+
            '<td width="5%" rowspan="2"><textarea class="_sale_fee" style="width: 100%; height: 100%" cols="9" rows="3"></textarea></td>'+
            '<td width="10%"><input class="_banch_no" type="text" style="width: 140px;" value=""></td>'+
            '<td width="10%" rowspan="2"><textarea class="_check_no" style="width: 100%; height: 100%" cols="9" rows="3"></textarea></td>'+
            '<td width="10%" rowspan="2"><textarea class="_warehouse_info" style="width: 100%; height: 100%" cols="9" rows="3"></textarea></td>'+
        '</tr>'+
        '<tr class="_goods_info">'+
            '<td><input class="_detail_no"  type="text" style="width:140px;" value=""></td>'+
            '<td>'+
                '<input class="_active_date" type="text" style="width:140px;" value="" onFocus="WdatePicker({dateFmt:\'yyyy/MM/dd\',alwaysUseStartDate:true})">'+
            '</td>'+
        '</tr>';
    $("#_show_goods_info").append(goodsHTML);
});

$("#doPrint").on("click", function () {
    var showGoodsInfo = $("#_show_goods_info").find('tr');
    var goodsSize = showGoodsInfo.length;
    if (goodsSize && goodsSize < 2) {
        alert("请填写打印商品信息！")
        return;
    }

    showGoodsInfo.each(function () {
        var _goods_code = $(this).find('._goods_code').val();
        if (typeof(_goods_code) != "undefined") {
            alert(_goods_code);
        }

        var _ping_size_addr = $(this).find('._ping_size_addr').val();
        if (typeof(_ping_size_addr) != "undefined") {
            alert(_ping_size_addr);
        }
        var _productor = $(this).find('._productor').val();
        if (typeof(_productor) != "undefined") {
            alert(_productor);
        }

        var _package = $(this).find('._package').val();
        if (typeof(_package) != "undefined") {
            alert(_package);
        }

        var _unit = $(this).find('._unit').val();
        if (typeof(_unit) != "undefined") {
            alert(_unit);
        }

        var _qrt = $(this).find('._qrt').val();
        if (typeof(_qrt) != "undefined") {
            alert(_qrt);
        }

        var _price = $(this).find('._price').val();
        if (typeof(_price) != "undefined") {
            alert(_price);
        }

        var _sale_fee = $(this).find('._sale_fee').val();
        if (typeof(_sale_fee) != "undefined") {
            alert(_sale_fee);
        }

        var _banch_no = $(this).find('._banch_no').val();
        if (typeof(_banch_no) != "undefined") {
            alert(_banch_no);
        }

        var _check_no = $(this).find('._check_no').val();
        if (typeof(_check_no) != "undefined") {
            alert(_check_no);
        }

        var _warehouse_info = $(this).find('._warehouse_info').val();
        if (typeof(_warehouse_info) != "undefined") {
            alert(_warehouse_info);
        }

        var _detail_no = $(this).find('._detail_no').val();
        if (typeof(_detail_no) != "undefined") {
            alert(_detail_no);
        }

        var _active_date = $(this).find('._active_date').val();
        if (typeof(_active_date) != "undefined") {
            alert(_active_date);
        }
    })
})

var isIE = (navigator.userAgent.indexOf('MSIE') >= 0) || (navigator.userAgent.indexOf('Trident') >= 0);

function getLodop() {
    try {
        var lodopDOM = document.createElement("object");
        if (isIE) {
            lodopDOM.setAttribute("classid", "clsid:2105C259-1E0C-4534-8141-A753534CB4CA");
        } else {
            lodopDOM.setAttribute("type", "application/x-print-lodop");
        }
        lodopDOM.setAttribute("style", "absolute;left:0;top:-200px;width:0;height:0;");
        document.documentElement.appendChild(lodopDOM);
        if (lodopDOM.VERSION < "6.1.7.3")
            window.console && console.log('控件版本应该>=6.1.7.3');

        return lodopDOM;
    } catch (e) {
        alert('没有正确安装Lodop打印控件!');
        return false;
    }
}

function buildLodop() {
    var LODOP = getLodop();

    LODOP.PRINT_INIT("销售清单");
    LODOP.SET_PRINT_PAGESIZE(1, "250mm", "150mm", "");
    LODOP.SET_PRINT_STYLE("FontName", "微软雅黑");

    // 标题
    LODOP.ADD_PRINT_TEXT("5mm", "102mm", "50mm", "20mm", "国药控股桂林有限公司");
    LODOP.SET_PRINT_STYLEA(0, "FontSize", 13);//增大字体11pt
    LODOP.SET_PRINT_STYLEA(0, "Bold", 1);//加粗

    // 1
    var _shot_seri_no = $("#_shot_seri_no").val();
    LODOP.ADD_PRINT_TEXT("12mm", "10mm", "50mm", "50mm", "短流水号: " + _shot_seri_no);
    LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
    LODOP.ADD_PRINT_TEXT("12mm", "115mm", "50mm", "50mm", "销售清单");
    LODOP.SET_PRINT_STYLEA(0, "FontSize", 12);
    LODOP.SET_PRINT_STYLEA(0, "Bold", 1);
    LODOP.ADD_PRINT_TEXT("12mm", "200mm", "50mm", "50mm", "第一页/共1页");
    LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);

    // 2
    var _order_group_no = $("#_order_group_no").val();
    LODOP.ADD_PRINT_TEXT("17mm", "10mm", "50mm", "50mm", "订单组号: " + _order_group_no);
    LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
    var _sale_area = $("#_sale_area").val();
    LODOP.ADD_PRINT_TEXT("17mm", "65mm", "50mm", "50mm", "销售区域: " + _sale_area);
    LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
    var _invoice_no = $("#_invoice_no").val();
    LODOP.ADD_PRINT_TEXT("17mm", "200mm", "50mm", "50mm", "发票号码:" + _invoice_no);
    LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);

    // 3
    var _qh_group_no = $("#_qh_group_no").val();
    LODOP.ADD_PRINT_TEXT("22mm", "10mm", "50mm", "50mm", "QH单组号: " + _qh_group_no);
    LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
    var _unhouse_warehouse = $("#_unhouse_warehouse").val();
    LODOP.ADD_PRINT_TEXT("22mm", "65mm", "50mm", "50mm", "出库仓库: " + _unhouse_warehouse);
    LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
    var _busi_type = $("#_busi_type").val();
    LODOP.ADD_PRINT_TEXT("22mm", "115mm", "50mm", "50mm", "业务类型: " + _busi_type);
    LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);

    var _total_orders = $("#_total_orders").val();
    LODOP.ADD_PRINT_TEXT("22mm", "165mm", "50mm", "50mm", "总 笔 数: " + _total_orders);
    LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
    var _total_fee = $("#_total_fee").val();
    LODOP.ADD_PRINT_TEXT("22mm", "200mm", "50mm", "50mm", "总 金 额: " + _total_fee);
    LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);

    // 4
    var _consume_name = $("#_consume_name").val();
    LODOP.ADD_PRINT_TEXT("27mm", "10mm", "80mm", "50mm", "客     户: " + _consume_name);
    LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
    var _transport_type = $("#_transport_type").val();
    LODOP.ADD_PRINT_TEXT("27mm", "115mm", "50mm", "50mm", "运输方式: " + _transport_type);
    LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
    var _pay_type = $("#_pay_type").val();
    LODOP.ADD_PRINT_TEXT("27mm", "165mm", "50mm", "50mm", "付款方式: " + _pay_type);
    LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
    var _unhouse_datetime = $("#_unhouse_datetime").val();
    LODOP.ADD_PRINT_TEXT("27mm", "200mm", "70mm", "50mm", "出库日期: " + _unhouse_datetime);
    LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);

    // 5
    var _send_address = $("#_send_address").val();
    LODOP.ADD_PRINT_TEXT("32mm", "10mm", "80mm", "50mm", "送货地址: " + _send_address);
    LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
    var _cotanct_persion = $("#_cotanct_persion").val();
    LODOP.ADD_PRINT_TEXT("32mm", "115mm", "70mm", "50mm", "联 系 人: " + _cotanct_persion);
    LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
    var _make_order_date = $("#_make_order_date").val();
    LODOP.ADD_PRINT_TEXT("32mm", "200mm", "50mm", "50mm", "制单日期: " + _make_order_date);
    LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);

    var _cal_total_ZN = $("#_cal_total_ZN").val();
    var _cal_total_en = $("#_cal_total_en").val();
    var _make_order_person = $("#_make_order_person").val();
    var _busi_order_person = $("#_busi_order_person").val();
    var _consumer_sgin = $("#_consumer_sgin").val();
    var _consumer_date = $("#_consumer_date").val();
    var _check_person = $("#_check_person").val();
    var _store_person = $("#_store_person").val();
    var _transport_condition = $("#_transport_condition").val();
    var _remark = $("#_remark").val();
    var _send_person = $("#_send_person").val();
    var _send_time = $("#_send_time").val();

    return LODOP;
}

function review() {
    var LODOP = buildLodop();
    LODOP.PREVIEW();
}