require "lexr"

module Blockset
  Lexer = Lexr.that {
    ignores /\s+/       => :whitespace
    ignores /--.*/      => :comment     # Comments begin with double-dashes and extend until the end of the line
    matches "("         => :beg_paren
    matches ")"         => :end_paren
    matches /\d*\.\d+/  => :float,      :convert_with => lambda {|v| Float(v)}
    matches /\d+/       => :int,        :convert_with => lambda {|v| Integer(v)}
    matches /"[^"]*"/m  => :str,        :convert_with => lambda {|v| v[1..-2]}
    matches /\$\w+/      => :sym,       :convert_with => lambda {|v| v[1..-1].to_sym}
    matches /\w[\w:]*/  => :m_chunk,    :convert_with => lambda {|v| v.to_sym}
    matches "."         => :op_send_m
    matches ";"         => :expr_end
  }
end