require "lexer"
require "halt"

module Blockset
  # In come tokens, out comes a parse tree
  class Parser
    def parse(data)
      lex, tokens, delims, statement = Lexer.new(data), [], [], [], []
      tokens << lex.next until lex.end?
      tokens.each do |tok|
        case tok.type
          when :m_chunk
            Blockset.halt_wrong_token tok unless statement.size > 0
            statement << tok.value
          when :op
            case tok.value
              when ";"
                tree << statement
                statement = []
            end
        end
      end
    end
  end
end