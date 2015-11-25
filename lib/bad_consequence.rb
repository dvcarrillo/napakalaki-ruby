# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Author: David Vargas

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
  # CONSTRUCTORS
  
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
  
  ##############################################################################
  # OTHER METHODS
  
  # Refresh the Bad Consequence deleting the specified VISIBLE treasure
  # This method might do nothing new, may delete a specific visible treasure or 
  # just reduce the number of visible treasures
  
  def substract_visible_treasure (trs)
    # CASE 1: The specific_visible_treasures array is empty but there is a 
    # number greater than 0 on n_visible_treasures
    # SOLUTION: decrement in an unit n_visible_treasures
    
    if ((@specific_visible_treasures.empty?) && (@n_visible_treasures > 0))
      @n_visible_treasures -= 1
    
    # CASE 2: The specific_visible_treasures array is not empty.
    # SOLUTION: The method will look for the specified treasure in the array,
    # and if it finds it, it will delete it. In another case, nothing will
    # happen.
    
    else
      itr = 0
      found = false

      while ((itr < @specific_visible_treasures.size) && (found == false))
        
        if (@specific_visible_treasures[itr] == trs)
          @specific_visible_treasures[itr] = nil
          found = true
          @n_visible_treasures -= 1
        end
        
        itr += 1
      end
    end
  end
  
  # Refresh the Bad Consequence deleting the specified HIDDEN treasure
  # This method might do nothing new, may delete a specific hidden treasure or 
  # just reduce the number of hidden treasures
  
  def substract_hidden_treasure (trs)
    # CASE 1: The specific_hidden_treasures array is empty but there is a 
    # number greater than 0 on n_hidden_treasures
    # SOLUTION: decrement in an unit n_hidden_treasures
    
    if ((@specific_hidden_treasures.empty?) && (@n_hidden_treasures > 0))
      @n_hidden_treasures -= 1
    
    # CASE 2: The specific_hidden_treasures array is not empty.
    # SOLUTION: The method will look for the specified treasure in the array,
    # and if it finds it, it will delete it. In another case, nothing will
    # happen.
    
    else
      itr = 0
      found = false

      while ((itr < @specific_hidden_treasures.size) && (found == false))
        
        if (@specific_hidden_treasures[itr] == trs)
          @specific_hidden_treasures[itr] = nil
          found = true
          @n_hidden_treasures -= 1
        end
        
        itr += 1
      end
    end
    
  end
  
  ##############################################################################
  # TOSTRING
  # Method that returns a string with the state of the current object
  
  def to_s
    respuesta  = "Texto: #{@text}\nNiveles que resta: #{@levels}\nNum. "
    respuesta += "tesoros visibles: #{@n_visible_treasures}\nNum. tesoros "
    respuesta += "ocultos: #{@n_hidden_treasures}\nTesoros visibles: "
    respuesta += "#{@specific_visible_treasures}\nTesoros ocultos: "
    respuesta += "#{@specific_hidden_treasures}\nCausa la muerte? #{@death}\n"
  end
  
end
