# Bad Case 闭环

真实 bad case 是这份 skill 的主要迭代燃料。

## 每轮测试后都要问

1. 这次有没有出现新的 bad case
2. 这个 bad case 属于哪种业务场景
3. 它应该沉淀成什么资产

## 沉淀类型

- 回归用例
- checklist
- 风险规则
- 环境前置说明
- 多 Agent 路由经验
- 项目特有断言

## 最小动作

如果一个 bad case 具有复现条件、业务影响和再犯概率，就不应只停留在聊天结论里，至少要写入：

- `07-knowledge-capture.md`

如果同类 bad case 第二次出现，应升级为正式回归资产。
