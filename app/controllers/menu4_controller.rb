class Menu4Controller < ApplicationController
    
    layout "menu4"
    
    def menu4
    @koreacook = Cooklist.find(4).cooks.order('created_at DESC')  
    end
    
end
