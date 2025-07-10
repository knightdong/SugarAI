# Sugar.AI 工作流程总结 🍭

## 🚀 快速开始

### 1. 开发
```bash
# 启动开发服务器
./dev-server.sh
# 访问: http://localhost:8000
```

### 2. 部署
```bash
# 智能部署 (推荐)
./deploy.sh

# 手动部署
git add .
git commit -m "功能更新: [描述]"
git push
```

## 📁 项目结构

```
SugarAI/
├── 📄 *.html         # 网站页面
├── 📁 assets/        # 静态资源
├── 📁 docs/          # 项目文档
├── 🔧 dev-server.sh  # 开发服务器
└── 🔧 deploy.sh      # 部署脚本
```

## ⚡ 快速命令

```bash
# 开发
./dev-server.sh

# 部署
./deploy.sh

# 查看状态
git status

# 查看历史
git log --oneline -5

# 回滚更改
git checkout -- .
```

## 🛠️ 开发流程

1. **编辑HTML文件** - 直接在根目录编辑
2. **实时预览** - 浏览器自动刷新
3. **测试功能** - 确保所有功能正常
4. **部署上线** - 使用 `./deploy.sh`

## 📱 页面列表

- `index.html` - 首页 (Explore)
- `auth.html` - 登录注册
- `chat.html` - 聊天界面
- `create.html` - 创建角色
- `dashboard.html` - 用户面板
- `generate.html` - 生成功能
- `purchase.html` - 购买页面

## 🌐 在线地址

https://knightdong.github.io/SugarAI/

## 📦 资源管理

- 图片存放在 `assets/` 目录
- 使用相对路径引用资源
- 保持文件命名规范

## 🔧 故障排除

### 服务器无法启动
```bash
# 检查端口占用
lsof -i :8000
# 使用其他端口
python3 -m http.server 8001
```

### Git推送失败
```bash
# 拉取最新代码
git pull
# 重新推送
git push
```

---

**简化流程：编辑→预览→部署** 🔄

## 💡 开发提示

- 直接在根目录开发，无需切换目录
- 使用浏览器开发者工具调试
- 保持代码整洁和注释完整
- 及时提交重要更改

---

**更简单，更高效！** ✨ 