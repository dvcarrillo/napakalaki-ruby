# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Authors: David Vargas, Alicia Vílchez
# ETSIIT, University of Granada

# MAIN FILE
# PruebaNapakalaki.rb

# MODIFICAR!
require './prize.rb'
require './bad_consequence.rb'

################################################################################
# TEST OF THE CRATED CLASSES

# Class Prize
level = 5
treasures = 2

prz = Prize.new(level,treasures)

puts "Test de Prize"
puts prz.level
puts prz.treasures

puts "\nTest de Bad Consequence"

badcon = BadConsequence.new("soy malo", 12, 2, 0, 0, 0, false)

puts badcon.to_s