### render incontroller

```rb
def search
  render text: :ok
  render json: @users
  render xml: @users
  render file: 'app/views/users/index'
  render partial: 'users/search'

  render html: '<h1>Hello</h1>'.html_safe
end
```

### render 参数

- :content-type
- :layout
- :location
- :status

```rb
render file: filename, Content-type: 'application/pdf'
render json: @user, location: user_url(@user)

render status: 500
render status: :forbidden
```

### 避免多次 render


### CSRF Token

> 跨站请求伪造攻击

### Controller 使用

- app/controller 目录
- 命名规则
- 支持命名空间, 以 module 的方式组织

```rb
class ApplicationController < ActionController::Base
end

class UsersController < ApplicationController
end
```

一些实例方法

- params 
   - 获取 HTTP 请求中 get 和 post 的参数
   - 使用 Symbol 和字符串 `params[:user] params['user']`
- session
- cookies
- render 
- redirect_to

有时不想渲染 HTML 页面，而是把文件发送给用户。在所有的控制器中都可以使用 send_data 和 send_file 方法


- send_data 若想把数据以流的形式发送给客户端，使用 send_data 方法：
- send_file 如果想发送磁盘中已经存在的文件，可以使用 send_file 方法

```rb
def download
  send_file 'file/to/download.gif'
end
```

- request
   - request.fullpath
   - request.get?
   - request.header
   - request.body
   - etc.
- response
   - response.location
   - response.body=


**Class Methods in Controller**

- before_action
- around_action
- after_action


```rb

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
 
  private
 
    def record_not_found
      render plain: "404 Not Found", status: 404
    end
end
```