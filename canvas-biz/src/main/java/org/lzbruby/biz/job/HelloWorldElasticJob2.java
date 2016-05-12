package org.lzbruby.biz.job;

import com.dangdang.ddframe.job.internal.job.AbstractJobExecutionShardingContext;
import com.dangdang.ddframe.job.plugin.job.type.dataflow.AbstractIndividualThroughputDataFlowElasticJob;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * 功能描述：
 *
 * @author: Zhenbin.Li
 * email： lizhenbin08@sina.com
 * company：org.lzbruby
 * Date: 16/5/10 Time: 19:47
 */
public class HelloWorldElasticJob2 extends AbstractIndividualThroughputDataFlowElasticJob {

    /**
     * sl4j
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(HelloWorldElasticJob2.class);

    public List fetchData(AbstractJobExecutionShardingContext shardingContext) {
        return null;
    }

    public boolean isStreamingProcess() {
        return false;
    }

    public boolean processData(AbstractJobExecutionShardingContext shardingContext, Object data) {
        LOGGER.info("------->AbstractIndividualThroughputDataFlowElasticJob");
        return false;
    }
}
