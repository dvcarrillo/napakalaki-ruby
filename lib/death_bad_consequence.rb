# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'player'
module NapakalakiGame
class DeathBadConsequence < NumericBadConsequence 
  
  attr_reader :death  
  def initialize(a_text)
    @death = true
    super(a_text, Player.get_max_level, @@MAX_TREASURES, @@MAX_TREASURES)
  end
  
  def is_empty () # y esto por qué????
    result = false
  end
  
  def to_s
    respuesta = super.to_s
    respuesta += "\nCausa la muerte: #{@death}\n"
  end
  
  
  
end
end