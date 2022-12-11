### 1. 创建邮件程序

```bash
bin/rails generate mailer User
```


### 2. 邮箱从哪发

```rb

# app/mailers/application_mailer.rb
class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com" # from 自己的邮箱
  layout 'mailer'
end
 
# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
end
```


### 3. 编辑邮件程序

- 定义一个名为 welcome_email 的方法，向用户注册时填写的电子邮件地址发送一封邮件

```rb
# default：一个散列，该邮件程序发出邮件的默认设置。上例中，我们把 :from 邮件头设为一个值，这个类中的所有动作都会使用这个值，不过可以在具体的动作中覆盖。

# mail：用于发送邮件的方法，我们传入了 :to 和 :subject 邮件头
class UserMailer < ApplicationMailer
  # default from: 'notifications@example.com'  # appliction.mailer.rb 已经定义了
 
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
```


### 4. 创建邮件视图


```rb
# app/views/user_mailer/welcome_email.html.erb
```


### 5. 调用邮件程序

```rb
# 让 UserMailer 在保存之后发送一封欢迎邮件
UserMailer.welcome_email(@user).deliver_later
```


### 6. 配置邮箱

```rb

config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:              'smtp.qq.com',
  port:                 587,
  domain:               'example.com',
  user_name:            '<username>',
  password:             '<password>',
  authentication:       'plain',
  enable_starttls_auto: true  
}
```