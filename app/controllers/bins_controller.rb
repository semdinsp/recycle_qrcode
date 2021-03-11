class BinsController < ApplicationController

  before_action :set_bin, only: [:report, :collectmap, :collectpoints]


def index
  #  @bins = Entity.includes(:kv_pairs).all
    @bins = Entity.setIconColorMgr(params['icon']).all
    respond_to do |format|
        format.html
        format.json
        format.csv
      end
end

def report

end

def collectpoints
  Entity.setIconColorMgr('collection')
  @bins =[@mybin]
  @mybin.actiontypes.order('created_at DESC').limit(10).each { |at| @bins << at }
  puts "Hello in collect points #{@mybin.inspect}"
  respond_to do |format|
      format.html
      format.json
      format.csv
    end
end

def collectmap

end


def googlemaps
#  @bins = Entity.all
end

def routemaps
#  @bins = Entity.all
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_bin
    @mybin = Entity.find(params[:bin_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bin_params
    params.require(:entity).permit(:name, :etype, :status)
  end


end
