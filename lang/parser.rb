require "lexer"
require "halt"

module Blockset
  # In come tokens, out comes a parse tree
  class Parser
    # TOTO: REFACTOR!!
    def parse(data)
      lex, msg, args, tokens, delims, statement, tree = Lexer.new(data), "", [], [], [], [], []
      tokens << lex.next until lex.end?
      tokens.each_with_index do |tok, i|
        #puts "Statement: #{statement}\nsize: #{statement.size}"
        case tok.type
          when :m_chunk
            #Blockset.halt_wrong_token tok unless statement.size > 0
            msg << tok.value.to_s
            #statement << {:val => tok.value}
          when :special
            case tok.value
              when ";"
                tree << statement
                msg, args, statement = "", [], []
              when "."
                statement << {:val => msg, :args => args}
                msg, args = "", []
            end
          else
            if msg.size > 0
              # We must be assembling a message send
              puts msg
              puts args
              puts
              args << tok.value
            else
              if statement.size == 0
                s = {:val => tok.value, :obj => true}
                s[:keyw] = true if tok.type == :keyw
                statement << s
              end
            end
        end
      end
      tree
    end
  end
end