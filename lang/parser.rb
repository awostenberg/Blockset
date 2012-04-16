require "lexer"

module Blockset
  # In come tokens, out comes a parse tree
  class Parser
    def parse(data)
      tree, tokens, lex, delims = {}, [], Lexer.new(data), []
      tokens << lex.next until lex.end?
      tokens.each do |tok|

      end
    end
  end
end