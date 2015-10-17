# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Author: David Vargas

# Class for managing the "bad consequence", which is the damages that causes a
# monster when the player fights against it and loses.
# "Bad consequence" includes losing a number of levels and treasures.

class BadConsequence
  
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
  
  def initialize
    # TO DO FOR NEXT WEEK  
  end
  
end
