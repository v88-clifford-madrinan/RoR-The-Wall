class MessagesController < ApplicationController
    def index
        render "messages/index"
    end

    def create
        message = Message.new

        message.user = User.find(session[:user_id])
        message.message = create_params["message"]

        if message.save
            flash[:message] = "Your message is successfully created!"
        else
            flash[:error] = message.errors.full_messages
        end

        redirect_to "/"
    end

    private def create_params
        params.require(:message).permit(:message)
    end
end
