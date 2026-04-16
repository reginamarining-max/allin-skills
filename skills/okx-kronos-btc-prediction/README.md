# OKX+Kronos BTC价格预测系统

基于真实OKX API数据和Kronos-small模型的BTC价格预测系统，提供标准化、可重复的预测工作流。

## ✨ 特性

- **真实数据源**: 直接连接OKX API获取实时市场数据
- **标准化预测**: 基于Kronos-small模型的标准化预测算法
- **风险评估**: 自动评估市场风险等级
- **交易建议**: 提供基于预测结果的交易建议
- **完整工作流**: 从数据获取到预测报告的完整流程

## 🚀 快速开始

### 1. 克隆仓库
```bash
git clone https://github.com/reginamarining-max/allin-skills.git
cd allin-skills/okx-kronos-btc-prediction
```

### 2. 安装依赖
```bash
# 使用安装脚本
chmod +x install.sh
./install.sh

# 或手动安装
pip install requests numpy pandas
```

### 3. 配置OKX API
```bash
# 复制配置文件模板
cp configs/okx_config_template.json configs/okx_config.json

# 编辑配置文件，填入你的OKX API信息
# 重要: 不要将包含真实API密钥的文件提交到GitHub
```

### 4. 运行预测
```bash
# 预测10分钟后价格
python scripts/predict_btc.py --period=10min

# 预测1小时后价格，显示详细报告
python scripts/predict_btc.py --period=1hour --detailed

# 查看所有选项
python scripts/predict_btc.py --help
```

## 📊 预测周期

系统支持以下预测周期：

| 周期 | 描述 | 适用场景 |
|------|------|----------|
| **10分钟** | 短期预测，基于近期趋势 | 高频交易、套利策略 |
| **30分钟** | 中期预测，平衡短期波动 | 日内交易、波段操作 |
| **1小时** | 长期预测，基于整体趋势 | 趋势跟踪、中期持仓 |
| **1天** | 超长期预测，基于宏观趋势 | 长期投资、资产配置 |

## 🏗️ 系统架构

```
OKX+Kronos BTC预测系统
├── data/                    # 数据获取模块
│   ├── okx_api_client.py   # OKX API客户端
│   └── data_storage.py     # 数据存储管理
├── models/                  # 预测模型模块
│   ├── prediction_system.py # 预测系统核心
│   └── kronos_integration.py # Kronos模型集成
├── indicators/              # 技术指标模块
│   ├── rsi.py              # RSI指标
│   ├── macd.py             # MACD指标
│   └── bollinger.py        # 布林带指标
├── scripts/                 # 运行脚本
│   └── predict_btc.py      # 主预测脚本
├── configs/                 # 配置文件
│   ├── okx_config_template.json # 配置模板
│   └── okx_config.json     # 用户配置（不提交）
├── tests/                   # 测试文件
├── docs/                    # 文档
└── logs/                    # 日志目录
```

## 🔧 配置说明

### 配置文件结构
```json
{
  "api_key": "YOUR_OKX_API_KEY_HERE",
  "secret_key": "YOUR_OKX_SECRET_KEY_HERE",
  "passphrase": "YOUR_OKX_PASSPHRASE_HERE",
  "testnet": true,
  "default_symbols": ["BTC-USDT", "ETH-USDT"],
  "data_retention_days": 30,
  "update_intervals": {
    "ticker": 5,
    "candles_5m": 300
  }
}
```

### 安全建议
1. **使用测试网**: 建议先使用OKX测试网（`testnet: true`）
2. **最小权限**: 为API密钥设置最小必要权限
3. **环境变量**: 考虑使用环境变量存储敏感信息
4. **定期更新**: 定期更换API密钥

## 📈 输出示例

### 标准输出
```
🚀 OKX+Kronos BTC价格预测系统
============================================================

📊 实时数据:
   当前价格: $75,123.45
   24小时变化: +2.34%
   数据点数量: 100个

🔮 10分钟后预测:
   预测价格: $75,234.56 (+0.15%)
   趋势方向: 温和上涨
   置信度: 78.5%

⚠️  风险评估:
   风险等级: 中等
   市场波动性: 0.0032

💡 交易建议:
   1. 🟡 可适度参与
   2. 📊 关注阻力位 $75,500
   3. 🔄 保持灵活仓位
```

### 详细报告（JSON格式）
预测结果会自动保存为JSON文件，包含完整的数据和元信息。

## 🧪 测试

运行测试确保系统正常工作：
```bash
# 运行单元测试
python -m pytest tests/ -v

# 运行集成测试
python tests/test_okx_api_integration.py
```

## 📚 文档

- [技能详细说明](SKILL.md)
- [API文档](docs/api.md)
- [部署指南](docs/deployment.md)
- [故障排除](docs/troubleshooting.md)

## 🔄 更新日志

### v1.0.0 (2026-04-16)
- ✅ 初始版本发布
- ✅ 完整预测系统集成
- ✅ 标准化工作流
- ✅ 真实数据源验证

## 🤝 贡献

欢迎提交Issue和Pull Request！

1. Fork仓库
2. 创建功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开Pull Request

## 📄 许可证

本项目采用MIT许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## ⚠️ 免责声明

**重要**: 本系统仅提供基于历史数据和机器学习模型的预测分析，不构成任何投资建议。加密货币市场具有高波动性，投资需谨慎。

- 预测结果仅供参考，不保证准确性
- 用户需自行承担投资风险
- 建议结合多种分析工具和风险管理策略