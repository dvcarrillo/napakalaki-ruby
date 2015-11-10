# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Author: David Vargas

# This class manages the cards of type Treasure and their attributes

class Treasure
  
  # GET methods are included in attr_reader
  attr_reader :name, :bonus, :type
  
  def initialize (tr_name, tr_bonus, tr_kind)
    @name = tr_name
    @bonus = tr_bonus
    @type = tr_kind
  end
  
end
