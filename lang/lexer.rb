require "lexr"

module Blockset
  # Tokenizes strings readable by the parser
  Lexer = Lexr.that {
    ignores /\s+/       => :whitespace
    ignores /--.*/      => :comment     # Comments begin with double-dashes and extend until the end of the line

    # Delimeters
    matches "("         => :beg_delim
    matches "["         => :beg_delim
    matches ")"         => :end_delim
    matches "]"         => :end_delim

    # Now for the keywords (only 1 for now)
    matches "self"      => :keyw

    # Other stuff
    matches /\d*\.\d+/  => :float,      :convert_with => lambda {|v| Float(v)}
    matches /\d+/       => :int,        :convert_with => lambda {|v| Integer(v)}
    matches /"[^"]*"/m  => :str,        :convert_with => lambda {|v| v[1..-2]}
    matches /\$\w+/     => :sym,        :convert_with => lambda {|v| v[1..-1].to_sym}
    matches /\w[\w:]*/  => :m_chunk,    :convert_with => lambda {|v| v.to_sym}
    matches "."         => :special
    matches ";"         => :special
  }
end