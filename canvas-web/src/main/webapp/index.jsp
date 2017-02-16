<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>销售清单打印</title>
    <link href="js/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="js/bootstrap/css/bootstrap-theme.css" rel="stylesheet">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/My97DatePicker/WdatePicker.js"></script>

</head>

<body>
<div class="container-fluid">
    <div class="span12">
        <%--<h3 class="text-center">国药控股桂林有限公司</h3>--%>
        <%--<h4 class="text-center">销售清单</h4>--%>
        <form>
            <fieldset>
                <legend>抬头信息：</legend>
                <table width="100%" style="height: auto">
                    <tbody>
                    <tr>
                        <td style="text-align: right">短流水号:</td>
                        <td><input id="_shot_seri_no" type="text" value=""></td>
                        <td style="text-align: right">总 笔 数:</td>
                        <td><input id="_total_orders" type="text" value=""></td>
                        <td style="text-align: right">总 金 额:</td>
                        <td><input id="_total_fee" type="text" value=""></td>
                        <td style="text-align: right">出库日期:</td>
                        <td><input id="_unhouse_datetime" type="text" value=""
                                   onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"></td>
                    </tr>
                    <tr>
                        <td style="text-align: right">订单组号:</td>
                        <td><input id="_order_group_no" type="text" value=""></td>
                        <td style="text-align: right">销售区域:</td>
                        <td><input id="_sale_area" type="text" value=""></td>
                        <td style="text-align: right">发票号码:</td>
                        <td><input id="_invoice_no" type="text" value=""></td>
                        <td style="text-align: right">联 系 人:</td>
                        <td><input id="_cotanct_persion" type="text" value=""></td>
                    </tr>
                    <tr>
                        <td style="text-align: right">QH单组号:</td>
                        <td><input id="_qh_group_no" type="text" value=""></td>
                        <td style="text-align: right">出库仓库:</td>
                        <td><input id="_unhouse_warehouse" type="text" value=""></td>
                        <td style="text-align: right">业务类型:</td>
                        <td><input id="_busi_type" type="text" value=""></td>
                        <td style="text-align: right">制单日期:</td>
                        <td><input id="_make_order_date" type="text" value=""
                                   onFocus="WdatePicker({dateFmt:'yyyy/MM/dd',alwaysUseStartDate:true})"></td>
                    </tr>
                    <tr>
                        <td style="text-align: right">客 户:</td>
                        <td><input id="_consume_name" type="text" value=""></td>
                        <td style="text-align: right">运输方式:</td>
                        <td><input id="_transport_type" type="text" value=""></td>
                        <td style="text-align: right">付款方式:</td>
                        <td><input id="_pay_type" type="text" value=""></td>
                        <td style="text-align: right">送货地址:</td>
                        <td><input id="_send_address" type="text" value=""></td>
                    </tr>
                    </tbody>
                </table>
            </fieldset>
            <br><br>
            <fieldset>
                <legend>商品信息：
                    <button id="addGoods" class="btn btn-primary" type="button">新增</button>
                    <button id="clearGoods" class="btn btn-warning" type="button">清除</button>
                </legend>
                <table class="table table-bordered table-condensed" contenteditable="true">
                    <thead>
                    <tr style="background-color: #c1e2b3">
                        <th>商品编码/细单号</th>
                        <th>品名/规格/剂型/产地</th>
                        <th>生产厂商</th>
                        <th>包装</th>
                        <th>单位</th>
                        <th>数量</th>
                        <th>销售单价</th>
                        <th>金额</th>
                        <th>批号/效期</th>
                        <th>批准文号</th>
                        <th>仓库信息</th>
                    </tr>
                    </thead>
                    <tbody id="_show_goods_info">
                    <tr class="_goods_info">
                        <td width="10%"><input type="text" style="width:140px;" value="☆   "></td>
                        <td rowspan="2" width="20%">
                            <textarea style="width: 100%; height: 100%" cols="9" rows="3"></textarea>
                        </td>
                        <td rowspan="2" width="15%">
                            <textarea style="width: 100%; height: 100%" cols="9" rows="3"></textarea>
                        </td>
                        <td width="5%" rowspan="2"><textarea style="width: 100%; height: 100%" cols="9" rows="3"></textarea></td>
                        <td width="5%" rowspan="2"><textarea style="width: 100%; height: 100%" cols="9" rows="3"></textarea></td>
                        <td width="5%" rowspan="2"><textarea style="width: 100%; height: 100%" cols="9" rows="3"></textarea></td>
                        <td width="5%" rowspan="2"><textarea style="width: 100%; height: 100%" cols="9" rows="3"></textarea></td>
                        <td width="5%" rowspan="2"><textarea style="width: 100%; height: 100%" cols="9" rows="3"></textarea></td>
                        <td width="10%"><input type="text" style="width: 140px;" value=""></td>
                        <td width="10%" rowspan="2"><textarea style="width: 100%; height: 100%" cols="9" rows="3"></textarea></td>
                        <td width="10%" rowspan="2"><textarea style="width: 100%; height: 100%" cols="9" rows="3"></textarea></td>
                    </tr>
                    <tr class="_goods_info">
                        <td><input type="text" style="width:140px;" value=""></td>
                        <td>
                            <input type="text" style="width:140px;" value="" onFocus="WdatePicker({dateFmt:'yyyy/MM/dd',alwaysUseStartDate:true})">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </fieldset>

            <fieldset>
                <legend>合计信息：</legend>
                <table width="100%" style="height: auto">
                    <tbody>
                    <tr>
                        <td style="text-align: right">本页合计人民币（大写）:</td>
                        <td><input type="text" value=""></td>
                        <td style="text-align: right">小写:</td>
                        <td><input type="text" value=""></td>
                        <td style="text-align: right">制单人:</td>
                        <td><input type="text" value=""></td>
                        <td style="text-align: right">业务员:</td>
                        <td><input type="text" value=""></td>
                    </tr>
                    <tr>
                        <td style="text-align: right">客户签收:</td>
                        <td><input type="text" value=""></td>
                        <td style="text-align: right">签收日期:</td>
                        <td><input type="text" value=""></td>
                        <td style="text-align: right">复合员:</td>
                        <td><input type="text" value=""></td>
                        <td style="text-align: right">保管员:</td>
                        <td><input type="text" value=""></td>
                    </tr>
                    <tr>
                        <td style="text-align: right">运输条件:</td>
                        <td><input type="text" value=""></td>
                        <td style="text-align: right">备注:</td>
                        <td><input type="text" value=""></td>
                        <td style="text-align: right">送货人:</td>
                        <td><input type="text" value=""></td>
                        <td style="text-align: right">送货时间:</td>
                        <td><input type="text" value=""></td>
                    </tr>
                    </tbody>
                </table>
            </fieldset>
            <br>
            <br>
            <div style="text-align: center">
                <button class="btn btn-primary" type="button">打印</button>
                <button class="btn btn-success" type="button" onclick="review();">打印预览</button>
                <button class="btn  btn-info" type="reset">重置</button>
            </div>
        </form>
    </div>
</div>
</div>
</body>
<script src="js/print.js"></script>
</html>
