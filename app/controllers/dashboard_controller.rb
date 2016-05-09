class DashboardController < ApplicationController
	layout nil
	layout 'application', :except => :login
	before_filter :ensure_log_in, only: [:create, :destroy, :show, :index]
	
  	
	def new
			@classes = Group.new
	end
	def show
		@classes = Group.new
		@group = Group.find(params[:id])
	end
	def index
		@classes = Group.new
	end
	def login
		if logged_in? == false
			render :layout => "ready"
		else
			redirect_to dashboard_index_path
		end
		
	end

	  def create
	    @classes = Group.new(group_params)
	
	      if (@classes.save)
	        redirect_to "/dashboard"
	    else
	      render  "/dashboard"
	    end
	  end
	  def destroy
	    classes = Group.find(params[:id])
	    classes.destroy
	    redirect_to "/dashboard"
	  end

	private
	    def group_params
	  	    params.require(:groups).permit(:title)
	    end
	def ensure_log_in
        if logged_in? == false
            redirect_to login_path
        end
   	end
end
