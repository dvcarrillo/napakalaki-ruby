# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Author: David Vargas Alicia Vílchez
require_relative 'bad_consequence.rb'
require_relative 'prize.rb'
# This class manages the cards of type Monster and its attributes
module NapakalakiGame
class Monster
  
  # This type of declaration includes the methods of consulting the value of 
  # these variables
  attr_reader :name           # Name of the monster
  attr_reader :combat_level   # Level of the monster in combat
  
  attr_reader :bc             # Bad Consequence (object) linked with the monster
  attr_reader :pz             # Prize (object) linked with the monster
  attr_reader :level_change_against_cultist_player
  ##############################################################################
  # INITIALIZE METHOD
  def initialize(a_name, com_lvl, badco, prz, lc =0)
    @name = a_name
    @combat_level = com_lvl
    @bc = badco
    @pz = prz
    @level_change_against_cultist_player = lc
  end
  
  #nuevo constructor
  #def self.new_monster(n, l, bad_consequence, p, lc)
  #  @name = n
  #  @combat_level = l
  #  @bc = bad_consequence
  #  @pz = p
  #  @level_change_against_cultist_player = lc
  #end
  
  def get_levels_gained
     @pz.level
  end

  def get_treasures_gained
    @pz.treasures
  end
  
  def get_combat_level_against_cultist_player
    return @combat_level + @level_change_against_cultist_player
  end
  # Method that returns a string with the state of the current object
  
  def to_s
    respuesta = "Nombre: #{@name}\nNivel de combate: #{@combat_level}\n" 
    respuesta += "\nBAD CONSEQUENCE:\n#{bc.to_s}"
    respuesta += "\n\nPRIZE:\n#{pz.to_s}"
    respuesta += "\n\ncambio de nivel contra un jugador cultist: #{@level_change_against_cultist_player}"
    
  end
  
end
end