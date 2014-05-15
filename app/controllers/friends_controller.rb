# coding utf-8

class FriendsController < ApplicationController

  add_breadcrumb 'Home', '/'

  protect_from_forgery

  before_filter :set_search

  def set_search
  @search = Lesson.search(params[:q])
  end

  def index

    add_breadcrumb '友達'

  end

  def show

    add_breadcrumb '友達詳細'

  end

  def search

    add_breadcrumb '友達検索'

  end
end
