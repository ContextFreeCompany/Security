#Teste hashControl
require_relative 'hashControl'

var = HashControl.new :secret => "Giovani Ferreira", :algorithm => "SHA256"

# var2 = HashControl.new :secret => var.hash

# puts var == "Giovani Ferreira"
puts var.algorithmInstance
puts var.prepareForSave