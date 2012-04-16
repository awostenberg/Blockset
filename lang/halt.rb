module Blockset
  def self.halt(msg, code=1)
    puts msg
    exit code
  end

  def self.halt_wrong_token(tok)
    halt "Unexpected #{tok.type} (value `#{tok.value}')"
  end
end