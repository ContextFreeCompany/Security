#SecretBox teste

require_relative 'SecretBox'

senha = "Giovaniferreira" 
var = SecretBox.new :secret => senha, :type => "HAsh", :algorithm => "ShA384"
# puts "deu bom"
# puts var.prepareForSave

var2 = SecretBox.new var.prepareForSave

puts var2.algorithm

puts var2 == "Giovaniferreira"

# puts var2.hash