# coding: utf-8

class ContactController < ApplicationController

  add_breadcrumb 'Home', '/'

  before_filter :authenticate_user!, :except => [:index, :new, :create]

  protect_from_forgery

  before_filter :set_search

  def set_search
  @search = Lesson.search(params[:q])
  end

  def index
    add_breadcrumb 'お問合せ完了'

    @notice = params[:notice]
  end

  def new
    add_breadcrumb 'お問合せ'

    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.sent(@contact).deliver
      redirect_to :action => :index, :notice => 'お問い合わせありがとうございました。'
    else
      render :action => :new, :alert => 'お問い合わせに不備があります。'
    end
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :inquiry, :content)
  end
end
