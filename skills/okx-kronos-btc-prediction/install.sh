#!/bin/bash
# OKX+Kronos BTC预测技能安装脚本

set -e

echo "🚀 OKX+Kronos BTC预测技能安装开始"
echo "============================================================"

# 检查Python版本
echo "🔍 检查Python版本..."
python_version=$(python3 --version 2>&1 | awk '{print $2}')
echo "   Python版本: $python_version"

if [[ "$python_version" < "3.8" ]]; then
    echo "❌ 需要Python 3.8或更高版本"
    exit 1
fi

# 检查依赖
echo "📦 检查依赖..."
for pkg in requests numpy pandas; do
    if python3 -c "import $pkg" 2>/dev/null; then
        echo "   ✅ $pkg 已安装"
    else
        echo "   ⚠️  $pkg 未安装，正在安装..."
        pip3 install $pkg
    fi
done

# 创建配置文件
echo "⚙️  配置系统..."
if [ ! -f "configs/okx_config.json" ]; then
    echo "   📄 创建配置文件..."
    if [ -f "configs/okx_config_template.json" ]; then
        cp configs/okx_config_template.json configs/okx_config.json
        echo "   ℹ️  请编辑 configs/okx_config.json 填入你的OKX API信息"
        echo "   ℹ️  重要: 不要将包含真实API密钥的文件提交到GitHub"
    else
        echo "   ❌ 配置文件模板不存在"
        exit 1
    fi
else
    echo "   ✅ 配置文件已存在"
fi

# 创建日志目录
echo "📝 创建日志目录..."
mkdir -p logs

# 设置脚本权限
echo "🔧 设置脚本权限..."
chmod +x scripts/predict_btc.py

# 测试安装
echo "🧪 测试安装..."
if python3 -c "import requests, numpy, pandas; print('✅ 依赖检查通过')"; then
    echo "   ✅ 依赖检查通过"
else
    echo "   ❌ 依赖检查失败"
    exit 1
fi

echo ""
echo "============================================================"
echo "✅ OKX+Kronos BTC预测技能安装完成"
echo "============================================================"
echo ""
echo "📋 使用说明:"
echo "   1. 编辑配置文件:"
echo "      vi configs/okx_config.json"
echo ""
echo "   2. 填入你的OKX API信息:"
echo "      - api_key: 你的OKX API Key"
echo "      - secret_key: 你的OKX Secret Key"
echo "      - passphrase: 你的OKX Passphrase"
echo "      - testnet: true (建议先使用测试网)"
echo ""
echo "   3. 运行预测:"
echo "      python scripts/predict_btc.py --period=10min"
echo "      python scripts/predict_btc.py --period=1hour --detailed"
echo ""
echo "   4. 查看帮助:"
echo "      python scripts/predict_btc.py --help"
echo ""
echo "⚠️  重要安全提示:"
echo "   - 不要将包含真实API密钥的配置文件提交到GitHub"
echo "   - 建议使用.gitignore排除 configs/okx_config.json"
echo "   - 定期更新API密钥，使用最小权限原则"
echo ""
echo "📚 详细文档请查看:"
echo "   - SKILL.md: 技能详细说明"
echo "   - docs/ 目录: 技术文档"
echo ""
echo "🎯 开始使用:"
echo "   python scripts/predict_btc.py --period=10min"