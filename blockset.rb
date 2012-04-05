PRJ_ROOT = File.expand_path(File.dirname(__FILE__))
["", "/lang"].each {|pth| $LOAD_PATH << (PRJ_ROOT + pth)}
require "lang/evaluator"
require "lang/bks_object"
require "lang/lambda"
func = BKS_NAMESPACE::Lambda.new [[{:val => BKS_NAMESPACE::Object.new}, {:val => :"printLine:", :args => [[{:val => "Hello world"}]]}]]
Blockset::TreeEvaluator.new.eval [
  [{:val => func}, {:val => :"call", :args => []}]
]
