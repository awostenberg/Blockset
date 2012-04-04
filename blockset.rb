PRJ_ROOT = File.expand_path(File.dirname(__FILE__))
["", "/lang"].each {|pth| $LOAD_PATH << (PRJ_ROOT + pth)}
require "lang/evaluator"
require "lang/bks_object"
Blockset::TreeEvaluator.new.eval [
  [{:val => BKS_NAMESPACE::Object.new}, {:val => :"printLine:", :args => [[{:val => "Hello world from inside a Blockset parse tree!"}]]}]
]
