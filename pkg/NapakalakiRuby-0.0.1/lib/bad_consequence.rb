# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Author: David Vargas

# Class for managing the "bad consequence", which is the damages that causes a
# monster when the player fights against it and loses.
# "Bad consequence" includes losing a number of levels and treasures.
require_relative 'treasure_kind.rb'
require_relative 'treasure.rb'
require_relative 'player.rb'
module NapakalakiGame
class BadConsequence
  
  # This indicates that the "new" method has private visibility
  @@MAX_TREASURES = 10
  #private_class_method :new
  
  # This type of declaration includes the methods of consulting the value of 
  # these variables
  attr_reader :text                       # What does a Bad Consequence says
  
  attr_reader :levels                     # The numbers of levels to lose
  #attr_reader :n_visible_treasures        # Number of visible treasures to lose
  #attr_reader :n_hidden_treasures         # Number of hidden treasures to lose
  
  #attr_reader :death                      # To represent a Bad Consequence of
                                          # type "death"
  #attr_reader :specific_visible_treasures # Array of visible treasures
  #attr_reader :specific_hidden_treasures  # Array of hidden treasures
  
  ##############################################################################
  # CONSTRUCTOR
  
  #def initialize(a_text, some_levels, num_visible_treasures,
   #   num_hidden_treasures, some_specific_visible_treasures,
 #     some_specific_hidden_treasures, the_death)
    
 #   @text = a_text
  #  @death = the_death
   # @levels = some_levels
  #  @n_visible_treasures = num_visible_treasures
  #  @n_hidden_treasures = num_hidden_treasures
  #  @specific_visible_treasures = some_specific_visible_treasures
  #  @specific_hidden_treasures = some_specific_hidden_treasures
    
  #end
  def initialize(a_text, some_levels)
    @text = a_text
    @levels = some_levels
  end
  ##############################################################################
  # CONSTRUCTORS
  
  # Methods that set the attributes to the desired values
  
  #def self.new_level_number_of_treasures (a_text, some_levels,
  #    some_visible_treasures, some_hidden_treasures)
  #  new(a_text, some_levels, some_visible_treasures, some_hidden_treasures,
  #      Array.new, Array.new, false)
  #end
  
  #def self.new_level_specific_treasures (a_text, some_levels,
  #    some_specific_visible_treasures, some_specific_hidden_treasures)
  #  new(a_text, some_levels, some_specific_visible_treasures.length,
  #    some_specific_hidden_treasures.length, some_specific_visible_treasures,
  #    some_specific_hidden_treasures, false)
  #end
  
  #def self.new_death(a_text)
  #  new(a_text, 10, @@MAX_TREASURES, 0, Array.new, Array.new, true)
  #end
  
  ##############################################################################
  # OTHER METHODS
  
  # Refresh the Bad Consequence deleting the specified VISIBLE treasure
  # This method might do nothing new, may delete a specific visible treasure or 
  # just reduce the number of visible treasures
  def is_empty ()
    
  end
  #  result = false
        
  #  if (!@death) 
  #          if ((@n_visible_treasures == 0) && (@n_hidden_treasures == 0))
  #              result = true
  #          end
  #  end
        
  #  result
  #end
    
  def substract_visible_treasure (trs)
    
  end
  #  if (@n_visible_treasures > 0 && @specific_visible_treasures.empty?)
  #      @n_visible_treasures -= 1

  #  elsif (!@specific_visible_treasures.empty?)
  #    @specific_visible_treasures.delete(trs.type)
  #    @n_visible_treasures -= 1
  #  end
    #######################################################
  #end
  
  # Refresh the Bad Consequence deleting the specified HIDDEN treasure
  # This method might do nothing new, may delete a specific hidden treasure or 
  # just reduce the number of hidden treasures
  
  def substract_hidden_treasure (trs)
    
  end
  #  if (@n_hidden_treasures != 0 && @specific_hidden_treasures.empty?)
  #     @n_hidden_treasures -= 1

  #  elsif (!@specific_hidden_treasures.empty?)
  #          @specific_hidden_treasures.delete(trs.type)
  #          @n_hidden_treasures -= 1
  #  end
    
  #end
 
  def adjust_to_fit_treasure_lists(v, h)
    
  end
    # CASE 1:
    # The Bad Consequence DOES NOT remove any SPECIFIC TREASURE. That
    # means that nVisibleTreasures AND nHiddenTreasures attributes will
    # have some particular value while their specific arrays will be empty
   # if (@specific_visible_treasures.empty? && @specific_hidden_treasures.empty?)
   #   nv_trs = @n_visible_treasures
   #   nh_trs = @n_hidden_treasures
      
   #   if(v.size < @n_visible_treasures)
   #     nv_trs = v.size
   #   end
   #   if(h.size < @n_hidden_treasures)
   #     nh_trs = h.size
   #   end
      
   #   adjust_bc = BadConsequence.new_level_number_of_treasures(@text, @levels, nv_trs, nh_trs)
      # CASE 2:
   # else
   #   copia_v = Array.new(v)
   #   trs_v = Array.new()
      
   #   for tk in @specific_visible_treasures
   #     i = 0;
   #     found = false;
   #     while (i < copia_v.size) && !(found)
   #       if (copia_v[i].type == tk)
   #          found = true
   #          trs_v << tk
       
             #copia_v.delete_at(copia_v.index(i) || copia_v.length)
   #          copia_v.delete(v[i])
   #       end     
   #       i = i+1
   #     end
   #   end
                  
   #  copia_h = Array.new(h)
   #   trs_h = Array.new()

   #   for tk in @specific_hidden_treasures
   #      i = 0
   #      found = false
   #      while (i < copia_h.size) && !(found)
            
   #          if (copia_h[i].type == tk)
   #              found = true;
   #              trs_h << tk
                #copia_h.delete_at(copia_h.index(i) || copia_h.length)
   #             copia_h.delete(h[i])
   #          end   
   #          i = i+1
   #      end
   #   end
   #   adjust_bc = BadConsequence.new_level_specific_treasures(@text,@levels,trs_v,trs_h)
   # end
   
   # return adjust_bc
  #end
  
  ##############################################################################
  # TOSTRING
  # Method that returns a string with the state of the current object
  
  def to_s
    respuesta  = "Texto: #{@text}\nNiveles que resta: #{@levels}"
  end
  
end
end