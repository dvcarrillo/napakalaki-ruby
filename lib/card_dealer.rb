# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Author: David Vargas, Alicia Vílchez

require 'singleton'
require_relative 'treasure.rb'
require_relative 'treasure_kind.rb'
require_relative 'prize.rb'
require_relative 'monster.rb'
require_relative 'bad_consequence.rb'
require_relative 'cultist.rb'
require_relative 'specific_bad_consequence'
require_relative 'numeric_bad_consequence'
require_relative 'death_bad_consequence'
# This class is a singleton: it means that there can only be one instance
# To use this instance in another class: example = CardDealer.instance

module NapakalakiGame
class CardDealer
  
  # To make this class a singleton
  include Singleton
  
  def initialize
    # Arrays for the treasures (used and unused)
    @used_treasures = Array.new
    @unused_treasures = Array.new
    
    # Arrays for the monsters (used and unused)
    @used_monsters = Array.new  
    @unused_monsters = Array.new
    
    @unused_cultists = Array.new
  end
  
  ##############################################################################
  ## PRIVATE METHODS
  # Initializes the treasure card deck defining all the treasures of the game
  def init_treasure_card_deck()
    
    # Si, mi amo!
    @unused_treasures << Treasure.new("Si, mi amo!", 4, TreasureKind::HELMET)
        
    # Botas de investigacion
    @unused_treasures << Treasure.new("Botas de investigacion", 3,
      TreasureKind::SHOES)

    # Capucha de Cthulhu
    @unused_treasures << Treasure.new("Capucha de Cthulhu", 3,
      TreasureKind::HELMET)

    # A prueba de babas
    @unused_treasures << Treasure.new("A prueba de babas", 2,
      TreasureKind::ARMOR)

    # Botas de lluvia acida
    @unused_treasures << Treasure.new("Botas de lluvia acida", 1,
      TreasureKind::BOTHHANDS)

    # Casco 
    @unused_treasures << Treasure.new("Casco minero", 2, TreasureKind::HELMET)

    # Ametralladora Thompson
    @unused_treasures << Treasure.new("Ametralladora Thompson", 4,
      TreasureKind::BOTHHANDS)

    # Camiseta de la UGR
    @unused_treasures <<  Treasure.new("Camiseta de la UGR", 1,
      TreasureKind::ARMOR)

    # Clavo de rail ferroviario
    @unused_treasures << Treasure.new("Clavo de rail ferroviario", 3,
      TreasureKind::ONEHAND)

    # Cuchillo de sushi arcano
    @unused_treasures << Treasure.new("Cuchillo de sushi arcano", 2,
      TreasureKind::ONEHAND)

    # Fez alopodo
    @unused_treasures << Treasure.new("Fez alopodo", 3, TreasureKind::HELMET)

    # Hacha prehistorica
   @unused_treasures << Treasure.new("Hacha prehistorica", 2,
      TreasureKind::ONEHAND)

    # El aparato del Pr. Tesla
    @unused_treasures << Treasure.new("El aparato del Pr. Tesla", 4,
      TreasureKind::ARMOR);
    
    # Gaita
    @unused_treasures << Treasure.new("Gaita", 4, TreasureKind::BOTHHANDS)

    # Insecticida
    @unused_treasures << Treasure.new("Insecticida", 2, TreasureKind::ONEHAND)

    # Escopeta de 3 cañones
    @unused_treasures << Treasure.new("Escopeta de 3 caniones", 4, TreasureKind::BOTHHANDS)

    # Garabato mistico
    @unused_treasures << Treasure.new("Garabato mistico", 2,
      TreasureKind::ONEHAND)

    # La rebeca metalica
    @unused_treasures << Treasure.new("La rebeca metalica", 2,
      TreasureKind::ARMOR)

    # Lanzallamas
    @unused_treasures << Treasure.new("Lanzallamas", 4,
      TreasureKind::BOTHHANDS)

    # Necrocomicon
    @unused_treasures << Treasure.new("Necrocomicon", 1,
      TreasureKind::ONEHAND)

    # Necronomicon
    @unused_treasures << Treasure.new("Necronomicon", 5,
      TreasureKind::BOTHHANDS)

    # Linterna a 2 manos
    @unused_treasures << Treasure.new("Linterna a 2 manos", 3,
      TreasureKind::BOTHHANDS)

    # Necrognomicon
    @unused_treasures << Treasure.new("Necrognomicon", 2,
      TreasureKind::ONEHAND)

    # Necrotelecom
    @unused_treasures << Treasure.new("Necrotelecom", 2,
      TreasureKind::HELMET)

    # Necrotelecom
    @unused_treasures << Treasure.new("Mazo de los antiguos", 3,
      TreasureKind::ONEHAND)

    # Necroplayboycon
    @unused_treasures << Treasure.new("Necroplayboycon", 3,
      TreasureKind::ONEHAND);

    # Porra preternatural
    @unused_treasures << Treasure.new("Porra preternatural", 2,
      TreasureKind::ONEHAND)

    # Shogulador
    @unused_treasures << Treasure.new("Shogulador", 1,[TreasureKind::BOTHHANDS])

    # Varita de atizamiento
    @unused_treasures << Treasure.new("Varita de atizamiento", 3,
      TreasureKind::ONEHAND)

    # Tentaculo de pega
    @unused_treasures << Treasure.new("Tentaculo de pega", 2,
      TreasureKind::HELMET)

    # Zapato deja-amigos
    @unused_treasures << Treasure.new("Zapato deja-amigos", 1,
      TreasureKind::SHOES)
    
    @unused_treasures.shuffle!
  end
  
  # Initializes the monster card deck defining all the monsters of the game
  
  def init_monsters_card_deck()

    # 3 BYAKHEES DE BONANZA
    prize = Prize.new(2, 1)
    bad_consequence = SpecificBadConsequence.new('Pierdes tu
    armadura visible y otra oculta',0, [TreasureKind::ARMOR],
    [TreasureKind::ARMOR])
    @unused_monsters << Monster.new('3 Byakhees de bonanza', 8, bad_consequence,
    prize)

    # CHIBITHULHU
    prize = Prize.new(1, 1)
    bad_consequence = SpecificBadConsequence.new('Embobados con
    el lindo primigenio te descartas de tu casco visible', 0,
    [TreasureKind::HELMET], Array.new )
    @unused_monsters << Monster.new('Chibithulhu', 2, bad_consequence, prize)

    # EL SOPOR DE DUNWICH
    prize = Prize.new(1, 1)
    bad_consequence = SpecificBadConsequence.new('El primordial 
    bostezo contagioso. Pierdes el calzado visible', 0, [TreasureKind::SHOES], 
    Array.new)
    @unused_monsters << Monster.new('Chibithulhu', 2, bad_consequence, prize)

    # ÁNGELES DE LA NOCHE IBICENCA
    prize = Prize.new(4, 1)
    bad_consequence = SpecificBadConsequence.new('Te atrapan
    para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano
    visible y 1 mano oculta', 0,[TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
    @unused_monsters << Monster.new('Angeles de la noche ibicenca', 14,
    bad_consequence, prize)

    # EL GORRÓN EN EL UMBRAL
    prize = Prize.new(3, 1)
    bad_consequence = NumericBadConsequence.new('Pierdes
    todos tus tesoros visibles', 0, 20, 0)
    @unused_monsters << Monster.new('El gorron en el umbral', 10,
    bad_consequence,prize)

    # H.P. MUNCHCRAFT
    prize = Prize.new(2, 1)
    bad_consequence = SpecificBadConsequence.new('Pierdes la 
    armadura visible', 0, [TreasureKind::ARMOR], Array.new)
    @unused_monsters << Monster.new('H.P.Munchcraft', 6, bad_consequence, prize)

    # BICHGOOTH
    prize = Prize.new(1, 1)
    bad_consequence = SpecificBadConsequence.new('Sientes
    bichos bajo la ropa. Descarta la armadura visible',0, [TreasureKind::ARMOR],
    Array.new)
    @unused_monsters << Monster.new('Bichgooth', 2, bad_consequence, prize)

    # EL REY DE ROSA
    prize = Prize.new(4, 2)
    bad_consequence = NumericBadConsequence.new('Pierdes 5 
    niveles y 3 tesoros visibles', 5, 3, 0)
    @unused_monsters << Monster.new('El rey de rosa', 13, bad_consequence,prize)

    # LA QUE REDACTA EN LAS TINIEBLAS
    prize = Prize.new(1, 1)
    bad_consequence = NumericBadConsequence.new('Toses los 
    pulmones y pierdes 2 niveles.', 2, 0, 0)
    @unused_monsters << Monster.new('La que redacta en las tinieblas', 2,
    bad_consequence, prize)

    # LOS HONDOS
    prize = Prize.new(2, 1)
    bad_consequence = DeathBadConsequence.new('Estos monstruos resultan bastante superficiales y
    te aburren mortalmente. Estas muerto')
    @unused_monsters << Monster.new('Los hondos', 8, bad_consequence, prize)

    # SEMILLAS CTHULHU
    prize = Prize.new(2, 1)
    bad_consequence = 
    NumericBadConsequence.new('Pierdes 2 niveles y 2 tesoros
    ocultos', 2, 0, 2)
    @unused_monsters << Monster.new('Semillas Cthulhu', 4, bad_consequence,
    prize)

    # DAMEARGO
    prize = Prize.new(2, 1)
    bad_consequence = SpecificBadConsequence.new('Te intentas escaquear. Pierdes
    una mano visible', 0, [TreasureKind::ONEHAND], Array.new)
    @unused_monsters << Monster.new('Dameargo', 1, bad_consequence, prize)

    # POLLIPÓLIPO VOLANTE
    prize = Prize.new(1, 1)
    bad_consequence =
    NumericBadConsequence.new('Da mucho asquito. Pierdes 3
    niveles', 3, 0, 0)
    @unused_monsters << Monster.new('Pollipolipo volante', 3, bad_consequence,
    prize)

    # YSKHTIHYSSG-GOTH
    prize = Prize.new(3, 1)
    bad_consequence = 
    DeathBadConsequence.new('No le hace gracia que pronuncien mal su nombre.
    Estas muerto')
    @unused_monsters << Monster.new('Yskhtihyssg-Goth', 12, bad_consequence,
    prize)

    # FAMILIA FELIZ
    prize = Prize.new(4, 1)
    bad_consequence = 
    DeathBadConsequence.new('La familia te atrapa. Estas muerto')
    @unused_monsters << Monster.new('Familia feliz', 1, bad_consequence, prize)

    # ROBOGGOTH
    prize = Prize.new(2, 1)
    bad_consequence = SpecificBadConsequence.new('La quinta directiva primaria te 
    obliga a perder 2 niveles y un tesoro 2 manos visible', 2,
    [TreasureKind::BOTHHANDS], Array.new)
    @unused_monsters << Monster.new('Roboggoth', 8, bad_consequence, prize)

    # EL ESPIA
    prize = Prize.new(1, 1)
    bad_consequence = SpecificBadConsequence.new('Te asusta en la noche. Pierdes
    un casco visible', 0, [TreasureKind::HELMET], Array.new)
    @unused_monsters << Monster.new('El espia', 5, bad_consequence, prize)

    # EL LENGUAS
    prize = Prize.new(1, 1)
    bad_consequence = 
    NumericBadConsequence.new('Menudo susto te llevas.
    Pierdes 2 niveles y 5 tesoros visibles', 2, 5, 0)
    @unused_monsters << Monster.new('El Lenguas', 20, bad_consequence, prize)

    # BICÉFALO
    prize = Prize.new(1, 1)
    bad_consequence =SpecificBadConsequence.new('Te faltan manos para tanta
    cabeza', 3,
    [TreasureKind::ONEHAND,TreasureKind::ONEHAND,TreasureKind::BOTHHANDS],
    Array.new)
    @unused_monsters << Monster.new('Bicefalo', 20, bad_consequence, prize)
    
    ##### MONSTRUOS CON SECTARIOS #####
    
    # EL MAL INCEDIBLE IMPRONUNCIABLE
    prize = Prize.new(3, 1)
    bad_consequence = SpecificBadConsequence.new("Pierdes 
      una mano visible", 0, [TreasureKind::ONEHAND], Array.new)
    @unused_monsters << Monster.new("El mal indecible impronunciable",
      10, bad_consequence, prize, -2)
  
    # TESTIGOS OCULARES
    prize = Prize.new(2, 1)
    bad_consequence = NumericBadConsequence.new("Pierdes tus 
      tesoros visibles. AJAJAJ", 0, 20, 0)
    @unused_monsters << Monster.new("Testigos Oculares", 6, bad_consequence, prize, 2)
  
    # EL GRAN CTHULHU
    prize = Prize.new(2, 5)
    bad_consequence = DeathBadConsequence.new("Hoy no es tu dia de suerte. Mueres")
    @unused_monsters << Monster.new("El gran cthulhu",20, bad_consequence, prize, 4)
  
    # SERPIENTE POLITICO
    prize = Prize.new(2, 1)
    bad_consequence = NumericBadConsequence.new("Tu gobierno 
      te recorta dos niveles", 2,0, 0)
    @unused_monsters << Monster.new("Serpiente Politico",8, bad_consequence, prize, -2)
  
    #FELPUGGOTH
    prize = Prize.new(1, 1)
    bad_consequence = SpecificBadConsequence.new("Pierdes tu 
      casco y tu armadura visible. Pierdes tus manos ocultas", 0,
      [TreasureKind::HELMET, TreasureKind::ARMOR], 
      [TreasureKind::ONEHAND,TreasureKind::ONEHAND,TreasureKind::BOTHHANDS])
    @unused_monsters << Monster.new("Felpuggoth", 2, bad_consequence, prize, 5)
  
    # SHOGGOTH
    prize = Prize.new(4, 2)
    bad_consequence = NumericBadConsequence.new("Pierdes 2 
      niveles", 2, 0, 0)
    @unused_monsters << Monster.new("Shoggoth", 16, bad_consequence, prize, -4)
  
    # LOLITAGOOTH
    prize = Prize.new(1, 1)
    bad_consequence = NumericBadConsequence.new("Pintalabios 
      negro. Pierdes 2 niveles", 2, 0, 0)
    @unused_monsters << Monster.new("Lolitagooth", 2, bad_consequence, prize, 3)
  
    ############################################################################
    ############################################################################
    
    @unused_monsters.shuffle!
  end
  
  def shuffle_treasures()
    @unused_treasures.shuffle!
  end
  
  def shuffle_monsters()
    @unused_monsters.shuffle!
  end
  
  ##############################################################################
  ## PUBLIC METHODS
  
  public
  
  # Returns the next treasure of the unused treasures card deck
  # If it was empty, it would shuffle the used ones and introduce them again
  # into the unused ones
  
  def next_treasure()
    # Checks if the unused_treasures array is empty and, if so, shuffle the used
    # ones and introduce them again into the unused ones
    
    if (@unused_treasures.empty?)
      @used_treasures.shuffle!
      
      for i in 0..(@used_treasures.size)
        @unused_treasures[i] = @used_treasures[i]
      end
      
      @used_treasures.clear
    end
    
    # Finds and returns the next treasure
    nxt_treasure = @unused_treasures[0];
    @unused_treasures.delete(nxt_treasure)
    
    nxt_treasure
  end
  
  # Returns the next monster of the unused monsters card deck
  # If it was empty, it would shuffle the used ones and introduce them again
  # into the unused ones
  
  def next_monster()
    # Checks if the unused_monsters array is empty and, if so, shuffle the used
    # ones and introduce them again into the unused ones
    
    if (@unused_monsters.empty?)
      @used_monsters.shuffle!
      
      for i in 0..(@used_monsters.size)
        @unused_monsters[i] = @used_monsters[i]
      end
      
      @used_monsters.clear
    end
    
    # Finds and returns the next monster
    
    nxt_monster = @unused_monsters[0];
    @unused_monsters.delete(nxt_monster)
    
    nxt_monster
  end
  
  def give_treasure_back(trs)
    @used_treasures << trs
  end
  
  def give_monster_back(mns)
    @used_monsters << mns
  end
  
  def init_cards()
    init_treasure_card_deck()
    init_monsters_card_deck()
    init_cultist_card_deck()
  end
  
  
  #############################################################################
  public
  def next_cultist
    cultist =  @unused_cultists[0]
    @unused_cultists.delete(cultist)
    
    cultist
  end
  
  def shuffle_cultists
     @unused_cultists.shuffle!
  end
  
  def init_cultist_card_deck
    
    @unused_cultists << Cultist.new("+1 por cada sectario en juego. No puedes
      dejar de ser sectario", 1)
    
    @unused_cultists << Cultist.new("+2 por cada sectario en juego. No puedes
      dejar de ser sectario", 2)
    
    @unused_cultists << Cultist.new("+1 por cada sectario en juego. No puedes
      dejar de ser sectario", 1)
    
    @unused_cultists << Cultist.new("+2 por cada sectario en juego. No puedes
      dejar de ser sectario", 2)
    
    @unused_cultists << Cultist.new("+1 por cada sectario en juego. No puedes
      dejar de ser sectario", 1)
    
    @unused_cultists << Cultist.new("+1 por cada sectario en juego. No puedes
      dejar de ser sectario", 1)
    
    @unused_cultists << Cultist.new("+1 por cada sectario en juego. No puedes
      dejar de ser sectario", 1)
    
    @unused_cultists.shuffle!
  end
end
end