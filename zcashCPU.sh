#!/bin/sh

cpusnums=$(nproc)
echo $cpusnums Threads

numl3=$(lscpu | awk '/^L3/ {print $NF}' | rev | cut -c 2- | rev )
echo $numl3 L3 Cache KB per CPU

numsockets=$(cat /proc/cpuinfo | grep "physical id" | sort -u | wc -l)
echo $numsockets Sockets

numthreads=$(($cpusnum - 1))
echo $numthreads Zcash Threads

./nheqminer_cpu_xenoncat -l eu1-zcash.flypool.org:3333 -u $username -t $numthreads
