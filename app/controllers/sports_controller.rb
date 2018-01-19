class SportsController < ApplicationController
    
    def index
        @sports = current_user.sports
    end
    
end
