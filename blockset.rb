PRJ_ROOT = File.expand_path(File.dirname(__FILE__))
["", "/lang"].each {|pth| $LOAD_PATH << (PRJ_ROOT + pth)}
require "lang/bks_object"
require "lang/parser"
#puts File.read("hello.bks")
f = File.read("tests/syntax.test")
print Blockset::Parser.new.parse(f)
#func = BKS_NAMESPACE::Lambda.new [[{:val => BKS_NAMESPACE::Object.new}, {:val => :"printLine:", :args => [[{:val => "Hello world"}]]}]]
#Blockset::TreeEvaluator.new.eval [
#  [{:val => func}, {:val => :"call", :args => []}]
#]
