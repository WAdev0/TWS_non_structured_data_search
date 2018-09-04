#!/bin/sh
##################################################################
# Licensed Materials - Property of HCL
# (c) Copyright HCL Technologies Ltd. 2018. All Rights Reserved.
##################################################################

CURRENT_DATE=$(date +"%Y.%m.%d")
#JOB_ID
echo JOB_ID=$JOB_ID >> stdlist_script.log

#WORKSTATION NAME
WKS=`echo $JOB_ID | cut -d'#' -f1`
echo WKS=$WKS >> stdlist_script.log
# joblog
LOG= cat $UNISONHOME"/stdlist/JM/"$CURRENT_DATE"/"$JOB_ID/out.log

#curl -X PUT "localhost:9200/test_ric/_doc/1?pretty" -H 'Content-Type: application/json' -d'
#{
#"job_name":"$JOB_ID", "workstation":"$WKS", "log":"$LOG"
#}
#'

CT="Content-Type:application/json"
REST=/opt/IBM/TWA/TWS/ITA/cpa/ita/curl -X PUT "localhost:9200/test_ric/_doc/1?pretty" -H '$CT' -d '{"job_name":"$JOB_ID", "workstation":"$WKS", "log":"$LOG"}'
echo $REST >> stdlist_script.log
#ADD INFO TO INDEX
RESPONSE=`$REST`
echo $RESPONSE  >> stdlist_script.log
