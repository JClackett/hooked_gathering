class GuestsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  # GET /guests
  # GET /guests.json
  def index
    @guests = Guest.all
  end

  # GET /guests/new
  def new
    @guest = Guest.new
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests
  # POST /guests.json
  def create
    @guest = Guest.new(guest_params)
      if @guest.save
        redirect_to root_path, notice: 'Guest was successfully created.' 
      else
        render :new 
      end
  end

  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
  def update
      if @guest.update(guest_params)
        redirect_to root_path, notice: 'Guest was successfully updated.' 
      else
        render :edit 
      end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
     @guest.destroy
      redirect_to root_path, notice: 'Guest was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guest).permit(:name, :bio, :picture)
    end
end
