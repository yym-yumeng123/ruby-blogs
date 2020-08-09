# 打开 String 类, 添加了一个 to_words 方法,
# 可以参考 about_class.rb
class String
  def to_words
    self.gsub(/[^\da-zA-z\s]/, '')  # self 可以省略
  end
end

require 'test/unit'

class ToWordsTest < Test::Unit::TestCase
  def test_1
    assert_equal '3 the Magic Number', '#3, the *Magic, Number*?'.to_words
  end
end