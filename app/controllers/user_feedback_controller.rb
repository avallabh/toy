class UserFeedbackController < ApplicationController
  def index
    @user_feedback = UserFeedback.new
  end

  def create
    @user_feedback = UserFeedback.new(params[:user_feedback])
    @user_feedback.request = request
    if @user_feedback.deliver
      flash[:success] = 'Email sent!'
      redirect_to root_path
    else
      flash[:alert] = 'Error'
      render 'index'
    end
    # rescue ScriptError
    #   flash[:error] = 'Sorry, this message appears to be spam and was not delivered.'
  end
end

