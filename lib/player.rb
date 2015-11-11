# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Author: David Vargas

# Class that manages the attributes and methods of the players

class Player
  
  # Maximum level a player can reach (constant)
  MAX_LEVEL = 10
  
  # These attributes can be readable
  attr_reader :name, :level, :visible_treasures, :hidden_treasures, :dead,
    :hidden_treasures, :visible_treasures
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
    dead = true
  end
  
  def get_combat_level()
    bonus = 0
    for tesoro in visible_treasures
      bonus = bonus + tesoro.bonus
    end
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
    
    delete_specific_visible = false
    delete_specific_hidden = false
    
    if (a_monster.bc.specific_visible_treasures.empty? == true)
       delete_specific_visible = true
    end
    
    if (a_monster.bc.specific_hidden_treasures.empty? == true)
      delete_specific_hidden = true
    end
    
    # Reduce player's level
    levels_down = a_monster.bc.levels
    @level -= levels_down
    
    # Check visible treasures on monster's bad consequence
    case delete_specific_visible
    when true
      specific_visible_lost = a_monster.bc.specific_visible_treasures
      # ELIMINAR ELEMENTOS ESPECIFICOS DEL VECTOR
    when false
      visible_treasures_lost = a_monster.bc.n_visible_treasures
      # ELIMINAR "visible_treasures_lost" ELEMENTOS DEL VECTOR
    end
    
    case delete_specific_hidden
    when true
      specific_hidden_lost = a_monster.bc.specific_hidden_treasures
      # ELIMINAR ELEMENTOS ESPECIFICOS DEL VECTOR
    when false
      hidden_treasures_lost = a_monster.bc.n_hidden_treasures
      # ELIMINAR "hidden_treasures_lost" DEL VECTOR
    end
    
  end
  
  def can_make_treasure_visible (t)
    # ...
  end
  
  def how_many_visible_treasures (tKind)
    contador = 0
    
    for treasure in @visible_treasures
      if treasure.type == tKind
        contador = contador + 1
      end
    end
    
    # (devolver) contador ??
  end
  
  def die_if_no_treasures ()
    if (visibleTreasures.empty? && hiddenTreasures.empty?)
      dead = true
    end
  end
  
  def give_me_a_treasure ()
    # ...
  end
  
  def can_you_give_me_a_treasure ()
      result = false
      if !(hiddenTreasures.empty?)
        result = true
      end
  end
  
  def have_stolen ()
    @can_i_still = false
  end
  
  public
  
  # You are able to read 'dead' directly, as it is an attr_reader!
  # 
  # def is_dead ()
  #   # ...
  # end
  
  # You are able to read 'hidden_treasures' directly, as it is an attr_reader!
  # 
  # def get_hidden_treasures ()
  #   # ...
  # end
  
  # You are able to read 'visible_treasures' directly, as it is an attr_reader!
  # 
  # def get_visible_treasures ()
  #   # ...
  # end
  
  # m: object of Monster
  def combat (m)
    # ...
  end
  
  def make_treasure_visible (t)
    # ...
  end
  
  def discard_visible_treasure (t)
    # ...
  end
  
  def discard_hidden_treasure (t)
    # ...
  end
  
  def valid_state ()
    return( hiddenTreasures.size() > 4 &&  pendingBadConsequence.is_empty());
  end
  
  def init_treasures ()
    # ...
  end
  
  # You are able to read 'levels' directly, as it is an attr_reader!
  # 
  def get_levels ()
    @level
  end
  
  def steal_treasure ()
    # ...
  end
  
  def set_enemy (enemy_player)
    @enemy = enemy_player
  end
  
 # def can_i_steal ()
  # 
 # end
  
  def discard_all_treasures ()
    # ...
  end
  
end
