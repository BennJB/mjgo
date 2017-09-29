class Menu2Controller < ApplicationController
    
    layout "menu2"
    
    def menu2
    @koreacook = Cooklist.find(2).cooks.order('created_at DESC').reverse 
    end
    
end
