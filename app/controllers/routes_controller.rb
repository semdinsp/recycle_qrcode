class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :move, :tile]

  def index
    @myroutes=Route.all
  end


  # show shows the route in order and allows drag and drop sorting
  # by default drag enabled but set parameter to nodrag eg url?drag=nodrag to disable dragController
  # on phones it is best to view drag in portrait mode so there is a part of the screen you can
  # scroll on
  #
  # @param= drag  adjust if drag and draop is enabled
  def show
   setup_variables(params)

  end

  def tile
    setup_variables(params)
  end

  def collections
    @pickups=Actiontype.order("created_at DESC").references(:entities).page(params[:page]) if !request.format.csv?
    @pickups=Actiontype.order("created_at DESC").limit(1000)   if request.format.csv?
    respond_to do |format|
        format.html
      #  format.json { render json: @bins }
        format.json
        format.csv
      end
  end

def mercycorpinvoice
  @bins=Entity.all
  log_message({format_type: request.format, params: params})
  #puts "format type is #{request.format} params #{params}"
  respond_to do |format|
      #  format.html
      #  format.json { render json: @bins }
      format.csv
    end
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
      #puts "set route #{params}"
      @myroute = Route.find(params[:id])
      puts "set route #{@myroute.inspect}"
    end

    def setup_variables(params)
      @dragController="drag"
      @dragController="nodrag" if params['drag']=='nodrag'
      @route_members=@myroute.route_members
      Entity.setIconColorMgr('normal')

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def route_params
      params.require(:route).permit(:name, :drag)
    end
end
