module Blockset
  module BKSObject
    def initialize
      @methods = {
          :"printLine:" => Kernel.lambda {|str| Kernel.print "#{str}\n"},
          :foo => Kernel.lambda {Kernel.puts "Yay!"; self},
          :bar => Kernel.lambda {Kernel.puts "Hooray!"; self}
      }
    end

    def bks_send(name, *args)
      bks_method_missing(name, *args) unless @methods.include?(name)
      @methods[name].call(*args)
    end

    def bks_method_missing(name, *args)
      Blockset.halt "No method `#{name}' defined for #{self}"
    end
  end
end