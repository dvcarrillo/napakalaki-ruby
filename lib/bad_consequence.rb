# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Author: David Vargas

# Class for managing the "bad consequence", which is the damages that causes a
# monster when the player fights against it and loses.
# "Bad consequence" includes losing a number of levels and treasures.

class BadConsequence
  
  # This indicates that the "new" method has private visibility
  #private_class_method :new
  
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
    
    if (the_death == true)
      @death = true
      @levels = 0
      @n_visible_treasures = 0
      @n_hidden_treasures = 0
      @specific_visible_treasures = 0
      @specific_hidden_treasures = 0
      
    else
      @death = false
      @levels = some_levels
      @n_visible_treasures = num_visible_treasures
      @n_hidden_treasures = num_hidden_treasures
      @specific_visible_treasures = some_specific_visible_treasures
      @specific_hidden_treasures = some_specific_hidden_treasures
    end
    
  end
  
  ##############################################################################
  # INSTANCE METHODS
  
  # Methods that set the attributes to the desired values
  
  def new_level_number_of_treasures (a_text, some_levels,
      some_visible_treasures, some_hidden_treasures)
    @text = a_text
    @levels = some_levels
    @n_visible_treasures = some_visible_treasures
    @n_hidden_treasures = some_hidden_treasures
  end
  
  def new_level_specific_treasures (a_text, some_levels,
      some_specific_visible_treasures, some_specific_hidden_treasures)
    @text = a_text
    @levels = some_levels
    @specific_visible_treasures = some_specific_visible_treasures
    @specific_hidden_treasures = some_specific_hidden_treasures
    @n_visible_treasures = some_specific_visible_treasures.length
    @n_hidden_treasures = some_specific_hidden_treasures.length
  end
  
  def new_death (a_text)
    @death = true
    @text = a_text
    @n_visible_treasures = 0
    @n_hidden_treasures = 0
    @specific_visible_treasures = 0
    @specific_hidden_treasures = 0
    @levels = 0
  end
  
  # Method that returns a string with the state of the current object
  
  def to_s
    "Texto: #{@text}\nNiveles que resta: #{@levels}\nNum. tesoros visibles: #{@n_visible_treasures}\nNum. tesoros ocultos: #{@n_hidden_treasures}\nTesoros visibles: #{@specific_visible_treasures}\nTesoros ocultos: #{@specific_visible_treasures}\nCausa la muerte? #{@death}\n"
  end
  
end
