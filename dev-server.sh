#!/bin/bash

# Sugar.AI 开发服务器启动脚本
# 在根目录启动本地开发服务器

echo "🍭 Sugar.AI 开发服务器启动中..."

# 检查是否在项目根目录
if [ ! -f "index.html" ]; then
    echo "❌ 未找到 index.html，请确保在项目根目录运行此脚本"
    exit 1
fi

# 显示当前目录
echo "📁 当前工作目录: $(pwd)"

# 检查项目文件
echo "📋 项目文件检查:"
HTML_FILES=("index.html" "auth.html" "chat.html" "create.html" "dashboard.html" "generate.html" "purchase.html")
for file in "${HTML_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "  ✅ $file"
    else
        echo "  ❌ $file (缺失)"
    fi
done

if [ -d "assets" ]; then
    echo "  ✅ assets/ 目录"
else
    echo "  ❌ assets/ 目录 (缺失)"
fi

echo ""

# 检查可用的服务器
if command -v python3 &> /dev/null; then
    echo "🐍 使用Python3启动服务器..."
    echo "🌐 访问地址: http://localhost:8000"
    echo "📱 移动端测试: http://$(ipconfig getifaddr en0):8000"
    echo "⏹️  停止服务器: Ctrl+C"
    echo ""
    echo "🚀 服务器启动中..."
    python3 -m http.server 8000
elif command -v python &> /dev/null; then
    echo "🐍 使用Python启动服务器..."
    echo "🌐 访问地址: http://localhost:8000"
    echo "📱 移动端测试: http://$(ipconfig getifaddr en0):8000"
    echo "⏹️  停止服务器: Ctrl+C"
    echo ""
    echo "🚀 服务器启动中..."
    python -m http.server 8000
elif command -v node &> /dev/null; then
    echo "🟢 使用Node.js启动服务器..."
    echo "🌐 访问地址: http://localhost:8000"
    echo "📱 移动端测试: http://$(ipconfig getifaddr en0):8000"
    echo "⏹️  停止服务器: Ctrl+C"
    echo ""
    echo "🚀 服务器启动中..."
    npx serve -s . -p 8000
else
    echo "❌ 未找到Python或Node.js，请安装其中一个："
    echo "   - Python: https://www.python.org/downloads/"
    echo "   - Node.js: https://nodejs.org/en/download/"
    exit 1
fi 