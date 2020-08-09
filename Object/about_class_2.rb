class D
  def x
    'x'
  end
end

class D
  def y
    'y'
  end
end

obj = D.new
p obj.x  # 'x'
p obj.y  # 'y'

=begin
说明多出定义类会合并

第二次定义 D 叫做 打开类  open class

ruby 的 class 更像一个作用于标记, 而不是声明语句

=end
