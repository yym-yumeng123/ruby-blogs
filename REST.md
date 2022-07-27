### REST

1. 一种网络软件架构风格

   - 不是标准, 不是协议, 不是接口, 只是一种风格

2. 怎么做?
   - 以资源为中心
   - 充分利用 HTTP 现有功能, 如动词, 状态码, 头部字段
   - Github API 比较符合 REST 架构风格

### 风格举例

1. 请求 1: 创建 item
   - POST /api/items
   - Content-Type: application/json
   - 消息体 { "name": "foo", "description": "bar" }
   - 响应: { "id": 1, "name": "foo", "description": "bar" }
2. 请求 2: 创建 item
   - POST /api/items
   - Content-Type: application/x-www-form-urlencoded
   - 消息体: name=foo&description=bar
   - 响应: { "id": 1, "name": "foo", "description": "bar" }
3. 请求 3: 更新 item
   - PUT /api/items/1
   - Content-Type: application/json
   - 消息体 { "name": "foo", "description": "bar" }
4. 请求 4: 删除 item

   - DELETE /api/items/1

5. 请求 5: 获取 item
   - GET /api/items/1
   - GET /api/items/1?name=foo
   - GET /api/items/1?name=foo&description=bar
   - GET /api/items/1?name=foo&description=bar&other=baz

### 风格总结

1. 尽量以资源为中心
2. 充分利用 HTTP 现有功能, 如动词, 状态码, 头部字段
3. 可以适当违反规则

符合 REST 风格的 API 就叫 RESTful API

### API 概要设计

1. 发送验证码
   - 资源: validation_code(s)
   - 动作: create(POST)
   - 状态码: 200 | 201 | 422 | 429
2. 登入登出
   - 资源: session(没有 s)
   - 动作: create | destroy(DELETE)
   - 状态码: 200 | 422
3. 当前用户
   - 资源: me
   - 动作: show(GET)
4. 记账数据
   - 资源: items
   - 动作: create | update(PATCH) | show(GET: /items/:id) | index(GET /items?since=12) | destroy(DELETE) 一般为软删除
5. 标签
   - 资源: tags
   - 动作: create | update | show | index | destroy
6. 打标签
   - 资源: tagging (动词的名词形式)
   - 动作: create | index | destroy
