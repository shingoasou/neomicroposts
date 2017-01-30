class NeomicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    
    def create
        @neomicropost = current_user.neomicroposts.build(neomicropost_params)
        if @neomicropost.save
            flash[:success] = "Neomicropost created!!"
            redirect_to root_url
        else
            render 'users#new'
        end
    end
    
    def destroy
        @neomicropost = current_user.neomicroposts.find_by(id: params[:id])
        return redirect_to root_url if @neomicropost.nil?
        @neomicropost.destroy
        flash[:success] ="Neomicropost deleted"
        redirect_to request.referrer || root_url
    end
    
    private
    def neomicropost_params
        params.require(:neomicropost).permit(:content)
    end
end