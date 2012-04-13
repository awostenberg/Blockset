# Tests the tokenizer to make sure it works
$LOAD_PATH << File.expand_path(".")

require "../lang/lexer"
require "test/unit"

class TestLexer < Test::Unit::TestCase
  def test_simple
    prog = File.read("syntax.test")
    correct = [
      [:hello, :sym],
      [";", :expr_end],
      [42, :int],
      [";", :expr_end],
      [12.34, :float],
      [";", :expr_end],
      [:self, :m_chunk],
      [".", :op_send_m],
      [:greet, :m_chunk],
      [";", :expr_end],
      [:self, :m_chunk],
      [".", :op_send_m],
      [:"log:", :m_chunk],
      ["Foo", :str],
      [:"level:", :m_chunk],
      [:error, :sym],
      [";", :expr_end],
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