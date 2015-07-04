#teste bcrypt

require_relative 'BcryptHash'

c = BcryptHash.new "GiovaniFerreira"

puts c.hash

var = BcryptHash.new c.hash

puts var.hash

puts var == "GiovaniFerreira"
