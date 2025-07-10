#!/bin/bash

# Sugar.AI 部署脚本
# 检查项目状态并部署到GitHub Pages

echo "🍭 Sugar.AI 部署脚本启动..."

# 检查是否有未提交的更改
if [ -n "$(git status --porcelain)" ]; then
    echo "📋 检测到未提交的更改："
    git status --short
    echo ""
    
    # 创建备份目录
    BACKUP_DIR="backup_$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    
    # 备份重要文件
    echo "📦 创建备份到 $BACKUP_DIR..."
    cp *.html "$BACKUP_DIR/" 2>/dev/null || true
    cp -r assets "$BACKUP_DIR/" 2>/dev/null || true
    echo "  ✅ 备份完成"
    
    echo ""
    echo "🔄 准备提交更改..."
    
    # 检查更改类型
    if git diff --name-only | grep -q "\.html$"; then
        echo "  📄 检测到HTML文件更改"
    fi
    
    if git diff --name-only | grep -q "assets/"; then
        echo "  📁 检测到资源文件更改"
    fi
    
    # 显示差异摘要
    echo ""
    echo "📊 更改摘要："
    git diff --stat
    
    echo ""
    echo "🤔 请确认是否要部署这些更改 (y/N):"
    read -r confirm
    
    if [[ $confirm =~ ^[Yy]$ ]]; then
        echo "✅ 确认部署..."
        
        # 添加更改
        git add .
        
        # 提交更改
        echo "📝 请输入提交信息 (留空使用默认信息):"
        read -r commit_message
        
        if [ -z "$commit_message" ]; then
            commit_message="更新网站内容 - $(date '+%Y-%m-%d %H:%M:%S')"
        fi
        
        git commit -m "$commit_message"
        
        # 推送到GitHub
        echo "🚀 推送到GitHub..."
        git push
        
        if [ $? -eq 0 ]; then
            echo ""
            echo "🎉 部署成功！"
            echo "📦 备份文件保存在: $BACKUP_DIR"
            echo "🌐 网站将在几分钟内更新: https://knightdong.github.io/SugarAI/"
            echo "⏰ 通常需要 2-10 分钟完成部署"
        else
            echo ""
            echo "❌ 推送失败！请检查网络连接或解决冲突"
            echo "💡 提示: 尝试运行 'git pull' 然后重新推送"
        fi
    else
        echo "❌ 取消部署"
        echo "💡 提示: 使用 'git status' 查看更改"
    fi
else
    echo "✅ 工作目录干净，没有需要部署的更改"
    echo "📊 项目状态："
    echo "  - 最后提交: $(git log -1 --pretty=format:'%h - %s (%ar)')"
    echo "  - 分支: $(git branch --show-current)"
    echo "  - 远程状态: $(git status -b --porcelain | head -1)"
    echo ""
    echo "🌐 当前网站: https://knightdong.github.io/SugarAI/"
fi

echo ""
echo "🛠️  常用命令："
echo "  查看状态: git status"
echo "  查看历史: git log --oneline -10"
echo "  强制推送: git push -f (谨慎使用)"
echo "  回滚更改: git checkout -- ." 