# 消息 接收者和祖先链
# 接收者 - my_string.reverse() 中的 my_string 就是接收者
# 祖先链 - 从一个类 经过它的超类...... 一直到达 BasicObject 类, 这个路径就是该类的组限量


# 方法查找: 顺着祖先链向上查找


class MyClass
  def my_method
    'my_method()'
  end
end

class MySubClass < MyClass

end

obj = MySubClass.new
p obj.my_method  # 方法查找 看图 ./方法查找.png

p MySubClass.ancestors  # [MySubClass, MyClass, Object, Kernel, BasicObject]