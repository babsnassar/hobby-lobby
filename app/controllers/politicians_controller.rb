class PoliticiansController < ApplicationController
  def index
    if params[:filter] == "age"
      @politicians = Politician.all.order(:age)
    elsif params[:filter] == "price"
      @politicians = Politician.all.order(:price)
    elsif params[:filter] == "location"
      @politicians = Politician.all.order(:location)
    else
      @politicians = Politician.all
    end

    @markers = @politicians.geocoded.map do |politician|
      {
        lat: politician.latitude,
        lng: politician.longitude
      }
    end
  end

  def show
    @politician = Politician.find(params[:id])

  end
end
