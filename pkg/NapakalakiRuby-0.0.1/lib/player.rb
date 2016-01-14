# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Author: David Vargas

# Class that manages the attributes and methods of the players
require_relative 'bad_consequence.rb'
require_relative 'monster.rb'
require_relative 'treasure.rb'
require_relative 'treasure_kind.rb'
require_relative 'dice.rb'

module NapakalakiGame
class Player
  
  # Maximum level a player can reach (constant)
  @@MAX_LEVEL = 10
  
  # These attributes can be readable
  attr_reader :name, :level, :visible_treasures, :hidden_treasures, :dead,
     :can_i_steal
  attr_accessor :pending_bad_consequence, :enemy
 
  
  def initialize (a_name)
    # Parameters of THIS player
    @name = a_name                # Name of the player
    @level = 1              # Current level of the player
    @dead = true               # Indicates if the player is dead
    @can_i_steal = true  # Indicates if the player can steal treasures
                                  # from another one
    
    @enemy = nil                            # Main rival of this player
    @visible_treasures = Array.new   # Array of visible treasures
    @hidden_treasures = Array.new     # Array of hidden treasures
    @pending_bad_consequence = nil       
  end
  # este será el constructor de copia
  def new_player(player)
    @name = player.name           
    @level = player.level
    @dead = player.dead    
    @can_i_steal = player.can_i_steal
    
    @enemy = player.enemy                       
    @visible_treasures = player.visible_treasures
    @hidden_treasures = player.hidden_treasures     
    @pending_bad_consequence = player.pending_bad_consequence 
  end
  ##############################################################################
  
  ##############################################################################
  ## PRIVATE METHODS
  
  private
  
  def bring_to_life()
    @dead = false
  end
  
  def get_combat_level()
    result = @level
    
    for a_treasure in @visible_treasures
      result += a_treasure.bonus
    end
    result
  end
  
  def self.get_max_level
    @@MAX_LEVEL
  end
  
  def increment_levels(i)
    @level = @level + i
  end
  
  def decrement_levels(i)
    @level = @level - i
    if(@level < 1)
      @level = 1
    end
  end
  
  # These SET methods have been defined as "attr_accesor" before, so this is not
  # necessary anymore
  #
  # def set_pending_bad_consequence (a_bad_consequence)
  #   @pending_bad_consequence = a_bad_consequence
  # end
  

  def apply_prize (a_monster)
    levels_up = a_monster.get_levels_gained
    increment_levels(levels_up)
    n_treasures_obtained = a_monster.get_treasures_gained
    
    if(n_treasures_obtained > 0)
      dealer =  CardDealer.instance
      for i in(0..n_treasures_obtained)
        treasure = dealer.next_treasure()
        @hidden_treasures << treasure
      end
    end
  end
  ################################################################################################
  
  ##############################################################################################
  def apply_bad_consequence (a_monster)
    
    bad_consequence = a_monster.bc
    n_levels = bad_consequence.levels
    decrement_levels(n_levels)
    pending_bad = bad_consequence.adjust_to_fit_treasure_lists(@visible_treasures, @hidden_treasures)
    @pending_bad_consequence = pending_bad  
    
  end
  
  def can_make_treasure_visible (t)
    ret = true
    type = t.type
    
    num_both = how_many_visible_treasures(TreasureKind::BOTHHANDS)
    num_one = how_many_visible_treasures(TreasureKind::ONEHAND)

    #SPECIAL CASE 1: t is ONEHAND treasure
    #If there's a BOTHHANDS treasure in visibleTreasures, t won't be able
    #to be added. In another case, the method will check if they are up to
    #2 treasures in visibleTreasures
    if (type == TreasureKind::ONEHAND)
        if ((num_both > 0) || (num_one > 1))
          ret = false
        end

    # SPECIAL CASE 2: t is BOTHHANDS treasure
    # There can't be a BOTHHANDS treasure if there's already a ONEHAND
    # treasure on visibleTreasures
    elsif (type == TreasureKind::BOTHHANDS)
      if ((num_both > 0) || (num_one > 0))
        ret = false
      end

    # OTHER CASES: t won't be able to be added if there's a treasure
    # of the same type in visibleTreasures
    elsif (how_many_visible_treasures(type) > 0)
      ret = false
    end
    ret
  end
  
  def how_many_visible_treasures (tKind)
    contador = 0
    
    for treasure in @visible_treasures
      if (treasure.type == tKind)
        contador = contador + 1
      end
    end
    contador
  end
  
  def die_if_no_treasures ()
    if ((@visible_treasures.empty?) && (@hidden_treasures.empty?))
      @dead = true
    end
  end
   
  # Returns a random treasure and deletes it from hiddenTreasures array.
  # To use when the a player is going to steal a enemy's card
  public
  def give_me_a_treasure ()
    n = rand(@hidden_treasures.size())
    t = @hidden_treasures[n]
    @hidden_treasures.delete(@hidden_treasures[n])
    return t
  end
  
  public
  def can_you_give_me_a_treasure ()
    result = !(@hidden_treasures.empty?)
    result
  end
  
  def have_stolen ()
    @can_i_steal = false
  end
  
  public
  
  # You are able to read 'dead' directly, as it is an attr_reader!
  def is_dead ()
    @dead
  end
  
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
    my_level = get_combat_level()
    monster_level = get_oponent_level(m)
    
    if (my_level > monster_level)
      apply_prize (m)
      if(@level > @@MAX_LEVEL)
        combat_result = CombatResult::WINGAME
      else
         combat_result = CombatResult::WIN
      end
    else
      apply_bad_consequence (m)
      combat_result = CombatResult::LOSE
      
      if(should_convert)
        combat_result = CombatResult::LOSEANDCONVERT
      end
    end
    combat_result
  end
  
  def make_treasure_visible (t)
    can_i = can_make_treasure_visible (t)
    if can_i
      @visible_treasures << t
      @hidden_treasures.delete(t)
    end
  end                                    
  
  def discard_visible_treasure (t)
    @visible_treasures.delete(t)
    if(@pending_bad_consequence != nil)
      @pending_bad_consequence.substract_visible_treasure(t)
    end
    die_if_no_treasures()
  end
  
  def discard_hidden_treasure (t)
    @hidden_treasures.delete(t)
    if(@pending_bad_consequence != nil)
      @pending_bad_consequence.substract_hidden_treasure(t)
    end
    die_if_no_treasures()
  end
  
  def valid_state ()
    result = false
    if ((@hidden_treasures.size <= 4) && (@pending_bad_consequence == nil || @pending_bad_consequence.is_empty))
    #if ((@hidden_treasures.size <= 4) && @pending_bad_consequence == nil )
      result = true
    end
    result
  end
  
  def init_treasures ()
    dealer = CardDealer.instance  # an object of card_dealer
    dice = Dice.instance # an object of Dice class
    bring_to_life()
    treasure = dealer.next_treasure() #an object of treasure class
    @hidden_treasures << treasure  # add this object to array @hidden_treasures
    number = dice.next_number() # a random number
   
    if number > 1
      treasure = dealer.next_treasure()
      @hidden_treasures << treasure
    end
    
    if number == 6
      treasure = dealer.next_treasure()
      @hidden_treasures << treasure
    end   
  end
  
 
  def steal_treasure () 
    can_i = @can_i_steal
    treasure = nil
    if can_i
      can_you = @enemy.can_you_give_me_a_treasure()
      if can_you
        treasure = @enemy.give_me_a_treasure()
        @hidden_treasures << treasure
        have_stolen()
      end
    end
    treasure
  end
  
  #################################################################################################
  
  ###################################################################################################
  
  def set_enemy (enemy_player)
    @enemy = enemy_player
  end
  
  def discard_all_treasures ()
    i = 0
    while(i < @visible_treasures.size)
      treasure = @visible_treasures[i]
      discard_visible_treasure (treasure)
      i = i+1
    end
  
    j = 0
    while(j <  @hidden_treasures.length)
      treasure = @hidden_treasures[j]
      discard_hidden_treasure(treasure)
      j = j +1
    end
  end
  
  #############################################################################
  public
  def get_oponent_level(m)
    lv = m.combat_level
    lv
  end
  
  
  def should_convert 
    dice = Dice.instance
    n = dice.next_number
    convert = false
    
    if(n == 1)
      convert = true
    end
    convert
  end
  #############################################################################
   # Method that returns a string with the state of the current object
  
  def to_s
    respuesta = "#{@name}\nNivel de combate: #{get_combat_level()}" 
    respuesta += " (#{ @level})"
    respuesta += "\nEnemigo: #{@enemy.name}"
    
    if (@dead == true)
      respuesta += "\nEstas muerto"
    end
    
    if(@pending_bad_consequence != nil && !@pending_bad_consequence.is_empty)
      respuesta += "\nMal rollo pendiente:\n"
      respuesta += @pending_bad_consequence.to_s
    end
    return respuesta
  end
  
  protected
  def get_enemy
    return @enemy
  end
  
end
end
