module Blockset
  def self.halt(msg, code=1)
    puts msg
    exit code
  end
end