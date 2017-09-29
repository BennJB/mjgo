class Menu3Controller < ApplicationController
    
    layout "menu3"
    
    def menu3
    @koreacook = Cooklist.find(3).cooks.order('created_at DESC').reverse
    end
    
end
