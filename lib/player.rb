# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Author: David Vargas

# Class that manages the attributes and methods of the players

class Player
  
  # Maximum level a player can reach
  MAX_LEVEL = 10
  
  # These attributes can be readable
  attr_reader :name, :level, :visible_treasures, :hidden_treasures
  attr_accessor :pending_bad_consequence, :enemy
  
  def initialize (a_name, a_level, is_dead, able_to_steal, his_enemy,
    some_visible_treasures, some_hidden_treasures, a_bc)
    # Parameters of THIS player
    @name = a_name                # Name of the player
    @level = a_level              # Current level of the player
    @dead = is_dead               # Indicates if the player is dead
    @can_i_steal = able_to_steal  # Indicates if the player can steal treasures
                                  # from another one
    
    @enemy = his_enemy                            # Main rival of this player
    @visible_treasures = some_visible_treasures   # Array of visible treasures
    @hidden_treasures = some_hidden_treasures     # Array of hidden treasures
    @pending_bad_consequence = a_bc               # Object of BadConsequence
  end
  
  ##############################################################################
  ## CONSTRUCTOR with an only argument
  
  def self.player (a_name)
    new(a_name, 0, true, true, 0, Array.new, Array.new, 0)
  end
  
  ##############################################################################
  ## PRIVATE METHODS
  
  private
  
  def bring_to_life()
    # ...
  end
  
  def get_combat_level()
    # ...
  end
  
  def increment_levels(i)
    @level = @level + i
  end
  
  def decrement_levels(i)
    @level = @level - i
  end
  
  # These SET methods have been defined as "attr_accesor" before, so this is not
  # necessary anymore
  #
  # def set_pending_bad_consequence (a_bad_consequence)
  #   @pending_bad_consequence = a_bad_consequence
  # end
  
  # REVISAR
  def apply_prize (a_monster)
    levels_up = a_monster.pz.level
    treasures_obtained = a_monster.pz.treasures
    @level += levels_up
    @hidden_treasures << treasures_obtained
  end
  
  # REVISAR
  def apply_bad_consequence (a_monster)
    
    ############################################################################
    # ATENCION!
    # Hay dos métodos para borrar: borrar elementos específicos o borrar
    # elementos concretos. Si los arrays spsecific de bad consequence están
    # vacíos, aplicar el primer método. En otro caso, aplicar el segundo
    #
    
    levels_down = a_monster.bc.levels
    visible_treasures_lost = a_monster.bc.n_visible_treasures
    hidden_treasures_lost = a_monster.bc.n_hidden_treasures
    specific_visible_lost = a_monster.bc.specific_visible_treasures
    specific_hidden_lost = a_monster.bc.specific_hidden_treasures
    
    @level -= levels_down
    
    # For visible treasures
    for a_treasure in specific_visible_lost
      for other_treasure in @visible_treasures
        if (a_treasure == other_treasure)
          other_treasure = nil
        end
      end
    end
    
  end
  
  public
  
  
end
