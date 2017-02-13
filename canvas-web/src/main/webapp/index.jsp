<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>销售清单打印</title>
    <script src="js/jquery-3.1.1.min.js"></script>

    <script type="text/javascript">

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

        function print() {
            var LODOP = getLodop();

            LODOP.PRINT_INIT("销售清单");
            LODOP.SET_PRINT_PAGESIZE(1, "250mm", "150mm", "");
            LODOP.SET_PRINT_STYLE("FontName", "微软雅黑");

            // 标题
            LODOP.ADD_PRINT_TEXT("5mm", "102mm", "50mm", "20mm", "国药控股桂林有限公司");
            LODOP.SET_PRINT_STYLEA(0, "FontSize", 13);//增大字体11pt
            LODOP.SET_PRINT_STYLEA(0, "Bold", 1);//加粗

            // 1
            LODOP.ADD_PRINT_TEXT("12mm", "10mm", "50mm", "50mm", "短流水号: 0014");
            LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
            LODOP.ADD_PRINT_TEXT("12mm", "115mm", "50mm", "50mm", "销售清单");
            LODOP.SET_PRINT_STYLEA(0, "FontSize", 12);
            LODOP.SET_PRINT_STYLEA(0, "Bold", 1);
            LODOP.ADD_PRINT_TEXT("12mm", "200mm", "50mm", "50mm", "第一页/共1页");
            LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);

            // 2
            LODOP.ADD_PRINT_TEXT("17mm", "10mm", "50mm", "50mm", "订单组号: 110005170000139");
            LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
            LODOP.ADD_PRINT_TEXT("17mm", "65mm", "50mm", "50mm", "销售区域: 桂林医院销售部");
            LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
            LODOP.ADD_PRINT_TEXT("17mm", "200mm", "50mm", "50mm", "发票号码:");
            LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);

            // 3
            LODOP.ADD_PRINT_TEXT("22mm", "10mm", "50mm", "50mm", "QH单组号: ");
            LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
            LODOP.ADD_PRINT_TEXT("22mm", "65mm", "50mm", "50mm", "出库仓库: 桂林公司WMS仓库");
            LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
            LODOP.ADD_PRINT_TEXT("22mm", "115mm", "50mm", "50mm", "业务类型: 正常销售订单");
            LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
            LODOP.ADD_PRINT_TEXT("22mm", "165mm", "50mm", "50mm", "总 笔 数: 3");
            LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
            LODOP.ADD_PRINT_TEXT("22mm", "200mm", "50mm", "50mm", "总 金 额: 6981.00");
            LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);

            // 4
            LODOP.ADD_PRINT_TEXT("27mm", "10mm", "80mm", "50mm", "客     户: 0315800/全州县中医医院");
            LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
            LODOP.ADD_PRINT_TEXT("27mm", "115mm", "50mm", "50mm", "运输方式: 货运");
            LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
            LODOP.ADD_PRINT_TEXT("27mm", "165mm", "50mm", "50mm", "付款方式: 电汇");
            LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
            LODOP.ADD_PRINT_TEXT("27mm", "200mm", "70mm", "50mm", "出库日期: 2017-02-13 22:33:54");
            LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);

            // 5
            LODOP.ADD_PRINT_TEXT("32mm", "10mm", "80mm", "50mm", "送货地址: 全州县全州镇桂黄北路1号");
            LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
            LODOP.ADD_PRINT_TEXT("32mm", "115mm", "70mm", "50mm", "联 系 人: 陈英和 13877396116");
            LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);
            LODOP.ADD_PRINT_TEXT("32mm", "200mm", "50mm", "50mm", "制单日期: 2017/02/13");
            LODOP.SET_PRINT_STYLEA(0, "FontSize", 10);


            LODOP.PREVIEW();
        }

    </script>

</head>

<input type="button" value="打印" onclick="print();">

<body>

</body>
</html>
