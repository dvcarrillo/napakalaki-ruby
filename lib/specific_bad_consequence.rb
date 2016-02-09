# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Author: David Vargas, Alicia Vílchez

module NapakalakiGame
class SpecificBadConsequence < BadConsequence
  
  attr_reader :specific_visible_treasures # Array of visible treasures
  attr_reader :specific_hidden_treasures  # Array of hidden treasures
  
  def initialize(a_text, some_levels,
      some_specific_visible_treasures, some_specific_hidden_treasures)
    super(a_text, some_levels)
    @specific_visible_treasures = some_specific_visible_treasures
    @specific_hidden_treasures = some_specific_hidden_treasures
  end
  
  def substract_visible_treasure (trs)
    if (!@specific_visible_treasures.empty?)
      @specific_visible_treasures.delete(trs.type)
    end

  end
  
   def substract_hidden_treasure (trs)
    if(!@specific_hidden_treasures.empty?)
            @specific_hidden_treasures.delete(trs.type)
    end
    
  end
  
   def is_empty ()
    result = false
    if ((@specific_visible_treasures.empty?) && (@specific_hidden_treasures.empty?))
      result = true
    end   
    result
  end
  
  def adjust_to_fit_treasure_lists(v, h)
  
      # CASE 2:
      copia_v = Array.new(v)
      trs_v = Array.new()
      
      for tk in @specific_visible_treasures
        i = 0;
        found = false;
        while (i < copia_v.size) && !(found)
          if (copia_v[i].type == tk)
             found = true
             trs_v << tk
       
             #copia_v.delete_at(copia_v.index(i) || copia_v.length)
             copia_v.delete(v[i])
          end     
          i = i+1
        end
      end
                  
      copia_h = Array.new(h)
      trs_h = Array.new()

      for tk in @specific_hidden_treasures
         i = 0
         found = false
         while (i < copia_h.size) && !(found)
            
             if (copia_h[i].type == tk)
                 found = true;
                 trs_h << tk
                #copia_h.delete_at(copia_h.index(i) || copia_h.length)
                copia_h.delete(h[i])
             end   
             i = i+1
         end
      end
      adjust_bc = SpecificBadConsequence.new(@text,@levels,trs_v,trs_h)
      return adjust_bc
  end
  
   def to_s
    
    respuesta = super.to_s
    respuesta += " \nTesoros visibles: #{@specific_visible_treasures}\nTesoros "
    respuesta += "ocultos: #{@specific_hidden_treasures} "
 
  end
  
  
end
end
