### JWT

- JSON Web Token(加密字符串) 目前最流行的跨域认证解决方案

1. Cookie 是 HTTP Server, 服务器发一个字符串给浏览器, 浏览器后面每次像同一个域名的服务器发送请求的时候, 在请求头上带上这个 token
2. Session 服务端 -> 客户端 发送一个 token, 做一个对应关系

3. JWT 思路

- JWT 的三个部分依次如下: Header（头部）、Payload（负载）、Signature（签名）

```js
Header.Payload.Signature

// Header 部分是一个 JSON 对象，描述 JWT 的元数据，通常是下面的样子
{
  "alg": "HS256", // alg属性表示签名的算法（algorithm），默认是 HMAC SHA256（写成 HS256）
  "typ": "JWT" // typ属性表示这个令牌（token）的类型（type），JWT 令牌统一写为JWT
}

// Payload 部分也是一个 JSON 对象，用来存放实际需要传递的数据。JWT 规定了7个官方字段，供选用
- iss (issuer)：签发人
- exp (expiration time)：过期时间
- sub (subject)：主题
- aud (audience)：受众
- nbf (Not Before)：生效时间
- iat (Issued At)：签发时间
- jti (JWT ID)：编号
// 除了官方字段，你还可以在这个部分定义私有字段，

// JWT 默认是不加密的，任何人都可以读到，所以不要把秘密信息放在这个部分
{
  "sub": "1234567890",
  "name": "John Doe",
  "admin": true
}

// Signature 部分是对前两部分的签名，防止数据篡改
// 需要指定一个密钥（secret）。这个密钥只有服务器才知道，不能泄露给用户。然后，使用 Header 里面指定的签名算法（默认是 HMAC    SHA256），按照下面的公式产生签名。

HMACSHA256(
  base64UrlEncode(header) + "." +
  base64UrlEncode(payload),
  secret)
```

### JWT 的用法

1. 比如用户登录 `post /jwt`, 后端返回 jwt `header.payload.signature`
2. 前端获取后, 存储到 localStorage 中, 如果你使用 `axios` 来请求接口, 配置所有接口 `放在 HTTP 请求的头信息Authorization字段里面`

```
Authorization: Bearer <token>
```

3. `Get /user` 后端接受了请求接口, Authorization 是否有 jwt, 解密