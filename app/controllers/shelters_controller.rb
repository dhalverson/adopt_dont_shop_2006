class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find_by(id:params[:id])
  end

  def new
  end

  def create
    @new_shelter = Shelter.new({
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip]
      })

    @new_shelter.save

    redirect_to '/shelters'
  end

# private
#
#   def shelter_params
#     params.permit(:name, :address, :city, :state, :zip)
#   end

end
