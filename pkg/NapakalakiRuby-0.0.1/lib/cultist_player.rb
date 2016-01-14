# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiGame
class CultistPlayer < Player
  attr_reader :total_cultist_players, :my_cultist_card
  @@total_cultist_players = 0
  
  def initialize(p, c)
    @my_cultist_card = c
    super(p.name)
    new_player(p) #llamamos al constructor de copia de player
    @@total_cultist_players += 1
    
  end
  ############################################################################
  def get_combat_level
    level = super ## ya que estamos haciendo una llamada al método padre
    level *= 1.2
    level += my_cultist_card.gained_levels
    level *= @@total_cultist_players
    level.floor
  end
  
  def get_oponent_level(m)
   m.get_combat_level_against_cultist_player
  end
  
  
  def should_convert 
    convert = false
  end
  private
  def give_me_a_treasure
    n = rand(@visible_treasures.size())
    t = @visible_treasures[n]
    @visible_treasures.delete(t)
    return t
  end
  
  def can_you_give_me_a_treasure
    result = !(@visible_treasures.empty?)
    result
  end
  public
  def to_s
    respuesta = super.to_s
    respuesta += "\nJUGADOR CULTIST"
  end
  
end
end