# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'singleton'

# Class that manages the correct development of the game

# This class is a singleton: it means that there can only be one instance
# To use this instance in another class: example = Napakalaki.instance

class Napakalaki
  
  # To make this class a singleton
  include Singleton
  
  def initialize
    # NO VARIABLE DEFINED (YET?)
  end
  
  ##############################################################################
  ## PRIVATE METHODS
  
  private
  def napakalaki()
    # ...
  end
  
  def init_players(names)
    # ...
  end
  
  def next_player()
    # ...
  end
  
  def next_turn_allowed()
    # ...
  end
  
  def set_enemies()
    # ...
  end
  
  ##############################################################################
  ## PUBLIC METHODS
  
  public
  # ES NECESARIO INCLUIR GETINSTANCE??
  # def get_instance()
  # 
  # end
  
  def develop_combat()
    # ...
  end
  
  def discard_visible_treasures(treasures)
    # ...
  end
  
  def make_treasures_visible (treasures)
    # ...
  end
  
  def init_game (players)
    # ...
  end
  
  def get_current_player()
    # ...
  end
  
  def get_current_monster()
    # ...
  end
  
  def next_turn()
    # ...
  end
  
  def end_of_game()
    # ...
  end
  
end
