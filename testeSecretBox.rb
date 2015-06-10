#SecretBox teste

require_relative 'SecretBox'

#O erro é que na segunda vez que ele passa pelo construtor da classe SHA
#Ele aplica o sha no HASH + SALT
#Preciso que ele reconheça que é um hash e não aplique de novo o sha
#Mas é necessário que ele aplique caso o texto nao seja um hash

senha = "Giovaniferreira" 
var = SecretBox.new :secret => senha, :type => "HAsh", :algorithm => "ShA256"
# puts "deu bom"
# puts var.prepareForSave

var2 = SecretBox.new var.prepareForSave

puts var2 == "Giovaniferreira"

# puts var2.hash