# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Authors: David Vargas, Alicia Vílchez
# ETSIIT, University of Granada

# MAIN FILE
# PruebaNapakalaki.rb

# MODIFICAR!
require './prize.rb'

################################################################################
# TEST OF THE CRATED CLASSES

# Class Prize
level = 5
treasures = 2

prz = Prize.new(level,treasures)

puts "Test de Prize"
puts prz.level
puts prz.treasures