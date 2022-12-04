### table name

```rb
class User < ActiveRecord::Base

end

User -> users 表名
Person -> people
Blog -> blogs
BlogTag -> blog_tags
```

### Columns 对应表里面的

```rb
id -> int(11)
username -> string
password -> string
created_at -> datetime
updated_at -> datetime
```

### 修改表名

```rb
class User < ActiveRecord::Base
  self.table_name = :user
end
```

### CURD 操作

```rb
# 1. create
user = User.new username: 'yym', password: '123456'
user.save # 成功返回 user 对象, 失败返回 false

user = User.create username: 'yym', password: '123456'

user = User.new
user.username = 'yym'
user.password = '123456'

# 2. find
user = User.where(username: 'yym').first
user = User.find_by(username: 'test')
user = User.first

users = User.where(["username like ?", "%test%"]).order("id desc").limit(2)

# 3. update
user = User.find_by username: 'test'
user.usrename = 'test111'
user.save
User.update_all "status = 1, must_change_password='true'"

# destroy
user = User.find_by username: 'test'
user.destroy
```

### 表间关联关系

> 用户和博客

- `has_many`: 一对多, 多对多
- `has_one`: 一对一
- `belongs_to`: 一对一
- `has_and_belongs_to_many`: 多对多


```rb
class User < ActiveRecord::Base
  has_many :blogs
end

class User < ActiveRecord::Base
  belongs_to :user
end


User模型 -> users表 -> id字段 -> 主键 primary_key
Blog模型 -> blogs表 -> user_id 字段 -> 外键 foreign_key


外键 会被其它外部的表引用
当前关系一对多 Blog 属于 User 模型 => Blog要有一个字段 所属模型转化小写单数 user_id  
```

### 多对多

1. `has_and_belongs_to_many`

使用场景: `一篇博客会有很多标签, 一个标签能匹配到很多博客` =>  `blogs tags`, 需要一张关联关系表: `blogs_tags`

```rb
class Blog < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
end

class Tag < ApplicationRecord
  has_and_belongs_to_many :blogs
end
 
```

2. `has_many`

使用场景: 我们需要访问关联关系表 blogs_tags, 并且在关联关系表 blogs_tags 中添加一些自定义的字段, 回调, 属性检查等

- `has_many :through`


```rb
class BlogsTags < ActiveRecord::Base
  self.table_name = 'blogs_tags'

  belongs_to :blog
  belongs_to :tag
end

class Blog < ApplicationRecord
  belongs_to :user
  # class_name 模型名
  has_many :blogs_tags, class_name: 'BlogTag'
  has_many :tags, through: :blogs_tags
end

class Tag < ApplicationRecord
  has_many :blogs_tags, class_name: 'BlogTag'
  has_many :blogs, through: :blogs_tags
end

```

### 查找

- find(id) 和 find_by(id:1) 和 find_by!
   - find_by 可以定制参数, 查找不到, 返回 nil
   - find 只允许查询 id, 找不到, 抛出异常
   - find_by! 带叹号会抛出异常