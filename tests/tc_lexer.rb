# Tests the tokenizer to make sure it works
$LOAD_PATH << File.expand_path(".")

require "../lang/lexer"
require "test/unit"

class TestLexer < Test::Unit::TestCase
  def test_simple
    prog = File.read("syntax.test")
    correct = [
      [:hello, :sym],
      [";", :op],
      [42, :int],
      [";", :op],
      [12.34, :float],
      [";", :op],
      [:self, :m_chunk],
      [".", :op],
      [:greet, :m_chunk],
      [";", :op],
      [:self, :m_chunk],
      [".", :op],
      [:"log:", :m_chunk],
      ["Foo", :str],
      [:"level:", :m_chunk],
      [:error, :sym],
      [";", :op],
      [nil, :end]
    ].collect {|args| Lexr::Token.new(*args)}
    result = []
    t = Blockset::Lexer.new(File.read("syntax.test"))
    until t.end?
      result << t.next
    end
    assert_equal(correct, result)
  end
end