module Api
 module V1
    class EntitiesController < ApplicationController
      before_action :set_entity, only: [:show, :checkin ]
      # before_action :authorized
      

      # GET /locations
     # curl -H "Content-Type: application/json" -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.CCFshmdzekkCKEtOyvOKSGKGHjLM-U_AWS3qySJ9xPA" http://localhost:5000/v1/teams
      def checkin
        set_activity(params['activity_id'])
        @metrics=[]
        @metrics = @activity.metrics.active_scope.order("created_at DESC").all  if !@activity.nil?  #needs only linked to user
        puts "INDEXS  activity #{@activity.inspect} metrics: #{@metrics.count}"
        render json: @metrics
      end
      
      
      def show
        render json: @metric
      end
      

      # DELETE /teams/1
      def destroy
        set_metric
        destroy_via_inactive_item(@metric)
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_entity(act_id)
          # need to limit to only the user involved...
          @entity = Entity.find(act_id)
        end
        
        # Only allow a trusted parameter "white list" through.
        def entity_params
          #@activity=set_team(params[:metric][:activity_id]) if !params[:metric][:activity_id].nil?
          params.require(:entity).permit( :user,  :entity_id )
        end
    end
  end
end

