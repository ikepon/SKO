class LessonsController < ApplicationController

  before_filter :authenticate_user!

  add_breadcrumb 'Home', '/'

  before_filter :authenticate_user!, :except => [:index, :home, :show, :new_lesson, :category, :agreement, :privacy]

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

    #sidebar
    @new_lessons = Lesson.select('grade, unit_name, unit_item_name, created_at').order('created_at DESC').limit(3)
    @popular_lessons_all = Learning.select('lesson_id').group('lesson_id').order('count_lesson_id DESC').count('lesson_id').keys
    # @popular_lessons = Lesson.find(@popular_lessons_all).select('lesson_grade, lesson_unit_name')

    @users_total = User.all.count()
    @users_grade = User.group('grade').count('grade')

    @complete_lessons = Learning.where(:status => true).count()
    @check_lessons = Learning.where(:check => true).count()
    if @users_total != 0
      @average_comp = @complete_lessons / @users_total
      @average_check = @check_lessons / @users_total
    else
      @average_comp = 0
      @average_check = 0
    end

    #footer
    @footer_grade1 = Lesson.where(:grade => '1').select('unit_name').group('unit_name')
    @footer_grade2 = Lesson.where(:grade => '2').select('unit_name').group('unit_name')
    @footer_grade3 = Lesson.where(:grade => '3').select('unit_name').group('unit_name')
    @footer_categories = Lesson.select('category_name').group('category_name')
  end

  def home

    @grade1_units = Lesson.where(:grade => '1').select('unit_name').group('unit_name')
    @grade1_units_all = Lesson.where(:grade => '1').select('unit_name, unit_item_name').group('unit_item_name')
    @grade2_units = Lesson.where(:grade => '2').select('unit_name').group('unit_name')
    @grade2_units_all = Lesson.where(:grade => '2').select('unit_name, unit_item_name').group('unit_item_name')
    @grade3_units = Lesson.where(:grade => '3').select('unit_name').group('unit_name')
    @grade3_units_all = Lesson.where(:grade => '3').select('unit_name, unit_item_name').group('unit_item_name')

    #sidebar
    @new_lessons = Lesson.select('grade, unit_name, unit_item_name, created_at').order('created_at DESC').limit(3)
    @popular_lessons_all = Learning.select('lesson_id').group('lesson_id').order('count_lesson_id DESC').count('lesson_id').keys
    # @popular_lessons = Lesson.find(@popular_lessons_all).select('lesson_grade, lesson_unit_name')

    @users_total = User.all.count()
    @users_grade = User.group('grade').count('grade')

    @complete_lessons = Learning.where(:status => true).count()
    @check_lessons = Learning.where(:check => true).count()
    if @users_total != 0
      @average_comp = @complete_lessons / @users_total
      @average_check = @check_lessons / @users_total
    else
      @average_comp = 0
      @average_check = 0
    end

    #footer
    @footer_grade1 = Lesson.where(:grade => '1').select('unit_name').group('unit_name')
    @footer_grade2 = Lesson.where(:grade => '2').select('unit_name').group('unit_name')
    @footer_grade3 = Lesson.where(:grade => '3').select('unit_name').group('unit_name')
    @footer_categories = Lesson.select('category_name').group('category_name')
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

    #sidebar
    @new_lessons = Lesson.select('grade, unit_name, unit_item_name, created_at').order('created_at DESC').limit(3)
    @popular_lessons_all = Learning.select('lesson_id').group('lesson_id').order('count_lesson_id DESC').count('lesson_id').keys
    # @popular_lessons = Lesson.find(@popular_lessons_all).select('lesson_grade, lesson_unit_name')

    @users_total = User.all.count()
    @users_grade = User.group('grade').count('grade')

    @complete_lessons = Learning.where(:status => true).count()
    @check_lessons = Learning.where(:check => true).count()
    if @users_total != 0
      @average_comp = @complete_lessons / @users_total
      @average_check = @check_lessons / @users_total
    else
      @average_comp = 0
      @average_check = 0
    end

    #footer
    @footer_grade1 = Lesson.where(:grade => '1').select('unit_name').group('unit_name')
    @footer_grade2 = Lesson.where(:grade => '2').select('unit_name').group('unit_name')
    @footer_grade3 = Lesson.where(:grade => '3').select('unit_name').group('unit_name')
    @footer_categories = Lesson.select('category_name').group('category_name')
  end

  def category

    add_breadcrumb 'レッスンカテゴリー'

    @title = 'レッスンカテゴリ一覧'
    @description = '各学年、各単元をカテゴリーに分けて紹介しています。'

    @categories = Lesson.select('category_name').group('category_name')
    @category_lessons_all = Lesson.select('grade, category_name, unit_name, unit_item_name').group('unit_item_name')

    #sidebar
    @new_lessons = Lesson.select('grade, unit_name, unit_item_name, created_at').order('created_at DESC').limit(3)
    @popular_lessons_all = Learning.select('lesson_id').group('lesson_id').order('count_lesson_id DESC').count('lesson_id').keys
    # @popular_lessons = Lesson.find(@popular_lessons_all).select('lesson_grade, lesson_unit_name')

    @users_total = User.all.count()
    @users_grade = User.group('grade').count('grade')

    @complete_lessons = Learning.where(:status => true).count()
    @check_lessons = Learning.where(:check => true).count()
    if @users_total != 0
      @average_comp = @complete_lessons / @users_total
      @average_check = @check_lessons / @users_total
    else
      @average_comp = 0
      @average_check = 0
    end

    #footer
    @footer_grade1 = Lesson.where(:grade => '1').select('unit_name').group('unit_name')
    @footer_grade2 = Lesson.where(:grade => '2').select('unit_name').group('unit_name')
    @footer_grade3 = Lesson.where(:grade => '3').select('unit_name').group('unit_name')
    @footer_categories = Lesson.select('category_name').group('category_name')
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

    #sidebar
    @new_lessons = Lesson.select('grade, unit_name, unit_item_name, created_at').order('created_at DESC').limit(3)
    @popular_lessons_all = Learning.select('lesson_id').group('lesson_id').order('count_lesson_id DESC').count('lesson_id').keys
    # @popular_lessons = Lesson.find(@popular_lessons_all).select('lesson_grade, lesson_unit_name')

    @users_total = User.all.count()
    @users_grade = User.group('grade').count('grade')

    @complete_lessons = Learning.where(:status => true).count()
    @check_lessons = Learning.where(:check => true).count()
    if @users_total != 0
      @average_comp = @complete_lessons / @users_total
      @average_check = @check_lessons / @users_total
    else
      @average_comp = 0
      @average_check = 0
    end

    #footer
    @footer_grade1 = Lesson.where(:grade => '1').select('unit_name').group('unit_name')
    @footer_grade2 = Lesson.where(:grade => '2').select('unit_name').group('unit_name')
    @footer_grade3 = Lesson.where(:grade => '3').select('unit_name').group('unit_name')
    @footer_categories = Lesson.select('category_name').group('category_name')

    render 'rule'

  end

  def privacy

    add_breadcrumb 'プライバシーポリシー'

    @title = 'プライバシーポリシー'
    @description = '当サイトで取得した個人情報の取り扱いに関するページになります。
    '

    @rule = Privacy.all(:order => "created_at DESC", :limit => 1)

    #sidebar
    @new_lessons = Lesson.select('grade, unit_name, unit_item_name, created_at').order('created_at DESC').limit(3)
    @popular_lessons_all = Learning.select('lesson_id').group('lesson_id').order('count_lesson_id DESC').count('lesson_id').keys
    # @popular_lessons = Lesson.find(@popular_lessons_all).select('lesson_grade, lesson_unit_name')

    @users_total = User.all.count()
    @users_grade = User.group('grade').count('grade')

    @complete_lessons = Learning.where(:status => true).count()
    @check_lessons = Learning.where(:check => true).count()
    if @users_total != 0
      @average_comp = @complete_lessons / @users_total
      @average_check = @check_lessons / @users_total
    else
      @average_comp = 0
      @average_check = 0
    end

    #footer
    @footer_grade1 = Lesson.where(:grade => '1').select('unit_name').group('unit_name')
    @footer_grade2 = Lesson.where(:grade => '2').select('unit_name').group('unit_name')
    @footer_grade3 = Lesson.where(:grade => '3').select('unit_name').group('unit_name')
    @footer_categories = Lesson.select('category_name').group('category_name')

    render 'rule'

  end
end
