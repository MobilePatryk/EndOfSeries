class EndsController < ApplicationController
  before_action :set_end, only: [:show, :edit, :update, :destroy]
  before_action :require_user

  # GET /ends
  # GET /ends.json
  def index
    @ends = End.all
    #UpdateCodeJob.perform_later
  end

  def codeupdate
    UpdateCodeJob.perform_later
    flash[:success] = "Wait 2 minutes and refresh the page"
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  # GET /ends/1
  # GET /ends/1.json
  def show
  end

  # GET /ends/new
  def new
    @end = End.new
  end

  # GET /ends/1/edit
  def edit
  end

  # POST /ends
  # POST /ends.json
  def create
    @end = End.new(end_params)

    respond_to do |format|
      if @end.save
        format.html { redirect_to @end, notice: 'End was successfully created.' }
        format.json { render :show, status: :created, location: @end }
      else
        format.html { render :new }
        format.json { render json: @end.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ends/1
  # PATCH/PUT /ends/1.json
  def update
    respond_to do |format|
      if @end.update(end_params)
        format.html { redirect_to @end, notice: 'End was successfully updated.' }
        format.json { render :show, status: :ok, location: @end }
      else
        format.html { render :edit }
        format.json { render json: @end.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ends/1
  # DELETE /ends/1.json
  def destroy
    @end.destroy
    respond_to do |format|
      format.html { redirect_to ends_url, notice: 'End was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_end
      @end = End.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def end_params
      params.require(:end).permit(:product_id, :product_page, :position)
    end
end
