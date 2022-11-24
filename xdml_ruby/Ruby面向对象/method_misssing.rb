# 由于 Ruby 不会静态检查代码，所以下面代码不会报错，等你运行的时候才会报错

class MyClass; end

obj = MyClass.new
obj.xxx
# undefined method `xxx' for #<MyClass...

# 因为 MyClass 及其祖先链上都没有 xxx 方法
# 最后 Ruby 只好调用 BaseObject#method_missing 方法

obj.send(:method_missing, :xxx)
# undefined method `xxx' for #<MyClass...

# 神奇的地方在于，我们可以在 MyClass 里覆盖 method_missing 方法

class MyClass
  def method_missing(method, *args)
    p "method: #{method}, args: #{args}"
    p '找不到对应的方法呀大哥'
  end
end

obj1 = MyClass.new
obj1.xxx(1,2,3)

# method_missing 可以让一个对象响应任何方法！