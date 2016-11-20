package org.lzbruby.web.controller;

import java.io.Serializable;

/**
 * 功能描述：
 *
 * @author: Zhenbin.Li
 * email： lizhenbin08@sina.com
 * company：org.lzbruby
 * Date: 2016/11/20 Time：13:56
 */
public class MonitorTradeAndResponseDO extends MonitorTradeDO implements Serializable {
    private static long serialVersionUID = -2463636258369891500L;

    /**
     * 5秒中响应时间
     */
    private Integer responseTime;

    public Integer getResponseTime() {
        return responseTime;
    }

    public void setResponseTime(Integer responseTime) {
        this.responseTime = responseTime;
    }
}
