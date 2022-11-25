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
