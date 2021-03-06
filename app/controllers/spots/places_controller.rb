module Spots
  class PlacesController < ApplicationController
    def index
      # raise
      @categories = Category.all
      @districts = District.all
      if params[:category].present?
        @placesCategory = Place.where.not(category: params[:category].to_i)
      else
        @placesCategory = []
      end

      if params[:district].present?
        @placesDistrict = Place.where.not(district: params[:district].to_i)
      else
        @placesDistrict = []
      end

      if params[:budget].present?
        @placesBudget = Place.where.not(price_level: params[:budget].to_i)
      else
        @placesBudget = []
      end

      @places = Place.all - @placesCategory - @placesDistrict - @placesBudget
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
