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
# TESTS OF THE CREATED CLASSES

# Class Prize
# level = 5
# treasures = 2

# prz = Prize.new(level,treasures)

# puts "Test de Prize"
# puts prz.level
# puts prz.treasures

# Class Bad Consequence
# puts "\nTest de Bad Consequence"

# badcon = BadConsequence.new("soy malo", 12, 2, 0, 0, 0, false)

# puts badcon.to_s

################################################################################
# DEFINITION OF THE MONSTERS

# Array which will store the monsters
monsters = Array.new

# 3 BYAKHEES DE BONANZA
prize = Prize.new(2, 1)
bad_consequence = BadConsequence.new_level_specific_treasures('Pierdes tu
armadura visible y otra oculta',0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
monsters << Monster.new('3 Byakhees de bonanza', 8, bad_consequence, prize)

# CHIBITHULHU
prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_level_specific_treasures('Embobados con el
lindo primigenio te descartas de tu casco visible', 0, [TreasureKind::HELMET], 
Array.new )
monsters << Monster.new('Chibithulhu', 2, bad_consequence, prize)

# EL SOPOR DE DUNWICH
prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_level_specific_treasures('El primordial 
bostezo contagioso. Pierdes el calzado visible', 0, [TreasureKind::SHOES], 
Array.new)
monsters << Monster.new('Chibithulhu', 2, bad_consequence, prize)

# ÁNGELES DE LA NOCHE IBICENCA
prize = Prize.new(4, 1)
bad_consequence = BadConsequence.new_level_specific_treasures('Te atrapan para 
llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible
y 1 mano oculta', 0,  [TreasureKind::ONEHAND], [TreasureKind::ONEHAND] )
monsters << Monster.new('Angeles de la noche ibicenca', 14, bad_consequence,
prize)

# EL GORRÓN EN EL UMBRAL
prize = Prize.new(3, 1)
bad_consequence = BadConsequence.new_level_number_of_treasures('Pierdes todos 
tus tesoros visibles', 0, 20, 0)
monsters << Monster.new('El gorron en el umbral', 10, bad_consequence, prize)

# H.P. MUNCHCRAFT
prize = Prize.new(2, 1)
bad_consequence = BadConsequence.new_level_specific_treasures('Pierdes la 
armadura visible', 0, [TreasureKind::ARMOR], Array.new)
monsters << Monster.new('H.P.Munchcraft', 6, bad_consequence, prize)

# BICHGOOTH
prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_level_specific_treasures('Sientes bichos 
bajo la ropa. Descarta la armadura visible',0, [TreasureKind::ARMOR], Array.new)
monsters << Monster.new('Bichgooth', 2, bad_consequence, prize)

# EL REY DE ROSA
prize = Prize.new(4, 2)
bad_consequence = BadConsequence.new_level_number_of_treasures('Pierdes 5 
niveles y 3 tesoros visibles', 5, 3, 0)
monsters << Monster.new('El rey de rosa', 13, bad_consequence, prize)

# LA QUE REDACTA EN LAS TINIEBLAS
prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_level_number_of_treasures('Toses los 
pulmones y pierdes 2 niveles.', 2, 0, 0)
monsters << Monster.new('La que redacta en las tinieblas', 2, bad_consequence,
prize)

# LOS HONDOS
prize = Prize.new(2, 1)
bad_consequence = 
BadConsequence.new_death('Estos monstruos resultan bastante superficiales y te
aburren mortalmente. Estas muerto')
monsters << Monster.new('Los hondos', 8, bad_consequence, prize)

# SEMILLAS CTHULHU
prize = Prize.new(2, 1)
bad_consequence = 
BadConsequence.new_level_number_of_treasures('Pierdes 2 niveles y 2 tesoros
ocultos', 2, 0, 2)
monsters << Monster.new('Semillas Cthulhu', 4, bad_consequence, prize)

# DAMEARGO
prize = Prize.new(2, 1)
bad_consequence =
BadConsequence.new_level_specific_treasures('Te intentas escaquear. Pierdes
una mano visible', 0, [TreasureKind::ONEHAND], Array.new)
monsters << Monster.new('Dameargo', 1, bad_consequence, prize)

# POLLIPÓLIPO VOLANTE
prize = Prize.new(1, 1)
bad_consequence =
BadConsequence.new_level_number_of_treasures('Da mucho asquito. Pierdes 3
niveles', 3, 0, 0)
monsters << Monster.new('Pollipolipo volante', 3, bad_consequence, prize)

# YSKHTIHYSSG-GOTH
prize = Prize.new(3, 1)
bad_consequence = 
BadConsequence.new_death('No le hace gracia que pronuncien mal su nombre.
Estas muerto')
monsters << Monster.new('Yskhtihyssg-Goth', 12, bad_consequence, prize)

# FAMILIA FELIZ
prize = Prize.new(4, 1)
bad_consequence = 
BadConsequence.new_death('La familia te atrapa. Estas muerto')
monsters << Monster.new('Familia feliz', 1, bad_consequence, prize)

# ROBOGGOTH
prize = Prize.new(2, 1)
bad_consequence = 
BadConsequence.new_level_specific_treasures('La quinta directiva primaria te 
obliga a perder 2 niveles y un tesoro 2 manos visible', 2,
[TreasureKind::BOTHHANDS], Array.new)
monsters << Monster.new('Roboggoth', 8, bad_consequence, prize)

# EL ESPIA
prize = Prize.new(1, 1)
bad_consequence =
BadConsequence.new_level_specific_treasures('Te asusta en la noche. Pierdes
un casco visible', 0, [TreasureKind::HELMET], Array.new)
monsters << Monster.new('El espia', 5, bad_consequence, prize)

# EL LENGUAS
prize = Prize.new(1, 1)
bad_consequence = 
BadConsequence.new_level_number_of_treasures('Menudo susto te llevas. Pierdes 2
niveles y 5 tesoros visibles', 2, 5, 0)
monsters << Monster.new('El Lenguas', 20, bad_consequence, prize)

# BICÉFALO
prize = Prize.new(1, 1)
bad_consequence =
BadConsequence.new_level_specific_treasures('Te faltan manos para tanta cabeza',
3, [TreasureKind::ONEHAND,TreasureKind::ONEHAND,TreasureKind::BOTHHANDS], 
Array.new)
monsters << Monster.new('Bicefalo', 20, bad_consequence, prize)

#---------- TEST ------------#
puts monsters[9].bc.to_s
