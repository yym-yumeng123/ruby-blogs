class Myclass
  def initialize
    # 相当于 js 的 this, ruby ,没有 this ,
    # @v 对象的 @v 属性, 就是名字
    @v = 1
  end

  def my_method
    @v += 1

    # 自动 return @v
  end
end

obj = Myclass.new

p obj.class  # MyClass
p obj.my_method  # 2

# 实例变量
p obj.instance_variables  # [:@v]

p obj.methods
p obj.methods.grep(/my/) # [:my_method] 搜索含有 my 的

p Myclass.instance_methods.grep(/my/) # [:my_method] 其实 Myclass.instance_methods 就是 obj.methods


# 总结
# 一个对象的实例变量储存在自身
# 一个对象的方法存储在其类身上


# 看 1.png