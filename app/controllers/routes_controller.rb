class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :move]

  def index
    @myroutes=Route.all
  end

  def show
   @dragController="drag"
   @dragController="nodrag" if params['drag']=='nodrag'
   @route_members=@myroute.route_members
  end


  def move
    puts "Move parameters are #{params}"
    rm=RouteMember.find(params['rm'])
    if !rm.nil? then
      rm.insert_at(params[:position].to_i)
      puts "update rm position to #{rm.position}"
      rm.save
    else
      puts "rm is nil for #{params}"
    end
    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_route
      @myroute = Route.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def route_params
      params.require(:route).permit(:name, :drag)
    end
end
