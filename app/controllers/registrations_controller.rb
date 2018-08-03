# app/controllers/registrations_controller.rb

class RegistrationsController < Devise::RegistrationsController
    def new
      super
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to @user
      else


      end

      # add custom create logic here
    end
  
    def update
      super
    end
    private
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :company_id)
      end
  end 