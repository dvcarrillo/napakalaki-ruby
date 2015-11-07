# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Author: David Vargas

require 'singleton'

# This class is a singleton: it means that there can only be one instance
# To use this instance in another class: example = CardDealer.instance

class CardDealer
  
  # To make this class a singleton
  include Singleton
  
  def initialize
    # Arrays for the treasures (used and unused)
    @used_treasures
    @unused_tresures
    
    # Arrays for the monsters (used and unused)
    @used_monsters    
    @unused_monsters
  end
  
  ##############################################################################
  ## PRIVATE METHODS
  
  private
  def self.card_dealer()
    # ...
  end
  
  def self.init_treasure_card_deck()
    # ...
  end
  
  def self.init_monsters()
    # ...
  end
  
  def self.shuffle_treasures()
    unused_treasures.shuffle!
  end
  
  def self.shuffle_monsters()
    unused_monsters.shuffle!
  end
  
  ##############################################################################
  ## PUBLIC METHODS
  
  public
  def next_treasure()
    # ...
  end
  
  def next_monster()
    # ...
  end
  
  def give_treasure_back(trs)
    # ...
  end
  
  def give_monster_back (mns)
    # ...
  end
  
  def init_cards()
    # ...
  end
    
end
