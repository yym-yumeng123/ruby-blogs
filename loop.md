### 循环

1. `times`
   - `.times` 是函数
   - `do...end` 是代码块
   - `{...}` 也是代码块
   - 一般多行用 `do...end` , 单行用 `{...}`
   - 代码块作为 `.times` 函数的参数
   - ruby 可以省略 `()`
```ruby
7.times do
  p 'one'
end

# ==>

7.tiems(do p 'one' end)  # ruby 不喜欢加括号
7.times do p 'one' end

# 也可以写
7.times { p 'one' }
```

```ruby
# 获取 |i|

7.times do |i|
  p "#{i}次"
end

7.times do { |i|
  p "#{i}次"
}
```