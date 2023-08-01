class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index 
        campers = Camper.all
        render json: campers
    end

    def show 
        camper = Camper.find_by(id: params[:id])
        if camper
        render json: camper, serializer: CamperShowSerializer
        else 
            render json: {
            "error": "Camper not found"
          }, status: :not_found
         
        end
    end
        def create 
         
            camper = Camper.create!(strong_params)
            
            render json: camper, status: :created
        
        end
        private 

        def strong_params 
            params.permit(:name,:age)
        
        end
        

        def render_not_found_response
            render json: { error: "Camper not found" }, status: :not_found
        end
        
         def render_unprocessable_entity_response(exception)
            render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
         end
        
       
           
          
            
   
          
    
end
