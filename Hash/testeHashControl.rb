#Teste hashControl
require_relative 'hashControl'

var = HashControl.new :secret => "Giovani Ferreira", :algorithm => "Md5"

# var2 = HashControl.new :secret => var.hash

# puts var == "Giovani Ferreira"
puts var.algorithmInstance
var2 = HashControl.new var.prepareForSave

puts var2 == "Giovani Ferreira"