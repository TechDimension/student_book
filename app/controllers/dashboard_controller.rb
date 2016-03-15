class DashboardController < ApplicationController
	def new
			@classes = Group.new
		end
	 	def show
		@classes = Group.new
		@group = Group.find(params[:id])
	end

	  def create
	    @classes = Group.new(student_params)
	
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
	   def student_params
	    params.require(:classes).permit(:title)
	  end
end
