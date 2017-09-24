class Menu1Controller < ApplicationController
    
    layout "menu1"
    
    def menu1
    @koreacook = Cooklist.find(1).cooks.order('created_at DESC')  
    end
    
end
