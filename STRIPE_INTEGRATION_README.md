# Sugar.AI 纯前端支付集成指南

## 概述

本项目已实现纯前端的Stripe支付集成，使用Stripe Payment Links功能，无需后端服务器即可处理支付。

## 功能特性

- ✅ **纯前端实现** - 无需后端服务器
- ✅ **Stripe Payment Links** - 使用Stripe托管的支付链接
- ✅ **多种支付方式** - 支持信用卡、PayPal、Apple Pay、Google Pay
- ✅ **安全支付处理** - 所有敏感支付数据由Stripe处理
- ✅ **响应式设计** - 支持移动端和桌面端
- ✅ **简单部署** - 只需静态文件托管

## 技术栈

- **前端**: HTML5, CSS3, JavaScript (ES6+)
- **支付**: Stripe Payment Links
- **部署**: 任何静态文件托管服务

## 实现方案

### 方案一：Stripe Payment Links（推荐）

1. **在Stripe Dashboard创建Payment Links**
   - 登录 [Stripe Dashboard](https://dashboard.stripe.com/)
   - 进入 "Payment Links" 页面
   - 为每个套餐创建支付链接

2. **配置Payment Links**
   ```
   100 Gems Package: https://buy.stripe.com/price_100gems
   250 Gems Package: https://buy.stripe.com/price_250gems  
   500 Gems Package: https://buy.stripe.com/price_500gems
   1000 Gems Package: https://buy.stripe.com/price_1000gems
   ```

3. **更新前端代码**
   ```javascript
   const packages = {
       starter: { 
           gems: 100, 
           price: 4.99, 
           bonus: 0, 
           paymentLink: 'https://buy.stripe.com/price_100gems'
       },
       popular: { 
           gems: 250, 
           price: 9.99, 
           bonus: 50, 
           paymentLink: 'https://buy.stripe.com/price_250gems'
       },
       // ... 其他套餐
   };
   ```

### 方案二：Stripe Checkout Sessions（需要后端）

如果需要更复杂的支付流程，可以使用Stripe Checkout Sessions：

```javascript
// 需要后端API支持
const session = await stripe.checkout.sessions.create({
    payment_method_types: ['card'],
    line_items: [{
        price_data: {
            currency: 'usd',
            product_data: {
                name: `${totalGems} Gems Package`,
                description: `${totalGems} Gems for Sugar.AI`,
            },
            unit_amount: Math.round(price * 100),
        },
        quantity: 1,
    }],
    mode: 'payment',
    success_url: window.location.origin + '/success.html',
    cancel_url: window.location.origin + '/purchase.html',
});
```

## 当前实现

### 文件结构
```
├── purchase.html          # 完整版购买页面（带导航）
├── purchase-simple.html   # 简化版购买页面
└── STRIPE_INTEGRATION_README.md
```

### 功能说明

1. **套餐选择**: 用户可以选择不同的Gem套餐
2. **价格显示**: 实时显示选中套餐的价格和Gem数量
3. **支付确认**: 点击购买按钮显示确认对话框
4. **演示模式**: 当前使用演示模式，可以轻松替换为真实支付

### 测试步骤

1. 打开 `purchase.html` 或 `purchase-simple.html`
2. 选择不同的Gem套餐
3. 点击购买按钮
4. 确认支付（演示模式）

## 集成真实支付

### 1. 创建Stripe Payment Links

在Stripe Dashboard中：

1. 进入 **Payment Links** 页面
2. 点击 **Create payment link**
3. 配置产品信息：
   - **Product name**: "100 Gems Package"
   - **Price**: $4.99
   - **Currency**: USD
4. 设置成功和取消URL
5. 复制生成的支付链接

### 2. 更新前端代码

```javascript
function purchaseGems() {
    const pkg = packages[selectedPackage];
    const totalGems = pkg.gems + pkg.bonus;
    
    // 重定向到Stripe Payment Link
    if (pkg.paymentLink) {
        window.open(pkg.paymentLink, '_blank');
    } else {
        alert('Payment link not configured');
    }
}
```

### 3. 配置Webhook（可选）

如果需要处理支付成功后的业务逻辑：

1. 在Stripe Dashboard中配置Webhook
2. 设置Webhook端点到你的服务器
3. 处理 `checkout.session.completed` 事件
4. 更新用户的Gem余额

## 安全考虑

1. **HTTPS**: 生产环境必须使用HTTPS
2. **Payment Links**: 使用Stripe托管的支付页面
3. **密钥安全**: 前端只使用公钥，私钥仅在后端使用
4. **输入验证**: 所有用户输入都经过验证

## 部署

### 静态文件托管

可以使用任何静态文件托管服务：

- **GitHub Pages**: 免费，适合开源项目
- **Netlify**: 免费，自动部署
- **Vercel**: 免费，性能优秀
- **AWS S3**: 付费，企业级

### 部署步骤

1. 上传HTML文件到托管服务
2. 配置自定义域名（可选）
3. 更新Stripe Payment Links中的域名
4. 测试支付流程

## 测试

### 测试卡号

使用以下Stripe测试卡号：
- **成功支付**: `4242 4242 4242 4242`
- **需要验证**: `4000 0025 0000 3155`
- **支付失败**: `4000 0000 0000 0002`

### 测试环境

确保使用Stripe测试模式：
- 测试公钥: `pk_test_...`
- 测试私钥: `sk_test_...`

## 生产部署

### 1. 切换到生产模式

```javascript
// 使用生产环境的Stripe密钥
const STRIPE_PUBLISHABLE_KEY = 'pk_live_...';
```

### 2. 更新Payment Links

将所有测试Payment Links替换为生产环境的链接。

### 3. 配置域名

在Stripe Dashboard中更新Payment Links的域名设置。

## 故障排除

### 常见问题

1. **Payment Link无效**: 检查链接是否正确配置
2. **支付失败**: 验证Stripe账户和密钥
3. **页面加载慢**: 检查网络连接
4. **CORS错误**: 确保域名配置正确

### 调试模式

启用Stripe调试模式：
```javascript
const stripe = Stripe('pk_test_...', {
    apiVersion: '2023-10-16'
});
```

## 支持

如有问题，请参考：
- [Stripe Payment Links文档](https://docs.stripe.com/payment-links)
- [Stripe Checkout指南](https://docs.stripe.com/payments/checkout)
- [Stripe测试模式](https://docs.stripe.com/testing)

---

**注意**: 当前实现使用演示模式。生产环境需要配置真实的Stripe Payment Links。 