module Blockset
  def self.halt(msg, code=1)
    puts msg
    exit code
  end

  def halt_wrong_token(tok)
    puts "Unexpected #{tok.type} (value `#{tok.value}')"
  end
end