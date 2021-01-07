module spots
  class PlacesController < ApplicationController
    def index
      @places = Place.all

      @markers = @places.geocoded.map do |place|
        {
          lat: place.latitude,
          lng: place.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { place: place })
        }
      end
    end

    def show
      @place = Place.find(params[:id])
      @comments = Comment.where(place_id: @place.id)
      @comment = Comment.new
    end

    def new
      @place = Place.new
    end

    def create
      @place = Place.new(place_params)
      if @place.save
        redirect_to place_path(@place)
      else
        render :new
      end
    end

    def edit
      @place = Place.find(params[:id])
    end

    def update
      @place = Place.find(params[:id])
      @place.update(place_params)
      redirect_to place_path(@place)
    end

    def destroy
      @place = Place.find(params[:id])
      @place.destroy
      redirect_to places_path
    end

    private

    def place_params
      params.require(:place).permit(:name, :address, :price_level, :category_id, :district_id)
    end
  end
end
