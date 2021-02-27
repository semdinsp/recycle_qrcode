class BinsController < ApplicationController

def index
  #  @bins = Entity.includes(:kv_pairs).all
    @bins = Entity.setIconColorMgr(params['icon']).all
    respond_to do |format|
        format.html
      #  format.json { render json: @bins }
        format.json
        format.csv
      end
end

def googlemaps
  @bins = Entity.all
end

def routemaps
  @bins = Entity.all
end


end
