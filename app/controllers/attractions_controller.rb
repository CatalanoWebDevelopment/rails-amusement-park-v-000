class AttractionsController < ApplicationController
    
    def index
        @attractions = Attraction.all
    end
    
    def new
        @attraction = Attraction.new
    end
    
    def create
        if current_user.admin
            @attraction = Attraction.new(post_params)
                if @attraction.save
                    redirect_to @attraction
                end
        else
            redirect_to root_path
        end
    end
    
    def edit
        if current_user.admin
            @attraction = Attraction.find(params[:id])
        else
            redirect_to root_path
        end     
    end
    
    def update
        if current_user.admin
            @attraction = Attraction.find(params[:id])
            @attraction.update(post_params)
                if @attraction.save
                    redirect_to @attraction
                else
                    render :edit
                end
        else
            redirect_to root_path
        end
    end
    
    def show
        if logged_in?
            @attraction = Attraction.find(params[:id])
            @user = User.find_by_id(logged_in?)
        else
            redirect_to root_path
        end
    end
    
    private
    
    def post_params
        params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
    end
    
end