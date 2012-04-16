PRJ_ROOT = File.expand_path(File.dirname(__FILE__))
["", "/lang"].each {|pth| $LOAD_PATH << (PRJ_ROOT + pth)}
require "lang/bks_object"
require "lang/lexer"
require "lang/parser"
f = File.read("tests/syntax.test")
Blockset::Parser.new
#func = BKS_NAMESPACE::Lambda.new [[{:val => BKS_NAMESPACE::Object.new}, {:val => :"printLine:", :args => [[{:val => "Hello world"}]]}]]
#Blockset::TreeEvaluator.new.eval [
#  [{:val => func}, {:val => :"call", :args => []}]
#]
