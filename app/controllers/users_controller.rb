class UsersController < ApplicationController
    def login
        render "users/login"
    end

    def new
        render "users/register"
    end

    def create
        if create_params["password"] == ""
            # MAKING SURE THAT PASSWORD IS NOT EMPTY, IF IT IS, THEN CREATE THE MESSAGE THEN REDIRECT TO /register
            flash[:message] = "Password is required!"
            redirect_to "/register"
        elsif create_params["password_confirmation"] == ""
            # MAKING SURE THAT PASSWORD CONFIRMATION IS NOT EMPTY, IF IT IS, THEN CREATE THE MESSAGE THEN REDIRECT TO /register
            flash[:message] = "Password confirmation is required!"
            redirect_to "/register"
        elsif create_params["password"] != create_params["password_confirmation"]
            # MAKING SURE THAT PASSWORD AND PASSWORD CONFIRMATION MATCHES, IF IT IS, THEN CREATE THE MESSAGE THEN REDIRECT TO /register
            flash[:message] = "Password doesn't match!"
            redirect_to "/register"
        else
            # IF INITIAL REQUIREMENT WAS MET PROCEED ON SAVING THE USER INPUT
            # INITIAL REQUIREMENT WAS CREATED BECAUSE WE DON'T FRONTEND VALIDATION
            user = User.new
    
            user.first_name = create_params["first_name"]
            user.last_name = create_params["last_name"]
            user.email = create_params["email"]
            user.password = create_params["password"]
    
            if user.save
                # IF THE USER IS SUCCESSFULLY CREATED THEN CREATE THE MESSAGE AND REDIRECT TO /
                flash[:message] = "Your account is successfully created!"
                session[:user_id] = user.id
                redirect_to "/"
            else
                # IF USER INPUTS ARE INVALID THEN GET THE ERROR MESSAGES THEN RETURN TO "/register"
                flash[:error] = user.errors.full_messages
                redirect_to "/register"
            end
        end
    end

    private def create_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
