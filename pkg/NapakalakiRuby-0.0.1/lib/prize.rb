# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Class for managing the "prize", which is the benefits that may give a
# monster when the player fights against it and wins.
# "Prize" includes obtaining an increment of the level and new treasures.

# Author: David Vargas
module NapakalakiGame
class Prize
  
  # This type of declaration includes the methods of consulting the value of 
  # these variables
  attr_reader :level, :treasures
  
  # INITIALIZE METHOD: it's called when an object of the class Prize is created
  
  def initialize (trs,lvl)
    @level = lvl
    @treasures = trs
  end
  
  # Method that returns a string with the state of the current object
  
  def to_s
    "Nivel ganado: #{@level}\nNumero de tesoros ganados: #{@treasures}"
  end

end
end