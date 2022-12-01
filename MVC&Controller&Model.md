### MVC

- Model 数据
- Controller 应用逻辑
- View 用户界面

### 目录设计

- app 项目代码
  - controller MVC 的 C
  - model MVC 的 M
  - views MVC 的 V
- bin/ 可执行的一些程序命令
- config/ 配置文件 启动 部署 初始化 路由等
- db/ 数据库的一些移植
- lib/ 放一些公共的东西
- log/ 一些日志
- public/ 放置一些静态文件
- Gemfile 类似 JS 的 package.json

### Controller

```bash
bin/rails g controller welcome index
```

```rb
# 继承
class WelcomeController < ApplicationController
  # index 方法, 对应 views/welcome/index.html.erb
  def index
  end
end
```

### Model => ORM

1. 对数数据库支持 ActiveRecord

   - SQLite: Rails 默认数据库
   - MySQL
   - PostgreSQL
   - Oracle
   - SQLServer
   - MongoDB: NoSQL
   - etc...

2. Model 模型的命名统一采用单数的形式, 数据库表名 Rails 内部转换为 复数

```rb
bin/rails g model user name:string password:string

bin/rails c

u = User.create name: 'yym', password: '123456'
User.all
User.first

u.id
u.name = '修改'
u.destroy
```

### Session & Cookie

HTTP 协议 => 短连接(返回后连接中断) 无状态

HTTP 无状态 => 怎样保存状态 Cookies

```rb
HTTP Response/Request

# response
Set-Cookie: _circle_session=xxxxxxxxxxxxxxxxxxxxx

# request
Cookie: _circle_session=xxxxxxxxxxxxxxxxxxxxx
```

**Session he Cookie 区别**

- Session 是后端实现
- Cookie 是浏览器实现
- session 的 key 存储基于 Cookie
- session 的数据存储可以基于 Cookie 也可以基于后端存储, 不如数据库
- session 支持存储后端的数据结构, 比如对象
- cookie 只能存字符串
- session 没有大小限制
- cookie 有大小限制

### Controller Filter

1. Filter 使用场景

- 用户登录校验
- 用户请求追踪

`before_action around_action after_action`