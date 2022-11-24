# 所有不是字母和数字 ==> 空字符串
def to_words(s)
  # 默认 return 最后一句, 不用加 return
  s.gsub(/[^\da-zA-z\s]/, '')
end

# gem install test-unit 测试
require 'test/unit'

class ToWordsTest < Test::Unit::TestCase
  def test_1
    assert_equal '3 the Magic Number', to_words('#3, the *Magic, Number*?')
  end
end