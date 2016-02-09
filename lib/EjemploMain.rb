# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Author: David Vargas, Alicia Vílchez

require_relative "Napakalaki"
require_relative "GameTester"

module NapakalakiGame

  class EjemploMain
   
      def prueba
        
        puts ("**********************************************************")
        puts ("*                - NAPAKALAKI x RUBY -                   *")
        puts ("*             BY DAVID VARGAS, ALICIA VILCHEZ            *")
        puts ("*                         2015                           *")
        puts ("*                                                        *")
        puts ("*              http://github.com/dvcarrillo              *")
        puts ("**********************************************************")
        puts ("v0.8")
        puts
        puts
        
       test = Test::GameTester.instance
     
       game = Napakalaki.instance
   
       # Se prueba el juego con 2 jugadores
   
       test.play(game, 2);
       
      end
      
  end
  
    e = EjemploMain.new
    e.prueba()

end
