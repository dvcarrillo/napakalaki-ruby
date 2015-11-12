# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Authors: David Vargas Alicia Vílchez

require 'singleton'

# This class is a singleton: it means that there can only be one instance
# To use this instance in another class: example = Dice.instance

class Dice
  
  # To make this class a singleton
  include Singleton
  
  def initialize
  end
  
  #la función rand viene incluida en el kernel del lenguaje.                         
  def next_number ()
    num_aleat = rand(6) +1 #creará un numero aleatorio del 1 al 6
                           
  end
  
end
