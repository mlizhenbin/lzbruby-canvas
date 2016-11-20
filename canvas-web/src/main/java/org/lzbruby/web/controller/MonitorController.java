package org.lzbruby.web.controller;

import com.google.common.collect.Lists;
import org.codehaus.jackson.JsonParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Random;

/**
 * 功能描述：
 *
 * @author: Zhenbin.Li
 * email： lizhenbin08@sina.com
 * company：org.lzbruby
 * Date: 16/3/17 Time: 16:48
 */
@Controller
public class MonitorController {

    /**
     * sl4j
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(MonitorController.class);

    /**
     * 初始化交易量
     *
     * @param showLine
     * @param modelMap
     * @return
     * @throws JsonParseException
     */
    @RequestMapping(value = "/monitor/initMonitorTrade.json", method = RequestMethod.GET)
    @ResponseBody
    public Object initMonitorTrade(@RequestParam(required = true) Long showLine, ModelMap modelMap) throws JsonParseException {
        List<MonitorTradeDO> monitorDOs = Lists.newArrayList();
        Random random = new Random();

        for (int i = 0; i < showLine; i++) {
            MonitorTradeDO monitorDO = new MonitorTradeDO();
            monitorDO.setTotalDailyOrderNum(String.valueOf(Math.abs(random.nextInt(800000))));
            monitorDO.setFiveMinuteOrderNum(String.valueOf(Math.abs(random.nextInt(8000))));
            monitorDO.setOneMinuteResponseTime(String.valueOf(Math.abs(random.nextInt(3000))));
            monitorDO.setFiveMinuteWarnTimes(String.valueOf(Math.abs(random.nextInt(5))));
            monitorDOs.add(monitorDO);
        }

        return JacksonUtil.beanToJson(monitorDOs);
    }

    /**
     * 每次五秒请求
     *
     * @param modelMap
     * @return
     * @throws JsonParseException
     */
    @RequestMapping(value = "/monitor/monitorTrade.json", method = RequestMethod.GET)
    @ResponseBody
    public Object monitorTrade(ModelMap modelMap) throws JsonParseException {
        Random random = new Random();
        MonitorTradeAndResponseDO monitorDO = new MonitorTradeAndResponseDO();
        monitorDO.setTotalDailyOrderNum(String.valueOf(Math.abs(random.nextInt(800000))));
        monitorDO.setFiveMinuteOrderNum(String.valueOf(Math.abs(random.nextInt(8000))));
        monitorDO.setOneMinuteResponseTime(String.valueOf(Math.abs(random.nextInt(3000))));
//        monitorDO.setFiveMinuteWarnTimes(String.valueOf(Math.abs(random.nextInt(5))));
        monitorDO.setFiveMinuteWarnTimes("0");
        monitorDO.setResponseTime(Math.abs(random.nextInt(3000)));
        return JacksonUtil.beanToJson(monitorDO);
    }

    /**
     * 初始化响应时间
     *
     * @param showLine
     * @param modelMap
     * @return
     * @throws JsonParseException
     */
    @RequestMapping(value = "/monitor/initMonitorResponseTimes.json", method = RequestMethod.GET)
    @ResponseBody
    public Object initMonitorResponseTimes(@RequestParam(required = true) Long showLine, ModelMap modelMap) throws JsonParseException {
        List<Integer> responseTimes = Lists.newArrayList();
        Random random = new Random();

        for (int i = 0; i < showLine; i++) {
            responseTimes.add(Math.abs(random.nextInt(3000)));
        }

        return JacksonUtil.beanToJson(responseTimes);
    }
}
