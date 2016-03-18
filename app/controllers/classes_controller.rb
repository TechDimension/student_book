class ClassesController < ApplicationController
	def new
			@classes = Group.new
		end
	def show
		@classes = Group.new
		@student = Student.new
		@group = Group.find(params[:id])
	end

	  def create
	    @classes = Group.new(class_params)
	
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
	   def class_params
	    params.require(:group).permit(:title)
	  end
end
