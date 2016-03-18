class UserFilesController < ApplicationController
   def index
      @user_files = UserFile.all
      @user_file = UserFile.new
   end
   
   def new
      @user_file = UserFile.new
   end
   
   def create
      @user_file = UserFile.new(user_file_params)
      
      if @user_file.save
         redirect_to dashboard_index_path, notice: "The file #{@user_file.name} has been uploaded."
      else
         render "new"
      end
      
   end
   
   def destroy
      @user_file = UserFile.find(params[:id])
      @user_file.destroy
      redirect_to dashboard_index_path, notice:  "The file #{@user_file.name} has been deleted."
   end
   
   private
      def user_file_params
      params.require(:user_file).permit(:name, :attachment)
   end
end
