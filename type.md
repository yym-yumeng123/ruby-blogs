## Ruby 中的数据类型

**Ruby .后面的东西一定是方法, 不是属性值**

**只有对象, 可以通过 `.class` 查看类**
- 整数: `Integer`对象 `Numeric`对象
- 浮点数: `Float`对象
- 字符串: `String`对象
- 数组: `Array`对象
- 正则表达式: `Regexp`对象
- 时间: `Time`对象
- 文件: `File`对象
- 符号: `Symbol`对象
- 异常: `Exception` 对象
- 散列: `Hash`对象

**标识**

- 每个对象都有一个 `Object_id` 属性, 标识唯一性

### 数组: 由 Array 类创造出来的对象
```Ruby
mixed = [1, 2, 3, 4, 5]

# mixed.size()
mixed.size # ==> 5

# mixed.methods()
mixed.methods # ==> 打印 arr 所有方法
mixed.methods.sort
```

### 散列: 由 Hash 类创造出来的对象

```Ruby
person = {name: 'yym', age: 12}
person.class # ==> Hash

h = Hash.new  # {}
h[:name] = 'yym'
h{:age} = 16
```

**Symbol**
- 上面的 `name` 和 `age` 不是字符串, 而是 `symbol`
- 等价于 `person = { :name => 'yym', :age => 12 }`
- `person.keys` ==> [:name, :age]
- 如果想要字符串作为 `key`, ==> `perosn = { 'name': => 'yyy', 'age': 14}`


**注意**
- 可以认为 `symbol` 是轻量的字符串, 功能更少
- `:name.to_s` 得到字符串, `'name'.to_sym` 得到符号

### 遍历散列
1. `.each` 方法
```Ruby
person.each do |key, value|
  p "key: #{key}, value: #{value}"
end

# 输出时, symbol会自动变为 string
```

### 与 JS 的区别
```Ruby
# 区别1: 

person = {name: 'yym', age: 12}

# 想要获取 name
不能用 person.name
不能用 person['name']
只能用 person[:name]

'name' 和 :name 是不同的

perosn['name] = 'xxx'

person.keys # [:name, :age, 'name']
```

```Ruby
# 区别2

def say_hi
  p 'hi'
end

想给 person 加一个方法/函数

不能用 person[:say_hi] = say_hi
- 因为 say_hi ==> say_hi()
- say_hi 的返回值为 p 'hi' 的返回值, 也就是 'hi'
- ==> person[:say_hi] = 'hi'

可以使用 lambda 表达式
- person[:say_hi] = lambda { p 'hi'}
- person[:say_hi].call
```