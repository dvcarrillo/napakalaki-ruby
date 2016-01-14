# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Author: David Vargas

require 'singleton'
require_relative 'combat_result.rb'
require_relative 'card_dealer.rb'
require_relative 'player.rb'
require_relative 'bad_consequence.rb'
require_relative 'prize.rb'
require_relative 'dice.rb'
require_relative 'cultist_player.rb'
# Class that manages the correct development of the game

# This class is a singleton: it means that there can only be one instance
# To use this instance in another class: example = Napakalaki.instance
module NapakalakiGame
class Napakalaki
  
  # To make this class a singleton
  include Singleton
  
  attr_reader :current_player, :current_monster
  
  def initialize
 
    @players = Array.new  # Stores the total of the players playing the game
    @current_player = nil       # Stores the person who is currently playing
    @current_monster = nil      # Monster which is currently fighting
    @dealer = CardDealer.instance  # Object of CardDealer singleton class

  end
  
  ##############################################################################
  ## PRIVATE METHODS
  
  private
  # Initializes the 'players' array, adding as many players as they are
  # on the 'names' string, which contains the names of the players
  
  def init_players (names)
  
    names.each do |a_name|
        @players << Player.new(a_name)
    end

  end
  
  # Decides who is the next player to play.
  # First, it calculates the index of the next player in the array of players
  # Then, if this is the first move, it generates a random number between
  # 0 and the number of players minus 1
  
  def next_player()
    if (@current_player == nil)
      r = rand(@players.size())
      a_player = @players[r]
    else
      found = false;
      count = 0;
       
      while ((found == false) && (count < @players.size()))
        a_player = @players[count]
        if (a_player == @current_player)
          found = true; 
        else
          count = count + 1
        end
      end
      
      if(@players[count +1] == nil)
        a_player = @players[0]
      else
        a_player = @players[count+1]
      end
    end  

    @current_player = a_player
    a_player
  end
  
  def next_turn_is_allowed()
    next_turn = false
    if (@current_player == nil || @current_player.valid_state())
      next_turn = true
    end
    next_turn
  end
  
  # Assignation of enemies between the players. This method has been made to
  # use with n players
  private
  def set_enemies()
   
    # Assigns a random position of the list to the enemy attribute of 
    # another player
    for i in(0..@players.size() -1)
      n = rand(@players.size())
      
      while (i == n)
         n = rand(@players.size())
      end
      
      @players[i].set_enemy(@players[n])
    end
  
  end
  
  ##############################################################################
  ## PUBLIC METHODS
  
  public
  def develop_combat() 
     combat_result = @current_player.combat(@current_monster)
     if(combat_result ==  CombatResult::LOSEANDCONVERT)
       card = @dealer.next_cultist
       @players.delete(@current_player)
       @current_player = CultistPlayer.new(@current_player, card)
       @players << @current_player
     end
     @dealer.give_monster_back(@current_monster)  
     combat_result
  end
  
  def discard_visible_treasures(treasures) # en discard no entra
    i = 0
    while (i < treasures.size)
      treasure = treasures[i]
      @current_player.discard_visible_treasure(treasure)
      @dealer.give_treasure_back(treasure)
      i = i+1
    end

  end
  
  def discard_hidden_treasures(treasures)
    i = 0
    while (i < treasures.size)
      treasure = treasures[i]
      @current_player.discard_hidden_treasure(treasure)
      @dealer.give_treasure_back(treasure)
      i = i+1
    end
  end
  def make_treasures_visible (treasures)
    i = 0
    while(i < treasures.size)
      t = treasures[i]
      @current_player.make_treasure_visible(t)
      i = i +1  
    end
  end
  
  def init_game (players)
    init_players(players)
    set_enemies()
    @dealer.init_cards()
    next_turn()

  end
  
  def next_turn()

    state_ok = next_turn_is_allowed()
    
    if(state_ok)
      @current_monster = @dealer.next_monster()
      @current_player = next_player()
      dead = @current_player.dead
      
      if dead
        @current_player.init_treasures()
      end 
    end    
    state_ok
  end
  
  # Returns 'true' if the result paratemer is WINGAME
  
  def end_of_game()
    
    end_of_game = false
    
    if (result == CombatResult::WINGAME)
      end_of_game = true
    end
    
  end
  
end
end