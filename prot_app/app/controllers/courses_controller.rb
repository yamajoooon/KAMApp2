class CoursesController < ApplicationController
  
  before_action :set_current_user
  
  def index
    @courses = Course.where(admin_user_id: session[:user_id])
  end

  def main
    @courses = Course.find_by(id: params[:id])
  end

  def new
    
  end

  def create
    @courses = Course.new(
      name: params[:name],
      tname: params[:tname],
      admin_user_id: @current_user.id
    )

    if @courses.name.present? and @courses.tname.present?
      @courses.save
      redirect_to("/courses/index")
    else
      flash[:notice] = "科目名または担当教官名が入力されていません"
      render("/courses/new")
    end

  end


  def edit_member
    @users = User.all.order(created_at: :desc)
    @courses = Course.find_by(id: params[:id])
    @add_user_to_groups = AddUserToGroup.where(group_id: params[:id]).pluck(:user_id)
  end

  def add_user_to_group
    AddUserToGroup.create(user_id: params[:user_id], group_id: params[:group_id])
    flash[:notice] = "新しくメンバーを追加しました"
    redirect_to("/courses/#{params[:group_id]}/edit_member")
  end

  def show_member
    @courses = Course.find_by(id: params[:id])
    @add_user_to_groups = AddUserToGroup.where(group_id: params[:id])

  end

  def destroy
    @courses = Course.find_by(id: params[:id])
    @add_user_to_groups = AddUserToGroup.find_by(user_id: params[:user_id], group_id: params[:group_id])
    
    @add_user_to_groups.destroy
    flash[:notice] = "メンバーを削除しました"
    redirect_to("/courses/#{@courses.id}/show_member")
  end

  def edit_keyword
    @courses = Course.find_by(id: params[:id])
  end


  def update_keyword
    @courses = Course.find_by(id: params[:id])
    @courses.keyword = params[:keyword]

    if @courses.keyword.present?
      @courses.save
      flash[:notice] = "キーワードを変更しました"
      redirect_to("/courses/#{@courses.id}")
    else
      flash[:notice] = "必ずキーワードを入力してください"
      redirect_to("/courses/#{@courses.id}/edit_keyword")
    end
  end


#------------------------------出席登録------------------------------------

  def courses_index
    @add_user_to_groups = AddUserToGroup.where(user_id: session[:user_id])
    
  end

  def new_atend
    @courses = Course.find_by(id: params[:id])
  end

  def create_atend
    @courses = Course.find_by(id: params[:id])

    @posts = Post.new(
      content: params[:keyword],
      user_id: @current_user.id,
      subject: @courses.name
    )

    if @posts.content == @courses.keyword
      @posts.save
      flash[:notice] = "出席完了"
      redirect_to("/posts/index")
    else
      flash[:notice] = "キーワードが違います"
      redirect_to("/courses/#{@courses.id}/new_atend")
    end

  end

  #------------------------------授業時間登録------------------------------------

  def new_time
    @courses = Course.find_by(id: params[:id])

  end

  def show_time
    @courses = Course.find_by(id: params[:id])
    @add_courses_time = AddCourseTime.where(course_id: params[:id])
  end

  def create_time
    @courses = Course.find_by(id: params[:id])

    @add_courses_time = AddCourseTime.new(
      held_day: params[:held_day],
      held_hour: params[:held_hour],
      course_id: @courses.id
    )

    if @add_courses_time.held_day.present? && @add_courses_time.held_hour.present?
      @add_courses_time.save
      flash[:notice] = "#{@add_courses_time.held_day}登録"
      redirect_to("/courses/#{@courses.id}/new_time")
    else
      flash[:notice] = "授業日または授業開始時が入力されてません"
      redirect_to("/courses/#{@courses.id}/new_time")
    end

    
  end

  def destroy_time

    @courses = Course.find_by(id: params[:id])
    @add_course_times = AddCourseTime.find_by(
      held_day: params[:held_day], 
      held_hour: params[:held_hour],
      course_id: params[:course_id]
    )
    
    flash[:notice] = "#{@add_course_times.held_day}分を削除しました"
    @add_course_times.destroy
    # flash[:notice] = "授業日を削除しました"
    redirect_to("/courses/#{@courses.id}/show_time")
  end
  #-------------------------------出席日別表示------------------------------------------------------

  def show_atend
    @courses = Course.find_by(id: params[:id])
    @held_day = params[:held_day]
    @today_atend = Post.where(subject: @courses.name, created_at: params[:held_day].in_time_zone.all_day)

    @add_user_to_groups = AddUserToGroup.where(group_id: params[:id]).all.order("id DESC")
  end


end




  
