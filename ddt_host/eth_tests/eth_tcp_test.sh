#! /bin/sh
for LABEL in TCP_8K_1448B TCP_16K_1448B TCP_32K_1448B TCP_64K_1448B TCP_128K_1448B TCP_8K_76B TCP_16K_76B TCP_32K_76B TCP_64K_76B TCP_128K_76B TCP_8K_200B TCP_16K_200B TCP_32K_200B TCP_64K_200B TCP_128K_200B
do
 iperf -s &
 ssh root@158.218.103.112 "cd /opt/ltp; ./runltp -f ddt/eth_iperf_tcp -P am3517-evm -s \"-E .+${LABEL}\""
done
