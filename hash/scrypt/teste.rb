#Teste da classe SCrypt

# require 'scrypt'

require_relative 'ScryptHash'

c = ScryptHash.new "GiovaniFerreira"

var = ScryptHash.new c.hash

puts var.hash

puts var == ("GiovaniFerreira")
# puts SCrypt::Password.create("Giovani")