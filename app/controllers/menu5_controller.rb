class Menu5Controller < ApplicationController
    
     layout "menu5"
    
    def menu5
    @koreacook = Cooklist.find(5).cooks.order('created_at DESC').reverse
    end
    
end
