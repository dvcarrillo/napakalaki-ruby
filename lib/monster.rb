# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Author: David Vargas

# This class manages the cards of type Monster and its attributes

class Monster
  
  # This type of declaration includes the methods of consulting the value of 
  # these variables
  attr_reader :name           # Name of the monster
  attr_reader :combat_level   # Level of the monster in combat
  
  attr_reader :bc             # Bad Consequence (object) linked with the monster
  attr_reader :pz             # Prize (object) linked with the monster
  
  ##############################################################################
  # INITIALIZE METHOD
  
  def initialize(nm, com_lvl, badco, prz)
    @name = nm
    @combat_level = com_lvl
    @bc = badco
    @pz = prz
  end
  
end
