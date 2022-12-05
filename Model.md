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

使用场景: `一篇博客会有很多标签, 一个标签能匹配到很多博客` => `blogs tags`, 需要一张关联关系表: `blogs_tags`

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

- find_by_sql
  - 接受 字符串 的形式

```rb
User.find_by_sql 'select * from users'
User.find_by_sql 'select * from users where id = 3'
```

- where

```rb
Client.where("orders_count = '2'") # 查找所有 orders_count 字段的值为 2 的客户记录。

# Active Record 会把第一个参数作为条件字符串，并用之后的其他参数来替换条件字符串中的问号（?）
Client.where("orders_count = ?", params[:orders])


# 第一个问号会被替换为 params[:orders] 的值，第二个问号会被替换为 false 在 SQL 中对应的值
Client.where("orders_count = ? AND locked = ?", params[:orders], false)

Client.where("orders_count = ?", params[:orders])

```

### n + 1 查询 及早加载关联

> 查询一次列表的信息, n 次博客标签的信息, N + 1 查询问题的解决办法

Active Record 允许我们提前指明需要加载的所有关联，这是通过在调用 Model.find 时指明 includes 方法实现的。通过指明 includes 方法，Active Record 会使用尽可能少的查询来加载所有已指明的关联。

```rb
# includes 减少查询

@blogs = Blog.all.includes(:tags, :user)
```

### 更新

- update_attributes/update_attribute

```rb
b = Blog.first

b.update_attributs title: 'changed', content: '变化'

b.update_attribute :title, 'changeds'
```

### ActiveRecord 中的 ! 方法

> 失败后抛出异常

- save!
- create!
- update_attributes!

### Exception

- ActiveRecord::RecordNotFound
- ActiveRecord::UnknownAttributError # 未知属性
- ActiveRecord::RecordInvalid # 参数异常
- ActiveRecord::Rollback
- etc.

### model 自定义属性

```rb
class Blog < ApplicationRecord
  belongs_to :user
  # has_and_belongs_to_many :tags, join_table: "table_name", foreign_key: "tags_id"

  # class_name 模型名
  has_many :blogs_tags, class_name: 'BlogsTags'
  has_many :tags, through: :blogs_tags

  validates :title, presence: {message: '标题不能为空'}
  validates :content, presence: {message: '内容不能为空'}
  validates :user_id, presence: {message: '用户不能为空'}

  # 自定义一个属性
  def tags_string= one_tags
    one_tags.split(',').each do |tag|
      one_tag = Tag.find_by(title: tag)
      one_tag = Tag.new title: tag unless one_tag
      self.tags << one_tag
    end
  end

  # 覆盖已有属性
  def content= one_content
    write_attribute :content, one_content * 2
  end
end

```

### Transaction 事务

> 把很多操作放到一个事务中, 如果失败, 回滚到最开始的一个状态

- save destroy 被自动封装在一个事务中, 包括他们的回调
- 事务是基于 database 层级的而不是针对一张表

```rb
Blog.transction do
  blog.save! # 失败进行回滚
end

Blog.transction do
  raise 'error' # 手动抛出错误
end
```

### Model 验证

- validates & validates\_\*\_of

```rb
class User < ApplicationRecord
  has_many :blogs
  # 应用层的验证
  validates :username, presence: { message: '用户名不能为空' }
  validates :username, uniqueness: { message: '用户名已经存在' }
  validates :password, presence: {message: '密码不能为空' }
  validates :password, length: {minimum: 6, message: '密码最小为 6 位'}
end

```

- valid? & errors

```rb
user = User.new username: 'yym'

user.valid? # => false
user.errors # => { password: error }
```

- 自定义 validate

```rb
class User < ApplicationRecord
  # 单数
  validate :should_start_with_letter

  private
  def should_start_with_letter
    unless self.username =~ /^[a-z]/i
      errors.add(:username, 'should start with letter')
    end
  end
end
```

```rb
class EvilUserValidator ActiveModel::Validator
  def validate(record)
    if record.username ="Evil"
      record.errors[:base] < "This person is evil"
    end
  end
end

class User ActiveRecord::Base
  validates with EvilUserValidator
end
```

- validations 触发事件

默认情况下, save 触发  create & update

- 跳过 validations

```rb
user = User.new username: 'yym'
user.save validate: false
```


### Scopes

指定默认的查询参数, 限定查询的范围

1. scope

```rb
class User < ApplicationRecord
  # 定义一些查询方法
  scope :evils, -> { where(style: 'Evil') }
end

# 使用
user.evils.first
user.evils.new # new 出来的值 style 默认为 Evil
```