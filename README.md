# All-in Skills Repository

这是一个OpenClaw技能集合仓库，包含各种实用的AI助手技能。

## 📦 可用技能

### 1. OKX+Kronos BTC价格预测技能
**位置:** `skills/okx-kronos-btc-prediction/`

基于真实OKX API数据和Kronos-small模型的BTC价格预测系统。

**功能:**
- 实时数据获取（OKX API）
- 标准化价格预测
- 风险评估
- 交易建议生成

**快速开始:**
```bash
cd skills/okx-kronos-btc-prediction
chmod +x install.sh
./install.sh
```

## 🚀 使用说明

### 安装单个技能
```bash
# 进入技能目录
cd skills/<skill-name>

# 运行安装脚本
./install.sh

# 配置技能
cp configs/config_template.json configs/config.json
# 编辑配置文件

# 使用技能
python scripts/main.py
```

### 技能开发指南
1. **目录结构:**
   ```
   skill-name/
   ├── README.md          # 技能说明
   ├── SKILL.md          # 详细文档
   ├── install.sh        # 安装脚本
   ├── requirements.txt  # 依赖列表
   ├── configs/          # 配置文件
   ├── scripts/         # 核心脚本
   ├── models/          # 模型文件（可选）
   └── docs/           # 文档（可选）
   ```

2. **配置文件:** 使用模板文件，避免提交敏感信息
3. **依赖管理:** 明确列出所有Python依赖
4. **文档:** 提供清晰的安装和使用说明

## 🔧 技能要求

所有技能应该:
- ✅ 提供完整的安装说明
- ✅ 包含配置文件模板
- ✅ 列出所有依赖
- ✅ 有清晰的文档
- ✅ 不包含敏感信息
- ✅ 经过测试验证

## 📁 仓库结构
```
allin-skills/
├── README.md                    # 本文件
├── skills/                      # 技能目录
│   ├── okx-kronos-btc-prediction/  # BTC预测技能
│   │   ├── README.md
│   │   ├── SKILL.md
│   │   ├── install.sh
│   │   ├── requirements.txt
│   │   ├── configs/
│   │   ├── scripts/
│   │   └── docs/
│   └── [更多技能...]
└── .gitignore
```

## 🤝 贡献指南

欢迎提交新的技能或改进现有技能！

1. **创建新技能:**
   - 在 `skills/` 目录下创建新目录
   - 遵循标准目录结构
   - 提供完整的文档

2. **改进现有技能:**
   - Fork仓库
   - 创建功能分支
   - 提交Pull Request

3. **报告问题:**
   - 在GitHub Issues中报告问题
   - 提供详细的复现步骤

## 📄 许可证

MIT License - 查看 [LICENSE](LICENSE) 文件了解详情。

## ⚠️ 免责声明

所有技能仅供学习和研究使用，不构成任何投资或操作建议。用户需自行承担使用风险。