# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Author: David Vargas Alicia Vílchez

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
    for a_name in names
      a_player = Player.new(a_name)
      @players << a_player
    end
  end
 
  
  def self.next_player 
        
        if (@current_player.nil?)
        
          r = rand(@players.size())
          pos_to_return = r
       
        
        else
        
          found = false;
          count = 0;
            
          while ((found == false) || (count < @players.size()))
            
            Player a_player = @players[count]
                
            if (a_player == @current_player)
              found = true;
            else
              count = count + 1;
            end
          end
          pos_to_return = count +1
        end    
  end
  
  def self.next_turn_is_allowed()
    next_turn_is_allowed = @current_player.valid_state()
  end
  
  def self.set_enemies()
   enemies = @players
   
    for i in(0..@players.size())
      
       n = rand(@players.size())
      while n == i
         n = rand(@players.size())
      end
      @players.get(i).set_enemy(enemies.get(n))  
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
    @current_player 
  end
  
  def get_current_monster()
    @current_monster
  end
  
  def next_turn()
    # ...
  end
  
  def end_of_game(result)
    end_of_game = false
    if (result == [CombatResult:: WINGAME] )
      end_of_game = true
    end
  end
  
end
