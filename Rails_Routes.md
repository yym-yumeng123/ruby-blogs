### Routes

规定了特定格式的URL请求到后端 controller 的 action 的分发规则

在 `config/routes.rb`, 使用 指定的方法和参数来生成路由


```rb
GET /usres/2

get '/users/:id', to: 'users#show'
get 'users/:id' => 'users#show'
```

命名路由

```rb
# 生成一些默认方法
get '/users/:id', to: 'users#show', as: 'user'
```

RESTful 资源设计

- GET
- POST
- PATCH/PUT
- DELETE

```rb
resources :users

get /users index
post /users create
get /users/:id show
patch/put /users/:id update
delete /users/:id destroy

resources :users, :photos
```

单数资源, 有时候我们不需要传递 id, 比如用户自身的信息编辑页面

```rb
get 'profile', to: 'users#show'


resource :users

get /user show
post /user create
patch/put /user update
delete /user destroy
```


命名空间

```rb
namespace :admin do
  resources :users
end


get /admin/users 'admin/users#index' 
post /admin/users 'admin/users#create'
get /admin/users/:id 'admin/users#show'
patch/put /admin/users/:id 'admin/users#update'
delete /admin/users/:id 'admin/users#destroy'
```

如果想把 /users 路径（不带 /admin 前缀） 映射到 Admin::Users 控制器上，可以这样声明：

```rb
scope module: 'admin' do
  resources :users
end

resources :users, module: 'admin'

get /users 'admin/users#index'
```

或者反之, 想在 url 中显示 /admin, 而不想把代码放在命名空间中, 

```rb
scope '/admin' do
  resources :articles
end

GET /admin/articles 'articles#index'
```

嵌套资源

```rb
# 嵌入路由不要超过一层
resources :users do
  resources :blogs
end

GET /users/:user_id/blogs 'blogs#index'
POST /users/:user_id/blogs 'blogs#create'
GET /users/:user_id/blogs/:id 'blogs#show'
```

排除不需要的 action 和请求方式

```rb
resources :users, only: [:create, :show]
```

我们可以使用的路由，并不仅限于 REST 式路由默认创建的那 7 个。我们可以根据需要添加其他路由，包括集合路由（collection route）和成员路由（member route)

- 需要 id 定义为 member 路由
- 不需要 id 定义为 collection 路由

```rb
resources :users do
  member do
    post :status
  end

  post :status, on: :member

  collection do
    get :online
  end
end

POST /users/:id/status 'users#status'
GET /users/online 'users#online'
```

### 非 RESTful 资源式路由

```rb
# :action :id optional
# /photos/show
# /photos/show/1
# /photos => index action
get :controller(/:action(/:id))

# /photos/show/1/2
get :controller/:action/:id/:user_id
```

约束

```rb
get 'photos/:id', to: 'photos#show', constraints: { id: /[A-Z]\d{5}/ }
```

重定向

```rb
# 通过 redirect 辅助方法可以把一个路径重定向到另一个路径
get '/stories', to: redirect('/articles')

```

根路由

```rb
root to: 'pages#main'
root 'pages#main' # 上一行代码的简易写法
```
