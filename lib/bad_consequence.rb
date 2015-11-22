# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Author: David Vargas Alicia Vílchez

# Class for managing the "bad consequence", which is the damages that causes a
# monster when the player fights against it and loses.
# "Bad consequence" includes losing a number of levels and treasures.

class BadConsequence
  
  # This indicates that the "new" method has private visibility
  
  private_class_method :new
  
  # This type of declaration includes the methods of consulting the value of 
  # these variables
  attr_reader :text                       # What does a Bad Consequence says
  
  attr_reader :levels                     # The numbers of levels to lose
  attr_reader :n_visible_treasures        # Number of visible treasures to lose
  attr_reader :n_hidden_treasures         # Number of hidden treasures to lose
  
  attr_reader :death                      # To represent a Bad Consequence of
                                          # type "death"
  attr_reader :specific_visible_treasures # Array of visible treasures
  attr_reader :specific_hidden_treasures  # Array of hidden treasures
  
  ##############################################################################
  # CONSTRUCTOR
  
  def initialize(a_text, some_levels, num_visible_treasures,
      num_hidden_treasures, some_specific_visible_treasures,
      some_specific_hidden_treasures, the_death)
    
    @text = a_text
    @death = the_death
    @levels = some_levels
    @n_visible_treasures = num_visible_treasures
    @n_hidden_treasures = num_hidden_treasures
    @specific_visible_treasures = some_specific_visible_treasures
    @specific_hidden_treasures = some_specific_hidden_treasures
    
  end
  
  ##############################################################################
  # INSTANCE METHODS
  
  # Methods that set the attributes to the desired values
  
  def self.new_level_number_of_treasures (a_text, some_levels,
      some_visible_treasures, some_hidden_treasures)
    new(a_text, some_levels, some_visible_treasures, some_hidden_treasures,
        Array.new, Array.new, false)
  end
  
  def self.new_level_specific_treasures (a_text, some_levels,
      some_specific_visible_treasures, some_specific_hidden_treasures)
    new(a_text, some_levels, some_specific_visible_treasures.length,
      some_specific_hidden_treasures.length, some_specific_visible_treasures,
      some_specific_hidden_treasures, false)
  end
  
  def self.new_death(a_text)
    new(a_text, 0, 0, 0, Array.new, Array.new, true)
  end
  
  # Method that returns a string with the state of the current object
  
  def to_s
    respuesta  = "Texto: #{@text}\nNiveles que resta: #{@levels}\nNum. "
    respuesta += "tesoros visibles: #{@n_visible_treasures}\nNum. tesoros "
    respuesta += "ocultos: #{@n_hidden_treasures}\nTesoros visibles: "
    respuesta += "#{@specific_visible_treasures}\nTesoros ocultos: "
    respuesta += "#{@specific_hidden_treasures}\nCausa la muerte? #{@death}\n"
  end
  
  def substract_visible_treasure(t)
    
    for i in(0..@specific_visible_treasures.size())
      if(t == @specific_visible_treasures.get(i))
        @specific_visible_treasures[i] = nil  ## ¿???
      end
    end
  end

end
