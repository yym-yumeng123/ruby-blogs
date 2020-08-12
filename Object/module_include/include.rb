module M1
  def my_method
    # #号键表示实例方法
    # .表示类方法
    'M1#my_method()'
  end
end

class C1
  include M1 # 相当于 C1 < M1, 但是不能继承一个模块,只能继承一个雷
end

class D1 < C1

end


p D1.ancestors # [D1, C1, M1, Object, Kernel, BasicObject
# 出现 Kernel 是因为 Object include 了 Kernel，比如 print 就定义在 Kernel 里