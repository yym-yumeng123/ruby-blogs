### Rails 技术架构

- 路由(Router)根据请求路径来选择控制器
- 控制器选择合适的视图(View), 渲染给用户
- 如果涉及数据库, 控制器会调用 Model 拿数据
- Model 会调用 ORM 来简化数据操作
- ORM 会直接与 数据库打交道
- Rails 的 ActiveRecord 是一个超级强大的 ORM

### Rails 的依赖 - Rack

- 提供非常简单的 API
- 封装了 HTTP Requset 和 HTTP Response
- 提出了中间件模型
  - 用户请求之后, 服务器响应之前,放在中间的东西, 都是中间件

### gem 是什么

- 类似于 Node.js 的 npm
- gem install 用于全局安装
- 局部安装依赖可以用 bundle install


### 创建 Rails 项目

1. 安装 rails `gem install rails`

2. 创建项目

```rb
# 数据库使用 postgresql
rails new hello-world # 名字是 hello-world
  --database=postgresql # 数据库是 postgresql
  -skip-action-mailbox  # 跳过收件箱
  --skip-action-text  # 跳过富文本
  --skip-sprockets
  --skip-javascript # 跳过 js 
  --skip-turbolinks # 跳过
  --skip-system-test  # 跳过系统测试
  --skip-test # 跳过测试
  --skip-webpack-install # 跳过 webpack 的安装
  --api  # 使用 api 模式

rails new hello-world-rails --database=postgresql --skip-action-mailbox --skip-action-text --skip-sprockets --skip-javascript --skip-turbolinks --skip-system-test --skip-test --api --skip-webpack-install
```