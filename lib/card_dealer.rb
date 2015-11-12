# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Author: David Vargas

require 'singleton'

# This class is a singleton: it means that there can only be one instance
# To use this instance in another class: example = CardDealer.instance

class CardDealer
  
  # To make this class a singleton
  include Singleton
  
  def initialize
    # Arrays for the treasures (used and unused)
    @used_treasures = Array.new
    @unused_tresures
    
    # Arrays for the monsters (used and unused)
    @used_monsters = Array.new
    @unused_monsters
  end
  
  ##############################################################################
  ## PRIVATE METHODS
  
  private
  def self.card_dealer()
    # ...
  end
  
  def self.init_treasure_card_deck()
    @unused_tresures = Array.new
    ############################################################################
    #Si, mi amo!
        @unused_treasures << Treasure.new("Si, mi amo!", 4,
                [TreasureKind::HELMET])
        
      ##########################################################################
      #Botas de investigacion
        @unused_treasures << Treasure.new("Botas de investigacion", 3,
                [TreasureKind::SHOES])
        
       #########################################################################
       #Capucha de Cthulhu
        @unused_treasures << Treasure.new("Capucha de Cthulhu", 3,
                 [TreasureKind::HELMET])
        
      ######################################################################3###
      #A prueba de babas
        @unused_treasures << Treasure.new("A prueba de babas", 2, 
              [TreasureKind::ARMOR])
        
      ##########################################################################
      #Botas de lluvia acida
        @unused_treasures << Treasure.new("Botas de lluvia acida", 1,
                [TreasureKind::BOTHHANDS])
        
     ###########################################################################
     #Casco minero
        @unused_treasures << Treasure.new("Casco minero", 2,
                 [TreasureKind::HELMET])
        
       #########################################################################
       #Ametralladora Thompson
        @unused_treasures << Treasure.new("Ametralladora Thompson", 4,
                 [TreasureKind::BOTHHANDS])
        
        ########################################################################
        #Camiseta de la UGR
        @unused_treasures <<  Treasure.new("Camiseta de la UGR", 1,
                [TreasureKind::ARMOR])
              
        ########################################################################
        #Clavo de rail ferroviario
        @unused_treasures << Treasure.new("Clavo de rail ferroviario", 3,
                [TreasureKind::ONEHAND])
        
        ########################################################################
        #Cuchillo de sushi arcano
        @unused_treasures << Treasure.new("Cuchillo de sushi arcano", 2,
                [TreasureKind::ONEHAND])
        
        ########################################################################
        # Fez alopodo
        @unused_Treasures << Treasure.new("Fez alopodo", 3,
               [TreasureKind::HELMET])
        
        ########################################################################
        #Hacha prehistorica
         @unused_treasures << Treasure.new("Hacha prehistorica", 2,
                [TreasureKind::ONEHAND])
         
        ########################################################################
        #El aparato del Pr. Tesla
        @unused_treasures << Treasure.new("El aparato del Pr. Tesla", 4,
               [TreasureKind::ARMOR]);
        
        ########################################################################
        #Gaita
        @unused_treasures << Treasure.new("Gaita", 4,
                [TreasureKind::BOTHHANDS])
        
        ########################################################################
        #Insecticida
        @unused_treasures << Treasure.new("Insecticida", 2,
               [TreasureKind::ONEHAND])
        
        ########################################################################
        #Escopeta de 3 cañones
        @unused_treasures << Treasure.new("Escopeta de 3 cañones", 4,
                [TreasureKind::BOTHHANDS])
        
        ########################################################################
        #Garabato mistico
        @unused_reasures << Treasure.new("Garabato mistico", 2,
               [TreasureKind::ONEHAND])
        
        ########################################################################
        #La rebeca metalica
        @unused_treasures << Treasure.new("La rebeca metalica", 2,
                [TreasureKind::ARMOR])
        
        ########################################################################
        #Lanzallamas
        @unused_treasures << Treasure.new("Lanzallamas", 4,
                 [TreasureKind::BOTHHANDS])
        
        ########################################################################
        #Necrocomicon
        @unused_treasures << Treasure.new("Necrocomicon", 1,
               [TreasureKind::ONEHAND])
        
        ########################################################################
        #Necronomicon (NOMBRE PARECIDO)
        @unused_treasures << Treasure.new("Necronomicon", 5,
               [TreasureKind::BOTHHANDS])
        
        ########################################################################
        #Linterna a 2 manos
        @unusedTreasures << Treasure.new("Linterna a 2 manos", 3,
                [TreasureKind::BOTHHANDS])
        
        ########################################################################
        #Necrognomicon
        @unused_treasures << Treasure.new("Necrognomicon", 2,
                [TreasureKind::ONEHAND])
        
        ########################################################################
        #Necrotelecom
        @unused_treasures << Treasure.new("Necrotelecom", 2,
                [TreasureKind::HELMET])
        
       ########################################################################
        #Necrotelecom
        @unused_treasures << Treasure("Mazo de los antiguos", 3,
                 [TreasureKind::ONEHAND])
        
        ########################################################################
        #Necroplayboycon
        @unused_treasures << Treasure("Necroplayboycon", 3,
                 [TreasureKind::ONEHAND]);
        
       ########################################################################
        #Porra preternatural
        @unused_treasures << Treasure.new("Porra preternatural", 2,
                 [TreasureKind::ONEHAND])
        
       ########################################################################
        #Shogulador
        @unused_treasures << Treasure.add("Shogulador", 1,
               [TreasureKind::BOTHHANDS])
        
       ########################################################################
        #Varita de atizamiento
        @unused_treasures << Treasure.add("Varita de atizamiento", 3,
                [TreasureKind::ONEHAND])
        
       ########################################################################
        #Tentaculo de pega
        @unused_treasures << Treasure.add("Tentaculo de pega", 2,
                [TreasureKind::HELMET])
        
        ########################################################################
        #Zapato deja-amigos
        @unused_treasures << Treasure.add("Zapato deja-amigos", 1,
               [TreasureKind::SHOES])

  end
  
  def self.init_monsters()
    
  end
  
  def self.shuffle_treasures()
    unused_treasures.shuffle!
  end
  
  def self.shuffle_monsters()
    unused_monsters.shuffle!
  end
  
  ##############################################################################
  ## PUBLIC METHODS
  
  public
  def next_treasure()
    # ...
  end
  
  def next_monster()
    # ...
  end
  
  def give_treasure_back(t)
     @used_treasures << t
     @unused_treasures.delete(t); 
  end  
   
  end
  
  def give_monster_back (mns)
     @used_monsters << mns
     @unused_monsters.delete(mns)
  end
  
  def init_cards()
    # ...
  end
    
end
