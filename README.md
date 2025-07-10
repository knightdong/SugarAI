# Sugar.AI - AI女友平台 🍭

一个现代化的AI虚拟人物交互平台，提供沉浸式的AI角色探索、聊天、创作及内容生成功能。

## 🌐 在线访问

**网站地址**: https://knightdong.github.io/SugarAI/

## 📁 项目结构

```
SugarAI/
├── 📄 index.html       # 首页 (Explore)
├── 📄 auth.html        # 登录注册页面
├── 📄 chat.html        # 聊天页面
├── 📄 create.html      # 创建角色页面
├── 📄 dashboard.html   # 用户面板
├── 📄 generate.html    # 生成页面
├── 📄 purchase.html    # 购买页面
├── 📁 assets/          # 静态资源
│   ├── pic_1.jpeg ~ pic_10.jpeg  # 角色图片
│   ├── ethnicity/      # 种族选择图片
│   └── placeholder.txt
├── 📁 docs/            # 项目文档
├── 🔧 dev-server.sh    # 开发服务器
├── 🔧 deploy.sh        # 部署脚本
└── 📋 *.md            # 指南文档
```

## ✨ 主要功能

### 🔍 Explore (探索)
- 浏览内置AI角色
- 瀑布流展示
- 快速进入聊天

### 💬 Chat (聊天)
- 实时AI对话
- 多媒体支持
- 会话历史记录

### 🎨 Create (创建)
- 自定义角色创建
- 多步骤向导
- 实时预览生成

### 🖼️ Generate (生成)
- 图像生成 (Text-to-Image)
- 视频生成 (AI Video)
- 合影功能 (Instant Storyboard)
- 口型同步 (Lip Sync)

### 👤 Dashboard (面板)
- 用户信息管理
- 历史记录查看
- 会员系统

### 💎 Purchase (购买)
- 会员充值
- 虚拟点数 (Gem)
- Stripe支付

## 🚀 快速开始

### 开发环境

```bash
# 克隆项目
git clone https://github.com/knightdong/SugarAI.git
cd SugarAI

# 启动开发服务器
./dev-server.sh

# 访问 http://localhost:8000
```

### 部署更新

```bash
# 智能部署
./deploy.sh

# 手动部署
git add .
git commit -m "更新描述"
git push
```

## 🛠️ 技术栈

### 前端
- **HTML5** - 语义化结构
- **Tailwind CSS** - 响应式设计
- **Vanilla JavaScript** - 交互功能

### 设计
- **主题色**: `#212121` (深灰背景)
- **强调色**: `#ed7f8c` (粉色)
- **风格**: 现代简约，暧昧性感

### 部署
- **GitHub Pages** - 自动部署
- **域名**: knightdong.github.io/SugarAI

## 📱 页面功能

| 页面 | 功能 | 特色 |
|------|------|------|
| **index.html** | 首页展示 | 角色卡片，瀑布流 |
| **auth.html** | 登录注册 | 用户认证，密码重置 |
| **chat.html** | 聊天界面 | 实时对话，媒体支持 |
| **create.html** | 角色创建 | 多步骤向导，实时预览 |
| **dashboard.html** | 用户面板 | 个人信息，历史记录 |
| **generate.html** | 内容生成 | 图像/视频/合影/口型 |
| **purchase.html** | 购买充值 | 会员系统，Stripe支付 |

## 🔧 开发指南

### 基础开发
1. 直接在根目录的HTML文件中开发
2. 使用 `./dev-server.sh` 启动本地服务器
3. 实时预览和调试

### 部署流程
1. 完成开发和测试
2. 使用 `./deploy.sh` 智能部署
3. 确认GitHub Pages更新

### 文档资源
- `DEVELOPMENT_GUIDE.md` - 详细开发指南
- `WORKFLOW_SUMMARY.md` - 快速参考
- `docs/` - 历史开发文档

## 🎯 项目特点

### 🎨 用户体验
- 现代化UI设计
- 完整的响应式支持
- 流畅的交互动画

### 🔧 开发体验
- 简化的项目结构
- 智能化部署脚本
- 完善的开发文档

### 🌐 部署体验
- 自动GitHub Pages部署
- 快速的CDN访问
- 稳定的在线服务

## 📊 项目状态

- ✅ **核心功能**: 完整实现
- ✅ **响应式设计**: 全平台支持
- ✅ **部署系统**: 自动化完成
- ✅ **文档体系**: 完善维护

## 🤝 贡献指南

1. Fork本项目
2. 创建功能分支
3. 提交更改
4. 发起Pull Request

## 📄 许可证

本项目采用MIT许可证。

## 📧 联系方式

- **GitHub**: https://github.com/knightdong/SugarAI
- **网站**: https://knightdong.github.io/SugarAI/

---

**Sugar.AI - 让AI女友陪伴你的每一天** 💖

*简单开发，智能部署，完美体验* ✨ 