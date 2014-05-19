# coding utf-8

class FriendsController < ApplicationController

  add_breadcrumb 'Home', '/'

  protect_from_forgery

  before_filter :set_search
  # before_filter :authenticate_user!, :except => [:index, :home, :show, :new_lesson,:ranking, :category, :agreement, :privacy]

  def set_search
  @search = Lesson.search(params[:q])
  end

  def index

    add_breadcrumb '友達'

    @user_id = '1'
    # @user_id = current_user.id

    @search_users = User.where.not(:id => @user_id)

    @search_form = SearchForm.new params[:search_form]
    if @search_form.q.present?
      @search_users = @search_users.named @search_form.q
    end
    if @search_form.sex.present?
      @search_users = @search_users.sexed @search_form.sex
    end
  end

  def show

    add_breadcrumb '友達詳細'

  end

  def search

    add_breadcrumb '友達検索'

  end
end
