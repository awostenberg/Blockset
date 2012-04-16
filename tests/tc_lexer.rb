# Tests the tokenizer to make sure it works
$LOAD_PATH << File.expand_path(".")

require "../lang/lexer"
require "test/unit"

class TestLexer < Test::Unit::TestCase
  def test_simple
    prog = File.read("syntax.test")
    correct = [
      [:hello, :sym],
      [";", :special],
      [42, :int],
      [";", :special],
      [12.34, :float],
      [";", :special],
      [:self, :m_chunk],
      [".", :special],
      [:greet, :m_chunk],
      [";", :special],
      [:self, :m_chunk],
      [".", :special],
      [:"log:", :m_chunk],
      ["Foo", :str],
      [:"level:", :m_chunk],
      [:error, :sym],
      [";", :special],
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