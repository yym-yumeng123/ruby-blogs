# BasicObject 类的根本

p '--string--'
# string 的超类 Object
p String.superclass  # Object
# Object 的超类 是 BasicObject
p Object.superclass  # BasicObject
# 基本对象的超类是 nil
p BasicObject.superclass  # nil
p String.is_a? Class  # true



p '--Array--'
p Array.superclass  # Object
# 数组也是 class 实例
p Array.is_a? Class  # true


p '--自定义 MyClass --'
class MyClass; end
p MyClass.superclass  # Object
p MyClass.is_a? Class  # true

# 所有类都是 CLass 类的实例, 所有类的构造柱都是 Class
# 但每个类的父类/超类各不相同


p 'Class.is_a Class'
Class.is_a? Class
# 所有类都是 Class 类的实例, Class 也是类, 当然是 Class 的实例



# Class 构造者是 Class
# 那么Class 父类是什么呢
p 'Class.superclass'
p Class.superclass  # 'Module'


=begin
总结:

一个对象有哪些属性
1. 先看自身存储了那些方法或属性
2. 再看类定义了那些方法或属性
3. 再看类的父类定义了那些属性或方法
=end