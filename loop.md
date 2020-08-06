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

---

2. `.each`
- `each` 一般用来遍历数组
```ruby
name = ['yym', 'xxx', 'yyy']
name.each do |i|
  p i
end

1..7 ==> 1..7
(1..7).class ==> Range

(1..7).each do |i|
  p i  # 1 2 3 4 5 6 7
end
```

---

3. `for`
```ruby
for i in 1..5 # do可省略
  p i
end

names = ['yym', 'xxx']
for name in names
  p name
end
```

---

4. `while/until`
```ruby

i = 1
while i < 3
  p i
  i += 1
end


# 不成立
j = 1
until j >= 3
  p j
  j+=1
end
```

---

5. `loop`
```ruby

# 无限循环
loop do
  p 'Hello'
end
```

---

6. 跳出循环
- `break` 表示退出所有循环
- `next` 表示退出当前循环, 进入下次循环