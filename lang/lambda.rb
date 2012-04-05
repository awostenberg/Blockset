require "evaluator"
require "bks_object_mixin"

module BKS_NAMESPACE
  class Lambda
    include Blockset::BKSObject

    def initialize(ptree)
      super()
      @ptree = ptree
      @methods[:"call"] = lambda {call}
    end

    def call
      Blockset::TreeEvaluator.new.eval(@ptree)
    end

    #def bks_send(name, *args)
    #
    #end
  end
end