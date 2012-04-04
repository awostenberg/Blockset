require 'halt'

# I might implement my own object system instead of using Ruby's, sometime
module Blockset
  class TreeEvaluator
    def eval(tree)
      results = []
      # Trees are arrays of expressions.
      tree.each {|exp| results << eval_expression(exp)}
      results.last
    end

    def eval_expression(exp)
      # Statements are arrays of hashes containing information
      # about what it does. The first hash has to represent an
      # object literal or a variable, and each element after
      # that object is applied to the object that results in
      # the previous element.
      # For example:
      # [{:val => 42}, {:val => :foo}, {:val => :bar}]
      # Say 42 has the method :foo that returns "This is a string",
      # and String has an instance method defined called :bar.
      # First :foo is called on 42, then :bar is called on the
      # resulting object, which is "This is a string". That's
      # how chaining works here.
      last = exp.last
      #puts "#{exp.size}:  #{exp}"
      return last[:val] if exp.size < 2
      eval_expression(exp[0..-2]).bks_send(last[:val], *eval(last[:args]))
    end
  end
end