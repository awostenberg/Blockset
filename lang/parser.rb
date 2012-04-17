require "lexer"
require "halt"

module Blockset
  # In come tokens, out comes a parse tree
  class Parser
    def parse(data)
      lex, tokens, delims, statement, tree = Lexer.new(data), [], [], [], []
      tokens << lex.next until lex.end?
      tokens.each_with_index do |tok, i|
        #puts "Statement: #{statement}\nsize: #{statement.size}"
        case tok.type
          when :m_chunk
            Blockset.halt_wrong_token tok unless statement.size > 0
            statement << {:val => tok.value}
          when :special
            case tok.value
              when ";"
                tree << statement
                statement = []
            end
          else
            s = {:val => tok.value, :obj => true}
            s[:keyw] = true if tok.type == :keyw
            statement << s
        end
      end
      tree
    end
  end
end