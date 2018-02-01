class GoogleIndexController < ApplicationController
before_action :require_user

  def index
    @google_indecies = GoogleIndex.all
    #UpdateCodeJob.perform_later
  end
  
  def response_index
     flash[:success] = "#{params[:name]}   #{params[:site_name]}"
     CheckIndexJob.perform_later(params[:name],params[:site_name])
     respond_to do |format|
      format.html { redirect_to root_path }
    end
  end
  
  def check_index
    
  end
  
  
  private
  
  def key_params
      params.require(:google_index).permit(:product_id, :product_page, :position)
  end
    
    
end
