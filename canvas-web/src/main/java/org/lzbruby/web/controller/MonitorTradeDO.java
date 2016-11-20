package org.lzbruby.web.controller;

import java.io.Serializable;

/**
 * 功能描述：
 *
 * @author: Zhenbin.Li
 * email： lizhenbin08@sina.com
 * company：org.lzbruby
 * Date: 2016/11/20 Time：11:29
 */
public class MonitorTradeDO implements Serializable {

    private static long serialVersionUID = 5463670722987123350L;

    /**
     * 当日累计交易笔数
     */
    private String totalDailyOrderNum;

    /**
     * 5分钟累计交易笔数
     */
    private String fiveMinuteOrderNum;

    /**
     * 1分钟相应时长
     */
    private String oneMinuteResponseTime;

    /**
     * 5分钟预警次数
     */
    private String fiveMinuteWarnTimes;

    public String getTotalDailyOrderNum() {
        return totalDailyOrderNum;
    }

    public void setTotalDailyOrderNum(String totalDailyOrderNum) {
        this.totalDailyOrderNum = totalDailyOrderNum;
    }

    public String getFiveMinuteOrderNum() {
        return fiveMinuteOrderNum;
    }

    public void setFiveMinuteOrderNum(String fiveMinuteOrderNum) {
        this.fiveMinuteOrderNum = fiveMinuteOrderNum;
    }

    public String getOneMinuteResponseTime() {
        return oneMinuteResponseTime;
    }

    public void setOneMinuteResponseTime(String oneMinuteResponseTime) {
        this.oneMinuteResponseTime = oneMinuteResponseTime;
    }

    public String getFiveMinuteWarnTimes() {
        return fiveMinuteWarnTimes;
    }

    public void setFiveMinuteWarnTimes(String fiveMinuteWarnTimes) {
        this.fiveMinuteWarnTimes = fiveMinuteWarnTimes;
    }
}
