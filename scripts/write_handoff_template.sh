#!/bin/sh

set -eu

if [ "$#" -ne 2 ]; then
  echo "用法：sh scripts/write_handoff_template.sh <task-id> <round-id>"
  exit 1
fi

task_id="$1"
round_id="$2"
base_dir="testing-artifacts/$task_id/$round_id"

mkdir -p "$base_dir"

cat > "$base_dir/planner-handoff.md" <<'EOF'
# Planner Handoff

任务标识：
轮次标识：
测试目标：
影响面摘要：
风险等级：
主链路：
必测边界路径：
推荐验证层：
成功标准：
停止条件：
禁止偏离项：
需要回传的证据类型：
EOF

cat > "$base_dir/executor-report.md" <<'EOF'
# Executor Report

任务标识：
轮次标识：
已执行项：
未执行项：
失败项：
跳过项：
原始证据位置：
阻塞原因：
初步归因：
是否建议补轮次：
EOF

echo "已写入交接模板：$base_dir"
