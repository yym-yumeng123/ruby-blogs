# 和 inside 相反

module M2
  def my_method
    'M2#my_method()'
  end
end

class C2
  prepend M2
end

class D2 < C2

end

p D2.ancestors  # [D2, M2, C2, Object, Kernel, BasicObject]
# prepend 所以 M2在 C2 下面


d2 = D2.new
p d2.my_method # "M2#my_method()"