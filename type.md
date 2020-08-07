## Ruby 中的数据类型

**Ruby .后面的东西一定是方法**

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