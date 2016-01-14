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
# CONSULTATIONS OVER THE MONSTERS ARRAY

# Prints the monsters with a level above 10
puts 'Monsters with a level above 10:'
for un_monstruo in monsters
  if (un_monstruo.combat_level > 10)
    puts un_monstruo.name
  end
end
puts "\n"

# Prints the monsters whose bad consequence causes a loss of a num. of levels
puts 'Monsters whose bad consequence causes a loss of levels:'
for un_monstruo in monsters
  this_bad_co = un_monstruo.bc
  
  if (this_bad_co.n_visible_treasures == 0)
    if (this_bad_co.n_hidden_treasures == 0)
      if (this_bad_co.levels > 0)
        puts un_monstruo.name
      end
    end
  end
end
puts "\n"

# Monsters whose prize causes the gain of more that one level
puts 'Monsters whose prize causes the gain of more that 1 level:'
for un_monstruo in monsters
  this_prize = un_monstruo.pz
  
  if (this_prize.level > 1)
    puts un_monstruo.name
  end
end
puts "\n"

# Monsters whose bad consequence causes the loss of certain treasures, whether
# they are visible or hidden
puts 'Monsters whose bad consequencen causes the loss of certain treasures,
whether they are visible or hidden:'
for un_monstruo in monsters
  this_bad_co = un_monstruo.bc
  this_prize = un_monstruo.pz

  if ((this_bad_co.specific_visible_treasures.length > 0) ||
       this_bad_co.specific_hidden_treasures.length > 0)
    puts "Nombre: #{un_monstruo.name}"
    puts "Nivel de combate: #{un_monstruo.combat_level}"
    puts "Buen rollo:"
    puts this_bad_co.to_s
    puts "Mal rollo:"
    puts this_prize.to_s
    puts "\n"
  end
end

