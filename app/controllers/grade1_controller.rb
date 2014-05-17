class Grade1Controller < ApplicationController
  add_breadcrumb 'Home', '/'

  before_filter :authenticate_user!, :except => [:index, :tangen, :show]

  protect_from_forgery

  before_filter :set_search

  def set_search
  @search = Lesson.search(params[:q])
  end

  def index

    @grade = '中学1年生'

    add_breadcrumb @grade

    @title = @grade + '数学の単元一覧'
    @description = @grade + 'で勉強する数学の単元一覧です。'

    @grade_units = Lesson.where(:grade => '1').select('unit_name').group('unit_name')
    @grade_units_all = Lesson.where(:grade => '1').select('unit_name, unit_item_name').group('unit_item_name')

  end

  def tangen

    @grade_unit_item_name = params[:type]

    add_breadcrumb '中学1年生', '/grade1/index'
    add_breadcrumb @grade_unit_item_name

    @grade_lessons = Lesson.where(["unit_item_name = ? and grade = ?", @grade_unit_item_name, 1]).select('id, title, summary, exercise, point')

    @title = '中学1年生数学の' + @grade_unit_item_name
    @description = '中学1年生で勉強する数学の単元「' + @grade_unit_item_name + '」のレッスン一覧です。'

  end

  def show

    @grade_unit_item_name = params[:type]
    @lesson = params[:lesson]

    add_breadcrumb '中学1年生', '/grade1/index'
    add_breadcrumb @grade_unit_item_name,'/grade1/'+@grade_unit_item_name
    add_breadcrumb @lesson

    @lesson_info = Lesson.where(:id => @lesson).select('id, title, summary, time, explanation, exercise, exercise_answer, point')

    @title = '中学1年生数学の' + @lesson_info[0].title
    @description = '中学1年生で勉強する数学の単元「' + @grade_unit_item_name + '」の「' + @lesson_info[0].title + '」内容です。'

  end
end
