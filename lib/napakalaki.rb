# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Author: David Vargas

require 'singleton'

# Class that manages the correct development of the game

# This class is a singleton: it means that there can only be one instance
# To use this instance in another class: example = Napakalaki.instance

class Napakalaki
  
  # To make this class a singleton
  include Singleton
  
  def initialize
    @current_player  # Stores the person who is currently playing
    @players         # Stores the total of the players playing the game
    @current_monster # Monster which is currently fighting against the player
    @dealer          # Object of CardDealer singleton class
  end
  
  ##############################################################################
  ## PRIVATE METHODS
  
  private
  def self.napakalaki()
    # ...
  end
  
  def self.init_players(names)
    # ...
  end
  
  def self.next_player()
    # ...
  end
  
  def self.next_turn_allowed()
    # ...
  end
  
  def self.set_enemies()
    # ...
  end
  
  ##############################################################################
  ## PUBLIC METHODS
  
  public
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
