package org.lzbruby.biz.job;

import com.dangdang.ddframe.job.api.JobExecutionMultipleShardingContext;
import com.dangdang.ddframe.job.plugin.job.type.simple.AbstractSimpleElasticJob;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 功能描述：
 *
 * @author: Zhenbin.Li
 * email： lizhenbin08@sina.com
 * company：org.lzbruby
 * Date: 16/5/10 Time: 16:55
 */
public class HelloWorldElasticJob extends AbstractSimpleElasticJob {

    /** sl4j */
    private static final Logger LOGGER = LoggerFactory.getLogger(HelloWorldElasticJob.class);

    public void process(JobExecutionMultipleShardingContext shardingContext) {
        LOGGER.info("------------>HelloWorldElasticJob");
    }
}

