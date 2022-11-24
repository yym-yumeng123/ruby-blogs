# Hashie 是一个库，请先运行命令来安装它： gem install hashie

require 'hashie'

map = Hashie::Mash.new
map.a = 1
p map.a
# 这很像是 JS 的对象，但在 Ruby 里，map.a 只能是一个方法，这是怎么实现的？
# 看看 Mash 的源码，其中有 method_missing 方法
def method_missing(method_name, *args, &blk)
  # 如果有对应的 key，就调用 [method_name]
  return self.[](method_name, &blk) if key?(method_name)
  # suffix 是后缀
  name, suffix = method_name_and_suffix(method_name)
  case suffix
  when '='.freeze # map.a = 1 实际上等价于 map.send(:a=, 1)
    assign_property(name, args.first) # 赋值
  # 省略不相关代码...
  else
    self[method_name]
  end
end

# 也就是说 map 的 :a 和 :a= 方法都是在操作 data[:a]，一个读，一个写
# &blk 是什么？
# 请看下节内容：代码块