#!/bin/sh

set -eu

if [ "$#" -ne 2 ]; then
  echo "用法：sh scripts/init_test_round.sh <task-id> <round-id>"
  exit 1
fi

task_id="$1"
round_id="$2"
base_dir="testing-artifacts/$task_id/$round_id"

mkdir -p "$base_dir"

cat > "$base_dir/01-intent.md" <<EOF
# 01 Intent

任务标识：$task_id
轮次标识：$round_id

测试目标：

一句话成功标准：

测试类型：
- 功能验收 / Bug 回归 / 状态校验 / 集成确认 / 发布前验证 / 探索辅助 / 环境验证

不希望再次发生的故障：

备注：
EOF

cat > "$base_dir/02-impact.md" <<EOF
# 02 Impact

任务标识：$task_id
轮次标识：$round_id

受影响模块：

受影响接口：

受影响角色：

受影响状态迁移：

受影响 UI 面：

受影响数据依赖：

受影响环境：

影响面结论：
EOF

cat > "$base_dir/03-risk.md" <<EOF
# 03 Risk

任务标识：$task_id
轮次标识：$round_id

风险等级：
- P0 / P1 / P2

主要风险点：

为什么是这个等级：

若失败可能造成的后果：

是否涉及事实源 / 主状态源：

是否涉及跨系统耦合：

风险建模结论：
EOF

cat > "$base_dir/04-plan.md" <<EOF
# 04 Plan

任务标识：$task_id
轮次标识：$round_id

主链路：

必测边界路径：

建议验证层：
- 本地快速检查
- 模块 / 单元测试
- 集成 / API 测试
- 端到端 / 工作流测试
- 真实环境验收

人工验证项：

环境选择：

执行顺序：

停止条件：

路径规划结论：
EOF

cat > "$base_dir/05-execution.md" <<EOF
# 05 Execution

任务标识：$task_id
轮次标识：$round_id

已执行项：

执行结果：
- 通过
- 失败
- 跳过

失败详情：

原始证据位置：

是否偏离原计划：

执行阶段结论：
EOF

cat > "$base_dir/06-eval.md" <<EOF
# 06 Eval

任务标识：$task_id
轮次标识：$round_id

已覆盖风险：

未覆盖风险：

残余风险：

是否达到原成功标准：

是否需要补轮次：

评估结论：
EOF

cat > "$base_dir/07-knowledge-capture.md" <<EOF
# 07 Knowledge Capture

任务标识：$task_id
轮次标识：$round_id

新发现的规则：

新 bad case：

建议沉淀为：
- 回归用例
- checklist
- 风险规则
- 环境说明
- 项目级 skill 更新

后续建议：

知识沉淀结论：
EOF

cat > "$base_dir/planner-handoff.md" <<EOF
# Planner Handoff

任务标识：$task_id
轮次标识：$round_id
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

cat > "$base_dir/executor-report.md" <<EOF
# Executor Report

任务标识：$task_id
轮次标识：$round_id
已执行项：
未执行项：
失败项：
跳过项：
原始证据位置：
阻塞原因：
初步归因：
是否建议补轮次：
EOF

echo "已初始化测试轮次目录：$base_dir"
