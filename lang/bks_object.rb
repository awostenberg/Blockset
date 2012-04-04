require 'halt'

module BKS_NAMESPACE
  RBObject = Object
  Object = Class.new(BasicObject) {
    def initialize
      @methods = {
          :"printLine:" => Kernel.lambda {|str| Kernel.print "#{str}\n"},
          :foo => Kernel.lambda {Kernel.puts "Yay!"; self},
          :bar => Kernel.lambda {Kernel.puts "Hooray!"}
      }
    end

    def class
      # Obtain the singleton class and ask it for its superclass
      (class << self; self; end).superclass.to_s.split("::").last
    end

    def bks_send(name, *args)
      bks_method_missing(name, *args) unless @methods.include?(name)
      @methods[name].call(*args)
    end

    def bks_method_missing(name, *args)
      Blockset.halt "No method `#{name}' defined for #{self}"
    end

    def inspect
      "$$(#{self.class})"
    end

    alias to_s inspect
  }
end