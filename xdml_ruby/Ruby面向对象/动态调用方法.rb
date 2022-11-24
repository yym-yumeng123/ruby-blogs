# 调用方法两种写法
# obj.my_method('ho')
# obj.send(:my_method, 'hi')

# 后者的好处可以实现动态派发, 另一个好处是可以调用私有方法

class Notification
  def notify(which)
    send "notify_#{which}"
  end

  private

  def notify_wechat
    p '通知到微信'
  end
  def notify_email
    p '通知到邮件'
  end
  def notify_phone
    p '通知到手机'
  end
  def notify_dingding
    p 'dingding'
  end
  def notify_all
    notify_wechat
    notify_email
    notify_phone
  end
end

n = Notification.new
n.notify('all')