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
  
  attr_reader :current_player, :current_monster
  
  def initialize
    @players = Array.new  # Stores the total of the players playing the game
    @current_player       # Stores the person who is currently playing
    @current_monster      # Monster which is currently fighting
    @dealer               # Object of CardDealer singleton class
  end
  
  ##############################################################################
  ## PRIVATE METHODS
  
  private
  def self.napakalaki()
    # ...
  end
  
  # Initializes the 'players' array, adding as many players as they are
  # on the 'names' string, which contains the names of the players
  
  def self.init_players(names)
    for a_name in names
      a_player = Player.new(a_name)
      @players << a_player
    end
  end
  
  # Decides who is the next player to play.
  # First, it calculates the index of the next player in the array of players
  # Then, if this is the first move, it generates a random number between
  # 0 and the number of players minus 1
  
  def self.next_player()
    if (@current_player.nil?)
      r = rand(@players.size())
      pos_to_return = r
      
    else
      found = false;
      count = 0;

      while ((found == false) || (count < @players.size()))
        a_player = @players[count]

        if (a_player == @current_player)
          found = true;
          
        else
          count = count + 1;
        end
      end
      
      pos_to_return = count+1
    end    
  end
  
  def self.next_turn_allowed()
    @current_player.valid_state()
  end
  
  # Assignation of enemies between the players. This method has been made to
  # use with n players
  
  def self.set_enemies()
    
    # Assigns a random position of the list to the enemy attribute of 
    # another player
    for i in(0..@players.size())
      n = rand(@players.size())
      
      while (i == n)
         n = rand(@players.size())
      end
      
      @players[i].set_enemy(@players.get[n])
    end
    
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
  
  # Returns 'true' if the result paratemer is WINGAME
  
  def end_of_game()
    end_of_game = false
    if (result == [CombatResult::WINGAME])
      end_of_game = true
    end
  end
  
end
