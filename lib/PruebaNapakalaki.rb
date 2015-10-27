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
require './monster.rb'
require './treasure_kind.rb'


################################################################################
# TEST OF THE CRATED CLASSES

# Class Prize
#level = 5
#treasures = 2

#prz = Prize.new(level,treasures)

#puts "Test de Prize"
#puts prz.level
#puts prz.treasures

#puts "\nTest de Bad Consequence"

#badcon = BadConsequence.new("soy malo", 12, 2, 0, 0, 0, false)

#puts badcon.to_s

#puts "\nTest de Monster: "
#monstruo = Monster.new("H.D.P", 3, badcon, prz)
#puts monstruo.to_s

###############################################################################
#Creación de los mosntruos:

monsters = Array.new

#Byakhees de bonanza
prize = Prize.new(2, 1)
bad_consequence = BadConsequence.new_level_specific_treasures('Pierdes tu armadura
visible y otra oculta', 0, [TreasureKind::ARMOR], [TreasureKind::ARMOR] )
monsters << Monster.new('Byakhees de bonanza', 8, bad_consequence, prize)

#Chibithulhu
prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_level_specific_treasures('Embobados con el
  lindo primigenio te descartas de tu casco visible', 0, [TreasureKind::HELMET], 
  Array.new )
monsters << Monster.new('Byakhees de bonanza', 2, bad_consequence, prize)

#El sopor de Dunwich
prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_level_specific_treasures('El primordial 
  bostezo contagioso. Pierdes el calzado visible', 0, [TreasureKind::SHOES], 
  Array.new )
monsters << Monster.new('Chibithulhu', 2, bad_consequence, prize)

#Angeles de la noche ibicenca
prize = Prize.new(4, 1)
bad_consequence = BadConsequence.new_level_specific_treasures('Te atrapan para 
  llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible
  y 1 mano oculta', 0,  [TreasureKind::ONEHAND], [TreasureKind::ONEHAND] )
monsters << Monster.new('Angeles de la noche ibicenca', 14, bad_consequence,
  prize)

#El gorron en el umbral
prize = Prize.new(3, 1)
bad_consequence = BadConsequence.new_level_number_of_treasures('Pierdes todos 
  tus tesoros visibles', 0, 20, 0)
monsters << Monster.new('El gorron en el umbral', 10, bad_consequence, prize)

#H.P.Munchcraft
prize = Prize.new(2, 1)
bad_consequence = BadConsequence.new_level_specific_treasures('Pierdes la 
  armadura visible', 0, [TreasureKind::ARMOR], Array.new)
monsters << Monster.new('H.P.Munchcraft', 6, bad_consequence, prize )

#Bichgooth
prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_level_specific_treasures('Sientes bichos 
  bajo la ropa. Descarta la armadura visible', 0, [TreasureKind::ARMOR], 
  Array.new)
monsters << Monster.new('Bichgooth', 2, bad_consequence, prize)

#El rey de rosa
prize = Prize.new(4, 2)
bad_consequence = BadConsequence.new_level_number_of_treasures('Pierdes 5 
  niveles y 3 tesoros visibles', 5, 3, 0)
monsters << Monster.new('El rey de rosa', 13, bad_consequence, prize)

#La que redacta en las tinieblas
prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_level_number_of_treasures('Toses los 
  pulmones y pierdes 2 niveles.', 2, 0, 0)
monsters << Monster.new('La que redacta en las tinieblas', 2, bad_consequence, 
  prize)


################################################################################
