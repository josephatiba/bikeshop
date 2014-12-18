class BikesController < ApplicationController
	def index
		@bikes = Bike.all
	end

	def show
		@bike= Bike.find(params[:id])
	end

	def new
		@bike = Bike.new
	end

	def create
		@bike = Bike.new(bike_params)

		if @bike.save
			redirect_to new_bike_path
		else
			render "new"
		end

	end

	def edit
    	@bike = Bike.find(params[:id])
  	end

	def update
    	@bike = Bike.find(params[:id])
    	if @bike.update_attributes(bike_params)
      	redirect_to bike_path(@bike)
    	else
      	render :edit
    	end
 	 end

  	def destroy
    	@bike = Bike.find(params[:id])
    	if @bike.destroy
      	redirect_to bikes_path
    	else
      	redirect_to bike_path(@bike)
    	end
  	end

  	private

  	def bike_params
		params.require(:bike).permit(:name, :brand, :speed)
	end

end