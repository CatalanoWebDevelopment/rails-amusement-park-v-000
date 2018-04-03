class UsersController < ApplicationController
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(post_params)
        
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end
    
    def show
        @user = User.find(params[:id])
        
        if session[:user_id] == @user.id
            render :show
        else
            redirect_to root_path
        end
    end
    
    private
    
    def post_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
    
end