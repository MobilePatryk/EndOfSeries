class UserController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show]
    
    
    def edit
        @user = User.find(params[:id])
        
    end
    
    def update
        if @user.update(user_params)
            flash[:succes] = "Your account was update succesfuly"
            respond_to do |format|
            format.html { redirect_to root_path }
            end
        else
            render 'edit'
        end
    end
    
    
    private
    
    def set_user
        @user = current_user
    end
    
    def user_params
        params.require(:user).permit(:name,sport_ids: []) #sports_ids[]
    end
end
