class BinsController < ApplicationController

def index
    @bins = Entity.all
    respond_to do |format|
        format.html
      #  format.json { render json: @bins }
        format.json 
        format.csv
      end
end

def googlemaps
  puts "in google maps"
  @bins = Entity.all
end

end
