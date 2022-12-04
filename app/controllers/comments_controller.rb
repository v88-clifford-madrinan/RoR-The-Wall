class CommentsController < ApplicationController
    def create
        flash[:message_id] =create_params["message_id"]
        comment = Comment.new

        comment.user = User.find(session[:user_id])
        comment.comment = create_params["comment"]
        comment.message = Message.find(create_params["message_id"])

        if comment.save
            flash[:comments_message] = "You successfully created a comment for this message!"
        else
            flash[:comments_error] = comment.errors.full_messages
        end

        redirect_to "/"
    end

    private def create_params
        params.require(:comment).permit(:comment, :message_id)
    end
end
