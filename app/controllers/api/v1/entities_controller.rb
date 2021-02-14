module Api
 module V1
    class EntitiesController < ApplicationController
      before_action :set_entity, only: [:show, :checkin ]
      # before_action :authorized


      # GET /locations
     # curl -H "Content-Type: application/json" -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.CCFshmdzekkCKEtOyvOKSGKGHjLM-U_AWS3qySJ9xPA" http://localhost:5000/v1/teams
      def checkin
        @location=Location.first

        puts "CHECKIN  entity #{@entity.inspect}  location: #{@location.inspect}"
        EntityCheckinAction.execute(entity: @entity, location: @location)
        render json: @entity
      end


      def show
        render json: @entity
      end


      # DELETE /teams/1
      def destroy
        set_entity(params['id'])
        destroy_via_inactive_item(@entity)
      end

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
          params.require(:entity).permit( :user,  :entity_id, :id )
        end
    end
  end
end
