# Ruby 的基本概念

### 运行 Ruby 的两种方式

1. `irb`
   - 可交互命令行
   - 每次输入一个式子, 都会用 `==>` 给出一个值
2. `ruby`
   - `ruby` + 文件路径

### 变量

1. 没有关键字

```
a = 1
b = a + 2
b ==> 3
```

2. 局部变量

   - 小写字母开头
   - 下划线开头(`_`)

3. 全局变量

   - `$`开头

4. 类变量
   - `@@`开头
5. 实例变量
   - `@`开头

**Ruby 默认没有闭包**

```rb
代码:

a = 1
def f1
    p a
end

f1()  // 括号可以省略
a  // 报错: a不存在

默认没有闭包
- 闭包是指函数可以使用外部的自由变量
- 没有闭包是指函数不可以使用外部的自由变量
- 用 Ruby 其他语法可以使用闭包


代码:

$a = 2
def f1
    p $a
end

f1()  // 1
```

**常量**

```
RUBY_VERSION  // 全大写, 多个单词下划线

// "2.6.5"
```

```
代码:

A = 1
def f1
    p A
end

f1 // 1  大写就是常量
```

**多重赋值**

```
简化:

a, b, c = 1, 2, 3
a, b, *c = 1, 2, 3, 4, 5
a, *b, c = 1, 2, 3, 4, 5, 6

交换:

a, b = b, a
```

### 字符串

- 单引号
  - 不会转义
  - `'1212a\n'`
- 双引号
  - `"1213\n"`
  - 可以转义
- 多行字符串
  ```
  <<eos
  123
  456
  eos (end of string) //  "123\n456\n"
  ```

**log 打印数据**

- `print 'aaa'` (默认不换行)
- `puts 'aaaa'` (默认换行)
- `p 'a', 'b'` (加换行 不转义)
- 只要没有歧义, 括号可不写

使用场景:

- 程序员使用 `p`
- 日志里使用`print puts`

**注释**

- `#` 单行注释
- `#` 这是第二行注释
- 多行注释
  ```
  =begin
  多行注释
  =end
  ```