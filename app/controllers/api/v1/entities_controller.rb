module Api
 module V1
    class EntitiesController < ApplicationController
      before_action :set_entity, only: [:show, :checkin ]
      # before_action :authorized


     # checkin
     # checkin or collect a bin  (this does an action at an entity with a qrcode)
     # an example url is: http://scotts-macbook-pro-2.local:3000/v1/entities/checkin.json?id=9200d1d2-ddc7-47b4-a46b-9e55afd7a4a9
     # When the checkin is called the service action is executed
     # format of response defined by call.  either .json or html with no format
     # @param id= entity

      def checkin
        @location=Location.first
        log_message({entity: @entity.inspect, params: params})
        @bin=@entity
        Entity.setIconColorMgr('normal')  #evenutally checkin color mgmt
        ctx=EntityCheckinAction.execute(entity: @entity, location: @location)
        @at=ctx.actiontype  # at will be nil if not first during day
        puts "action type is #{@at}"
        respond_to do |format|
            format.html  {render "checkin"}
            format.json {   render json: @entity}
          end
      end

      # checkin_location_set
      # define and set the location for a checkin or collection
      # eg when someone reads the bar code on the bin log where the bar code was read
      # eventually return error if set in wrong place

      def checkin_location_set
          # create new location and link to actiontype
          log_message({format_type: request.format, params: params})
          #  data.set('latitude', crd.latitude);
          # data.set('longitude', crd.longitude);
          # data.set('actiontype', "#{@at.id}");
          at=Actiontype.find(params['actiontype'])
          loc=Location.new
          loc.latitude=params['latitude']
          loc.longitude=params['longitude']
          at.location=loc
          loc.save
          at.save
          log_message({actiontype: at, location: loc})
          head :ok
      end


      def show
        render json: @entity
      end


      # DELETE /teams/1
    #  def destroy
  #      set_entity(params['id'])
  #      destroy_via_inactive_item(@entity)
  #    end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_entity
          # need to limit to only the user involved...
          puts "set enttity params #{params}"
          @entity = Entity.find(params['id'])
        end

        # Only allow a trusted parameter "white list" through.
        def entity_params
          #@activity=set_team(params[:metric][:activity_id]) if !params[:metric][:activity_id].nil?
          params.require(:entity).permit( :user,  :entity_id, :id, :actiontype, :latitude, :longitude, :accuracy  )
        end
    end
  end
end
