# API 集成指南

## 服务器地址
- **Host**: `http://localhost:8000`
- **Base URL**: `http://localhost:8000`

## API 接口列表

### 1. 发送验证码
- **URL**: `/api/account/vcode`
- **Method**: `GET`
- **Parameters**: 
  - `username` (string): 用户邮箱地址
- **Example**: `GET /api/account/vcode?username=user@example.com`

**请求示例**:
```javascript
const host = 'http://localhost:8000';
const url = `${host}/api/account/vcode?username=${encodeURIComponent(email)}`;

fetch(url, {
    method: 'GET',
    headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
    }
})
.then(response => response.json())
.then(data => {
    // HTTP状态码200表示成功
    // 发送成功
});
```

**响应格式**:
```json
{
    "message": "Verification code sent successfully"
}
```

### 2. 用户注册
- **URL**: `/api/account/register`
- **Method**: `POST`
- **Content-Type**: `application/json`

**请求体**:
```json
{
    "username": "user@example.com",
    "password": "userpassword",
    "repassword": "userpassword",
    "name": "user",
    "email": "user@example.com",
    "vcode": "123456"
}
```

**请求示例**:
```javascript
const registerData = {
    username: data.email, // username参数传邮箱
    password: data.password,
    repassword: data.repassword,
    name: data.email.split('@')[0], // 使用邮箱前缀作为姓名
    email: data.email,
    vcode: data.vcode
};

fetch(`${host}/api/account/register`, {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
    },
    body: JSON.stringify(registerData)
})
.then(response => response.json())
.then(data => {
    // HTTP状态码200表示成功
    // 注册成功
});
```

**响应格式**:
```json
{
    "message": "Registration successful",
    "token": "user-auth-token",
    "user": {
        "name": "username",
        "email": "user@example.com",
        "membershipType": "Free Member",
        "gemBalance": "500"
    }
}
```

### 3. 用户登录
- **URL**: `/api/account/login`
- **Method**: `POST`
- **Content-Type**: `application/json`

**请求体**:
```json
{
    "username": "user@example.com",
    "password": "userpassword"
}
```

**请求示例**:
```javascript
const loginData = {
    username: data.email, // username参数传邮箱地址
    password: data.password
};

fetch(`${host}/api/account/login`, {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
    },
    body: JSON.stringify(loginData)
})
.then(response => response.json())
.then(data => {
    // HTTP状态码200表示成功
    // 登录成功
});
```

**响应格式**:
```json
{
    "message": "Login successful",
    "token": "user-auth-token",
    "user": {
        "name": "username",
        "email": "user@example.com",
        "membershipType": "Premium Member",
        "gemBalance": "1,250"
    }
}
```

### 4. 忘记密码
- **URL**: `/api/account/forgot-password`
- **Method**: `POST`
- **Content-Type**: `application/json`

**请求体**:
```json
{
    "email": "user@example.com"
}
```

**请求示例**:
```javascript
const forgotData = {
    email: data.email
};

fetch(`${host}/api/account/forgot-password`, {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
    },
    body: JSON.stringify(forgotData)
})
.then(response => response.json())
.then(data => {
    // HTTP状态码200表示成功
    // 发送成功
});
```

**响应格式**:
```json
{
    "message": "Password reset link sent successfully"
}
```

### 5. 获取用户信息
- **URL**: `/api/account/authentication`
- **Method**: `GET`
- **Headers**: 
  - `Authorization: Bearer {token}`

**请求示例**:
```javascript
const token = localStorage.getItem('token');

fetch(`${host}/api/account/authentication`, {
    method: 'GET',
    headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': `Bearer ${token}`
    }
})
.then(response => response.json())
.then(data => {
    // HTTP状态码200表示成功
    // 获取用户信息成功
});
```

**响应格式**:
```json
{
    "message": "Authentication successful",
    "user": {
        "id": 123,
        "username": "user@example.com",
        "name": "user",
        "email": "user@example.com",
        "membershipType": "Premium Member",
        "gemBalance": "1,250"
    }
}
```

## 错误处理

### 常见错误响应
```json
{
    "message": "Invalid email format"
}
```

### HTTP 状态码
- `200`: 请求成功（响应体包含数据）
- `400`: 请求参数错误（响应体包含错误信息）
- `401`: 未授权（需要登录）
- `404`: 接口不存在
- `500`: 服务器内部错误

### 错误处理示例
```javascript
.catch(error => {
    console.error('API Error:', error);
    showError(error.message || 'Request failed. Please try again.');
});
```

## 前端集成

### 1. 验证码发送
- 用户输入邮箱后点击"Send Code"
- 前端验证邮箱格式
- 发送GET请求到 `/api/account/vcode?username=email`
- 成功后开始60秒倒计时

### 2. 用户注册
- 用户填写邮箱、验证码、密码
- 前端验证表单数据
- 发送POST请求到 `/api/account/register`
- 成功后自动登录并跳转

### 3. 用户登录
- 用户输入邮箱和密码
- 发送POST请求到 `/api/account/login`
- 成功后存储用户数据和token
- 跳转到主页面

### 4. 忘记密码
- 用户输入邮箱
- 发送POST请求到 `/api/account/forgot-password`
- 显示成功消息

### 5. 获取用户信息
- 用户登录后点击"Test Authentication"按钮
- 发送GET请求到 `/api/account/authentication`
- 使用Bearer token进行身份验证
- 显示用户信息或错误消息

## 安全考虑

1. **HTTPS**: 生产环境应使用HTTPS
2. **CORS**: 确保服务器配置正确的CORS策略
3. **Token存储**: 使用安全的token存储方式
4. **输入验证**: 前后端都要进行输入验证
5. **错误信息**: 不要暴露敏感的错误信息

## 测试建议

1. 测试所有API接口的响应
2. 测试错误情况的处理
3. 测试网络连接失败的情况
4. 测试验证码发送和验证流程
5. 测试用户注册和登录流程 