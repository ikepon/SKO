# coding utf-8

class FaqController < ApplicationController

  add_breadcrumb 'Home', '/'

  before_filter :set_search

  def set_search
  @search = Lesson.search(params[:q])
  end

  def index

    add_breadcrumb 'よくある質問'

    @title = 'よくある質問'
    @description = '当サイトによせられる、よくある質問一覧です。'

    @faqs = Faq.all

  end
end
