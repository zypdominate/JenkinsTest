#!/bin/bash
# tests/scripts/run_jmeter.sh.sh

SCENARIO=$1
# 创建存放结果的目录
mkdir -p results/jtl results/report

# 取 GitHub 默认注入的环境变量 (通过 YML 中的 github.run_number)
BUILD_NUM=${BUILD_ID:-1}

# 动态组合产生的 JTL 文件路径
JTL_FILE="results/jtl/${SCENARIO}_${BUILD_NUM}.jtl"
REPORT_DIR="results/report"

echo "开始执行 $SCENARIO 性能测试..."
# 根据传入的场景动态加载对应的 jmx
jmeter -n -t "tests/${SCENARIO}.jmx" \
       -D threads=${THREADS} \
       -D duration=${DURATION} \
       -l ${JTL_FILE} \
       -e -o ${REPORT_DIR}

echo "测试结束，JTL存储在上方路径。"
