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

    #sidebar
    @new_lessons = Lesson.select('grade, unit_name, unit_item_name, created_at').order('created_at DESC').limit(3)
    popular_lessons_ids = Learning.group('lesson_id').order('count_lesson_id DESC').count('lesson_id').keys
    @popular_lessons = Lesson.find(popular_lessons_ids)

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

  def tangen

    @grade_unit_item_name = params[:type]

    add_breadcrumb '中学1年生', '/grade1/index'
    add_breadcrumb @grade_unit_item_name

    @grade_lessons = Lesson.where(["unit_item_name = ? and grade = ?", @grade_unit_item_name, 1]).select('id, title, summary, exercise, point')

    @title = '中学1年生数学の' + @grade_unit_item_name
    @description = '中学1年生で勉強する数学の単元「' + @grade_unit_item_name + '」のレッスン一覧です。'

    #sidebar
    @new_lessons = Lesson.select('grade, unit_name, unit_item_name, created_at').order('created_at DESC').limit(3)
    popular_lessons_ids = Learning.group('lesson_id').order('count_lesson_id DESC').count('lesson_id').keys
    @popular_lessons = Lesson.find(popular_lessons_ids)

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

    @grade_unit_item_name = params[:type]
    @lesson = params[:lesson]

    add_breadcrumb '中学1年生', '/grade1/index'
    add_breadcrumb @grade_unit_item_name,'/grade1/'+@grade_unit_item_name
    add_breadcrumb @lesson

    @lesson_info = Lesson.where(:title => @lesson).select('id, title, summary, time, explanation, exercise, exercise_answer, point')

    @title = '中学1年生数学の' + @lesson
    @description = '中学1年生で勉強する数学の単元「' + @grade_unit_item_name + '」の「'+ @lesson +'」内容です。'

    #sidebar
    @new_lessons = Lesson.select('grade, unit_name, unit_item_name, created_at').order('created_at DESC').limit(3)
    popular_lessons_ids = Learning.group('lesson_id').order('count_lesson_id DESC').count('lesson_id').keys
    @popular_lessons = Lesson.find(popular_lessons_ids)

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
end
