# Ruby 的 if 语句

```ruby
# 一行
if a > 3 then p '大' end
if a > 3 then p '大' else p '小' end

p (if a>3 then '大' else '小' end)   # 有返回值
    
# 多行
p(if a>4
    '大'
    elseif a> 2
    '中'
    else
    '小'
    end)
```

## Ruby 的 if 语句 2

```ruby
b = if a>3 then 'big' else 'small' end
b = a>3 ? 'big' : 'small'

return if error
return unless success # 如果某个结果成功, return 不成功
# 等同于
return if not success
```



## case语句

```ruby
# 有返回值
case x
    when 1
    '1'
    when 2,3
    '2 or 3'
else
    'hi'
end

```

