class StudentsController < ApplicationController
	before_action :ensure_log_in, only: [:create, :new]
		def new
			@student = Student.new
		end
	  def create
	    @student = Student.new(student_params)
	
	      if (@student.save)
	        redirect_to "/classes/#{@student.classes_id}"
	    else
	      render  "/classes/show"
	    end
	  end
	   def destroy
	    student = Student.find(params[:id])
	    student.destroy
	    redirect_to "/classes/1"
	  end

	 private
	   def student_params
	    params.require(:student).permit(:forename, :surname, :grade_predicted, :classes_id)
	  end

	  def ensure_log_in
        if logged_in? == false
            redirect_to login_path
        end
   end
end
