# 方法分为 public / private 和 protected
# 默认就是 public 使用 private 开始声明私有方法

class MyClass
  def public_method
    'MyClass#public_method'
  end

  def public_call_private
    self.private_method_1
  end

  def public_call_private_without_self
    private_method_1
  end

  private

  def private_method_1
    'MyClass#private_method_1'
  end

  def private_method_2
    'MyClass#private_method_2'
  end
end

obj = MyClass.new

p obj.public_method
p obj.private_method_1
p obj.public_call_private
p obj.public_call_private_without_self

# 结论
# 私有方法的调用必须满足如下情况
# 1. 必须在对象所在的类里面调用（作用域很小）
# 2. 不能在前面加 self. 字样（只能隐式指定 self）