# coding utf-8

class MessagesController < ApplicationController
  add_breadcrumb 'Home', '/'

  protect_from_forgery

  before_filter :set_search
  before_filter :authenticate_user!

  def set_search
    @search = Lesson.search(params[:q])
  end


  def create
    @message = Message.new(message_params)
      if @message.save
      redirect_to :back
    else
      render :template => "params[:controller]/params[:action]", :locals => {:friend => @message}
    end
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to :back
    else
      render :template => "params[:controller]/params[:action]", :locals => {:friend => @message}
    end
  end

  private

      def message_params
          params[:message].permit(:friend_id, :user_id, :message_content)
      end


end
