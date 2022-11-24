# 大写字母开头就是常量, 约定

Const1 = 'root const'
module MyModule # 暂时先认为 module 和 class 无区别
  Const1 = 'outer cosnt'
  class MyClass
    Const1 = 'inner const'
    p 'Module.nesting'
    p Module.nesting # [MyModule::MyClass, MyModule]
  end

  p Const1  # 作用域 'outer const'
  p MyClass::Const1 # 想打印里面的  'inner const'
  p ::Const1  #  'root const'
end

p Const1 # 'root const'
p MyModule::Const1  # MyModule 下的 Const1 'outer const'
p MyModule::MyClass::Const1 # 'inner const'
p ::Const1  # 没有任何前缀 'root const'

p 'MyModule.constants 方法得到 MyModule 内部的所有一级常量'
p MyModule.constants  # [:Const1, :MyClass]

p '要区别于 Module.constants 他会得到所有顶级常量'
p Module.constants[0..5]

p MyModule.is_a? Module  # true  MyModule 是 Module的实例
# 这是因为 MyModule.constants是实例方法, Module.constants 是类方法, 作用不同


# 可以在任何地方使用 Module.nesting 打印出当前作用域的层级结构

