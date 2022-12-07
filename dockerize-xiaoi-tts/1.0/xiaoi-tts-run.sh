#!/bin/sh
service nuance-licmgr start
sleep 1
mkdir -p /opt/xiaoi_nuance_tts-0.1.2/logs && cd /opt/xiaoi_nuance_tts-0.1.2/logs
nohup /opt/xiaoi_nuance_tts-0.1.2/xiaoi_nuance_tts_ws_server 0.0.0.0 9910 &
sleep 1
nohup /opt/xiaoi_nuance_tts-0.1.2/xiaoi_nuance_tts_ws_server 0.0.0.0 9911 &
sleep 1
nohup /opt/xiaoi_nuance_tts-0.1.2/xiaoi_nuance_tts_ws_server 0.0.0.0 9912 &
sleep 1
nohup /opt/xiaoi_nuance_tts-0.1.2/xiaoi_nuance_tts_ws_server 0.0.0.0 9913 &
sleep 1
nohup /opt/xiaoi_nuance_tts-0.1.2/xiaoi_nuance_tts_ws_server 0.0.0.0 9914 &
sleep 1
nohup /opt/xiaoi_nuance_tts-0.1.2/xiaoi_nuance_tts_ws_server 0.0.0.0 9915 &
sleep 1
nohup /opt/xiaoi_nuance_tts-0.1.2/xiaoi_nuance_tts_ws_server 0.0.0.0 9916 &
sleep 1
nohup /opt/xiaoi_nuance_tts-0.1.2/xiaoi_nuance_tts_ws_server 0.0.0.0 9917 &
sleep 1
nohup /opt/xiaoi_nuance_tts-0.1.2/xiaoi_nuance_tts_ws_server 0.0.0.0 9918 &
sleep 1
nohup /opt/xiaoi_nuance_tts-0.1.2/xiaoi_nuance_tts_ws_server 0.0.0.0 9919 &
sleep 1
haproxy -f /opt/haproxy/haproxy_xiaoi_tts.cfg