<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <script src="../pages/echarts.js"></script>
    <script src="../pages/jquery-3.1.1.min.js"></script>

</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 100%; height:600px;"></div>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    option = {
        tooltip: {
            trigger: 'axis',
            formatter: function (params, ticket, callback) {
                return params[0].data.tooltip.formatter;
            }
        },
        legend: {
            data: ['5分钟累计交易笔数', '1分钟平均响应时长']
        },
        dataZoom: {
            show: false,
            start: 0,
            end: 100
        },
        xAxis: [
            {
                type: 'category',
                boundaryGap: true,
                data: (function () {
                    var now = new Date();
                    var res = [];
                    var len = 36;
                    while (len--) {
                        res.unshift(now.toLocaleTimeString().replace(/^\D*/, ''));
                        now = new Date(now - 5000);
                    }
                    return res;
                })()
            },
            {
                type: 'category',
                boundaryGap: true,
                data: (function () {
                    var res = [];
                    return res;
                })()
            }
        ],
        yAxis: [
            {
                type: 'value',
                scale: true,
                name: '平均响应时长(毫秒)',
                max: 5000,
                min: 0,
                boundaryGap: [0.2, 0.2]
            },
            {
                type: 'value',
                scale: true,
                name: '累计交易量',
                max: 10000,
                min: 0,
                boundaryGap: [0.2, 0.2]
            }
        ],
        series: [
            {
                name: '5分钟累计交易笔数',
                type: 'bar',
                xAxisIndex: 1,
                yAxisIndex: 1,
                itemStyle: {
                    normal: {
                        color: '#7cb5d8'
                    }
                },
                data: (function () {
                    var res = [];
                    var len = 36;
                    $.ajax({
                        url: '/monitor/initMonitorTrade.json',
                        type: 'GET',
                        timeout: 5000,
                        dataType: 'JSON',
                        data: {
                            showLine: len
                        },
                        success: function (data) {
                            for (var i = 0; i < data.length; i++) {
                                var monitor = data[i];
                                var colorValue = '#7cb5d8';
                                var fiveMinuteWarnTimes = parseFloat(monitor.fiveMinuteWarnTimes);
                                if (fiveMinuteWarnTimes && monitor.fiveMinuteWarnTimes > 0) {
                                    colorValue = "red";
                                }
                                res.push(
                                        {
                                            value: parseFloat(monitor.fiveMinuteOrderNum),
                                            itemStyle: {
                                                normal: {
                                                    color: colorValue // #ec9c58
                                                }
                                            },
                                            tooltip: {
                                                formatter: "<ul>" +
                                                "<li>当日累计交易笔数:" + monitor.totalDailyOrderNum + "</li>" +
                                                "<li>5分钟累计交易笔数:" + monitor.fiveMinuteOrderNum + "</li>" +
                                                "<li>1分钟平均响应时长:" + monitor.oneMinuteResponseTime + "</li>" +
                                                "<li style='color: red'>5分钟预警次数:" + monitor.fiveMinuteWarnTimes + "</li>" +
                                                "</ul>"
                                            }
                                        }
                                );
                            }
                        }
                    })
                    return res;
                })()
            },
            {
                name: '1分钟平均响应时长',
                type: 'line',
                itemStyle: {
                    normal: {
                        color: '#ec9c58'
                    }
                },
                data: (function () {
                    var res = [];
                    var len = 36;
                    $.ajax({
                        url: '/monitor/initMonitorResponseTimes.json',
                        type: 'GET',
                        timeout: 5000,
                        dataType: 'JSON',
                        data: {
                            showLine: len
                        },
                        success: function (data) {
                            for (var i = 0; i < data.length; i++) {
                                res.push(data[i]);
                            }
                        }
                    })
                    return res;
                })()
            }
        ]
    };

    var app = new Object();

    clearInterval(app.timeTicket);
    app.count = 36;

    app.timeTicket = setInterval(function () {
        axisData = (new Date()).toLocaleTimeString().replace(/^\D*/, '');

        var data0 = option.series[0].data;
        var data1 = option.series[1].data;

        data0.shift();
        data1.shift();

        $.ajax({
            url: '/monitor/monitorTrade.json',
            type: 'GET',
            timeout: 5000,
            dataType: 'JSON',
            success: function (data) {
                var monitor = data;
                var colorValue = '#7cb5d8';
                var fiveMinuteWarnTimes = parseFloat(monitor.fiveMinuteWarnTimes);
                if (fiveMinuteWarnTimes && monitor.fiveMinuteWarnTimes > 0) {
                    colorValue = "red";
                }
                data0.push(
                        {
                            value: parseFloat(monitor.fiveMinuteOrderNum),
                            itemStyle: {
                                normal: {
                                    color: colorValue
                                }
                            },
                            tooltip: {
                                formatter: "<ul>" +
                                "<li>当日累计交易笔数:" + monitor.totalDailyOrderNum + "</li>" +
                                "<li>5分钟累计交易笔数:" + monitor.fiveMinuteOrderNum + "</li>" +
                                "<li>1分钟平均响应时长:" + monitor.oneMinuteResponseTime + "</li>" +
                                "<li style='color: red'>5分钟预警次数:" + monitor.fiveMinuteWarnTimes + "</li>" +
                                "</ul>"
                            }
                        }
                );
                data1.push(monitor.responseTime);
            }
        })

        option.xAxis[0].data.shift();
        option.xAxis[0].data.push(axisData);

        myChart.setOption(option);
    }, 1000);


</script>

</body>
</html>
