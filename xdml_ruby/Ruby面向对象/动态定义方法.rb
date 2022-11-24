class MyClass
  define_method :my_method do |n|
    n * 3
  end
end

require 'test/unit'

class MyClassTest < Test::Unit::TestCase
  def test_1
    obj = MyClass.new
    assert_equal 6, obj.my_method(2)
  end
end

# 动态定义的好处是：可以在运行时决定方法名，而不是在写代码时
# 这在批量创建方法时非常有用