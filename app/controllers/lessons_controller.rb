# coding utf-8

class LessonsController < ApplicationController

  before_filter :authenticate_user!

  add_breadcrumb 'Home', '/'

  before_filter :authenticate_user!, :except => [:index, :home, :show, :new_lesson,:ranking, :category, :agreement, :privacy]

  protect_from_forgery

  before_filter :set_search

  def set_search
  @search = Lesson.search(params[:q])
  end

  def index

    add_breadcrumb 'レッスン検索結果', '/lessons'

    #検索結果表示
    @search = Lesson.search(params[:q])
    @search_lessons = @search.result.page(params[:page]).per(10)

  end

  def home

    @grade1_units = Lesson.where(:grade => '1').select('unit_name').group('unit_name')
    @grade1_units_all = Lesson.where(:grade => '1').select('unit_name, unit_item_name').group('unit_item_name')
    @grade2_units = Lesson.where(:grade => '2').select('unit_name').group('unit_name')
    @grade2_units_all = Lesson.where(:grade => '2').select('unit_name, unit_item_name').group('unit_item_name')
    @grade3_units = Lesson.where(:grade => '3').select('unit_name').group('unit_name')
    @grade3_units_all = Lesson.where(:grade => '3').select('unit_name, unit_item_name').group('unit_item_name')

  end

  def show
    add_breadcrumb 'レッスン'
    add_breadcrumb @lesson_title, lessons_index_path
  end

  def new_lesson

    add_breadcrumb '新着レッスン'

    @title = '新着レッスン一覧'
    @description = '新しく追加したレッスン一覧を紹介しています。'

    @new_lessons_main = Lesson.select('grade, unit_name, unit_item_name, created_at').order('created_at DESC')

  end

  def ranking
    add_breadcrumb '人気レッスン'

    @title = '人気レッスン一覧'
    @description = 'ユーザに利用されているレッスンのランキングを紹介しています。'

    popular_lessons_id = Learning.group('lesson_id').order('count_lesson_id DESC').count('lesson_id').keys
    @popular_lessons_main = Lesson.find(popular_lessons_id)

  end

  def category

    add_breadcrumb 'レッスンカテゴリー'

    @title = 'レッスンカテゴリ一覧'
    @description = '各学年、各単元をカテゴリーに分けて紹介しています。'

    @categories = Lesson.select('category_name').group('category_name')
    @category_lessons_all = Lesson.select('grade, category_name, unit_name, unit_item_name').group('unit_item_name')

  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def agreement

    add_breadcrumb '利用規約'

    @title = '利用規約'
    @description = '当サイトの利用にあたっての規約ページとなります。'

    @rule = Agreement.all(:order => "created_at DESC", :limit => 1)

    render 'rule'

  end

  def privacy

    add_breadcrumb 'プライバシーポリシー'

    @title = 'プライバシーポリシー'
    @description = '当サイトで取得した個人情報の取り扱いに関するページになります。'

    @rule = Privacy.all(:order => "created_at DESC", :limit => 1)

    render 'rule'

  end
end
