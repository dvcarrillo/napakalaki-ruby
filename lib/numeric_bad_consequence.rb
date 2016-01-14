# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
class NumericBadConsequence < BadConsequence
  attr_reader :n_visible_treasures        # Number of visible treasures to lose
  attr_reader :n_hidden_treasures         # Number of hidden treasures t
  
  def initialize(a_text, some_levels,
      some_visible_treasures, some_hidden_treasures)
      super(a_text, some_levels)
      
    @n_visible_treasures = some_visible_treasures
    if(some_visible_treasures > @@MAX_TREASURES)
      @n_visible_treasures = @@MAX_TREASURES
    end
      
    @n_hidden_treasures = some_hidden_treasures
    if(some_hidden_treasures > @@MAX_TREASURES)
      @n_hidden_treasures = @@MAX_TREASURES
    end     
  end
  
  def substract_visible_treasure (trs)
    if (@n_visible_treasures > 0 )
        @n_visible_treasures -= 1
    end
  end
    
  def substract_hidden_treasure (trs)
    if (@n_hidden_treasures > 0 )
       @n_hidden_treasures -= 1
    end
  end
  
  def adjust_to_fit_treasure_lists(v, h)
    # CASE 1:
    # The Bad Consequence DOES NOT remove any SPECIFIC TREASURE. That
    # means that nVisibleTreasures AND nHiddenTreasures attributes will
    # have some particular value while their specific arrays will be empty
      nv_trs = @n_visible_treasures
      nh_trs = @n_hidden_treasures
      
      if(v.size < @n_visible_treasures)
        nv_trs = v.size
      end
      if(h.size < @n_hidden_treasures)
        nh_trs = h.size
      end
      
      adjust_bc = NumericBadConsequence.new(@text, @levels, nv_trs, nh_trs)
      return adjust_bc
  end
  
  def is_empty ()
    result = false
    if ((@n_visible_treasures == 0) && (@n_hidden_treasures == 0))
      result = true
    end   
    result
  end
  
  def to_s
    
    respuesta = super.to_s
    respuesta += " \nNum.tesoros visibles: #{@n_visible_treasures}\nNum. tesoros "
    respuesta += "ocultos: #{@n_hidden_treasures} "
 
  end
  
    
end
end