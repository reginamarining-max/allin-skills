# OKX+Kronos BTC价格预测技能

## 描述

基于真实OKX API数据和Kronos-small模型的BTC价格预测系统。使用完整的OKX+Kronos系统，提供标准化、可重复的预测工作流。

## 功能

1. **真实数据获取** - 直接从OKX API获取最新价格和历史数据
2. **标准化预测** - 使用完整版Kronos-small模型进行预测
3. **风险评估** - 自动评估市场风险等级
4. **交易建议** - 提供基于预测结果的交易建议
5. **数据真实性验证** - 确保所有数据均为真实市场数据

## 快速开始

### 1. 安装依赖
```bash
pip install requests numpy pandas
```

### 2. 配置OKX API
1. 复制配置文件模板：
```bash
cp configs/okx_config_template.json configs/okx_config.json
```

2. 编辑 `configs/okx_config.json`，填入你的OKX API信息：
- `api_key`: 你的OKX API Key
- `secret_key`: 你的OKX Secret Key  
- `passphrase`: 你的OKX Passphrase
- `testnet`: 建议设为 `true` 进行测试

### 3. 运行预测
```bash
# 预测10分钟后价格
python scripts/predict_btc.py --period=10min

# 预测1小时后价格
python scripts/predict_btc.py --period=1hour

# 显示详细报告
python scripts/predict_btc.py --period=30min --detailed
```

## 使用方式

### 基本使用
```bash
# 直接运行技能
openclaw skill run okx-kronos-btc-prediction

# 或通过OpenClaw调用
使用技能: okx-kronos-btc-prediction
```

### 参数选项
- `--period`: 预测周期 (10min, 30min, 1hour, 1day)
- `--force-refresh`: 强制刷新数据（不使用缓存）
- `--detailed`: 显示详细报告

### 示例
```bash
# 预测10分钟后价格
openclaw skill run okx-kronos-btc-prediction --period=10min

# 预测1小时后价格，强制刷新数据
openclaw skill run okx-kronos-btc-prediction --period=1hour --force-refresh

# 显示详细报告
openclaw skill run okx-kronos-btc-prediction --period=30min --detailed
```

## 工作流程

### 1. 数据获取阶段
- ✅ 连接OKX API
- ✅ 获取实时BTC价格
- ✅ 获取历史K线数据
- ✅ 验证数据真实性

### 2. 预测处理阶段
- ✅ 初始化Kronos-small模型
- ✅ 运行标准化预测算法
- ✅ 计算未来价格趋势
- ✅ 评估预测置信度

### 3. 分析报告阶段
- ✅ 生成预测结果
- ✅ 评估市场风险
- ✅ 提供交易建议
- ✅ 输出标准化报告

## 输出格式

### 标准输出
```
🚀 OKX+Kronos BTC价格预测系统
============================================================

📊 实时数据:
   当前价格: $75,123.45
   24小时变化: +2.34%
   数据点数量: 100个

🔮 预测结果:
   10分钟后: $75,234.56 (+0.15%)
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
```json
{
  "timestamp": "2026-04-16T07:38:00Z",
  "data_source": "okx_api_real_time",
  "current_price": 75123.45,
  "predictions": {
    "10min": {
      "price": 75234.56,
      "change_percent": 0.15,
      "trend": "温和上涨"
    }
  },
  "confidence": 0.785,
  "risk_assessment": {
    "risk_level": "中等",
    "volatility": 0.0032
  },
  "trading_recommendations": [
    "可适度参与",
    "关注阻力位 $75,500",
    "保持灵活仓位"
  ]
}
```

## 技术实现

### 核心组件
1. **数据获取模块** (`data/okx_api_client.py`)
   - 实时价格获取
   - 历史数据获取
   - 数据验证

2. **预测引擎模块** (`models/prediction_system.py`)
   - Kronos-small模型集成
   - 标准化预测算法
   - 置信度计算

3. **分析报告模块** (`scripts/predict_btc.py`)
   - 风险评估
   - 交易建议生成
   - 报告格式化

### 数据流程
```
OKX API → 数据获取模块 → 预测引擎模块 → 分析报告模块 → 用户输出
```

## 配置要求

### 环境要求
- Python 3.8+
- OpenClaw 1.0+ (可选)
- 网络连接（访问OKX API）

### 依赖包
```
requests>=2.28.0
numpy>=1.21.0
pandas>=1.3.0
```

## 错误处理

### 常见错误
1. **API连接失败**
   - 原因: 网络问题或OKX API服务异常
   - 处理: 重试机制，备用数据源

2. **数据格式错误**
   - 原因: OKX API响应格式变更
   - 处理: 数据验证，格式适配

3. **预测模型错误**
   - 原因: 数据不足或模型初始化失败
   - 处理: 数据补充，模型重试

### 错误代码
- `ERR_API_CONNECTION`: API连接失败
- `ERR_DATA_FORMAT`: 数据格式错误
- `ERR_PREDICTION_FAILED`: 预测失败
- `ERR_SYSTEM_ERROR`: 系统内部错误

## 安全注意事项

1. **数据真实性**
   - 所有数据必须来自真实OKX API
   - 禁止使用模拟数据
   - 数据源验证机制

2. **系统完整性**
   - 使用完整版预测系统
   - 禁止创建简化脚本
   - 标准化工作流程

3. **风险提示**
   - 明确标注预测不确定性
   - 提供风险等级评估
   - 免责声明

## 维护计划

### 日常维护
- ✅ 每日数据源验证
- ✅ 预测系统健康检查
- ✅ 缓存数据清理

### 定期更新
- 🔄 每周模型性能评估
- 🔄 每月系统优化
- 🔄 每季度功能增强

## 版本历史

### v1.0.0 (2026-04-16)
- ✅ 初始版本发布
- ✅ 完整预测系统集成
- ✅ 标准化工作流
- ✅ 真实数据源验证

## 使用限制

1. **数据频率限制**
   - OKX API可能有请求频率限制
   - 建议预测间隔不少于5分钟

2. **预测准确性**
   - 加密货币市场波动性高
   - 预测仅供参考，不构成投资建议

3. **系统依赖**
   - 依赖OKX API服务可用性
   - 需要稳定的网络连接

## 贡献指南

1. **问题报告**
   - 在GitHub Issues中报告问题
   - 提供详细的错误信息和复现步骤

2. **功能建议**
   - 在GitHub Discussions中提出建议
   - 描述使用场景和预期效果

3. **代码贡献**
   - Fork仓库并创建分支
   - 遵循现有代码风格
   - 提交Pull Request

## 许可证

MIT License

---

**注意：** 本技能仅提供基于历史数据和机器学习模型的预测分析，不构成任何投资建议。加密货币市场具有高波动性，投资需谨慎。