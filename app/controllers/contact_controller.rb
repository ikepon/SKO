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

  def new
    add_breadcrumb 'お問合せ'

    @contact = Contact.new

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
