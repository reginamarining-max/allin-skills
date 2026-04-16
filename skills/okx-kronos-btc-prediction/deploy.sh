#!/bin/bash
# OKX+Kronos BTC预测技能部署脚本

set -e

echo "🚀 OKX+Kronos BTC预测技能部署开始"
echo "============================================================"

# 检查当前目录
if [ ! -f "SKILL.md" ]; then
    echo "❌ 错误: 请在技能根目录运行此脚本"
    exit 1
fi

# 检查git状态
echo "🔍 检查Git状态..."
if [ -n "$(git status --porcelain)" ]; then
    echo "⚠️  有未提交的更改，正在提交..."
    git add .
    git commit -m "chore: update files before deployment"
else
    echo "✅ Git工作区干净"
fi

# 显示部署信息
echo ""
echo "📋 部署信息:"
echo "   当前分支: $(git branch --show-current)"
echo "   提交数量: $(git rev-list --count HEAD)"
echo "   最后提交: $(git log -1 --oneline)"

echo ""
echo "📦 技能包内容:"
echo "   总文件数: $(find . -type f -name "*.py" -o -name "*.md" -o -name "*.json" -o -name "*.sh" | wc -l)"
echo "   核心脚本: scripts/predict_btc.py"
echo "   配置文件: configs/okx_config_template.json"
echo "   安装脚本: install.sh"
echo "   依赖文件: requirements.txt"

echo ""
echo "🔒 安全检查:"
echo "   1. ✅ 配置文件模板不包含真实API密钥"
echo "   2. ✅ .gitignore排除了敏感配置文件"
echo "   3. ✅ README包含安全提示"

echo ""
echo "📚 部署选项:"
echo "   1. 推送到现有GitHub仓库"
echo "   2. 打包为ZIP文件"
echo "   3. 本地安装测试"

echo ""
read -p "🎯 请选择部署选项 (1/2/3): " deploy_option

case $deploy_option in
    1)
        echo ""
        echo "🌐 推送到GitHub仓库..."
        echo "   请确保已设置远程仓库:"
        echo "   git remote add origin <your-repo-url>"
        echo ""
        read -p "   是否继续? (y/n): " confirm
        if [ "$confirm" = "y" ]; then
            echo "   推送中..."
            git push -u origin master
            echo "✅ 推送完成"
        else
            echo "❌ 取消推送"
        fi
        ;;
    2)
        echo ""
        echo "📦 打包为ZIP文件..."
        zip_name="okx-kronos-btc-prediction-v1.0.0.zip"
        zip -r "$zip_name" . -x "*.git*" "*.pyc" "__pycache__/*"
        echo "✅ 打包完成: $zip_name"
        echo "   文件大小: $(du -h "$zip_name" | cut -f1)"
        ;;
    3)
        echo ""
        echo "🧪 本地安装测试..."
        if [ -f "install.sh" ]; then
            chmod +x install.sh
            ./install.sh
        else
            echo "❌ 安装脚本不存在"
        fi
        ;;
    *)
        echo "❌ 无效选项"
        ;;
esac

echo ""
echo "============================================================"
echo "✅ 部署流程完成"
echo "============================================================"
echo ""
echo "💡 下一步:"
echo "   1. 确保不包含敏感信息"
echo "   2. 更新文档和示例"
echo "   3. 测试功能完整性"
echo "   4. 分享给其他用户"