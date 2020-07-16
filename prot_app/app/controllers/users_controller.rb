class UsersController < ApplicationController

  before_action :set_current_user
  before_action :ensure_current_user,{only:[:edit,:update]}

  def ensure_current_user
    if @current_user.id != params[:id].to_i
        flash[:notice] = "権限がありません"
        redirect_to("/posts/index")
    end
  end

  #-----------------    科目関連仮設--------------------

  def atend_subject
    
  end

  def create_subject

  end

  def main_subject
    
    
  end

  def keyword_subject
    
  end

  #---------------- --------------------------------------------
  def login_form
    
  end

  def login
    @users = User.find_by(email: params[:email], password: params[:password])

    if @users
      session[:user_id] = @users.id
      flash[:notice] = "ログインしました！"
      redirect_to("/posts/index")
    else
      @error_message = "メールアドレスまたはパスワードに問題があります"
      @email = params[:email]
      @password = params[:password]
      render("/users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[notice] = "ログアウトしました"
    redirect_to("/login")
  end

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @users = User.find_by(id: params[:id])
  end

  def new
    
  end

  def create
    @users = User.new(name: params[:name],email: params[:email],GID: params[:GID], password: params[:password])
    if @users.save
      flash[:notice] = "ユーザー登録が完了しました"
      session[:user_id] = @users.id
      redirect_to("/posts/index")
    else
      render("/users/new")
    end
  end

  def edit
    @users = User.find_by(id: params[:id])
  end

  def update
    @users = User.find_by(id: params[:id])
    @users.name = params[:name]
    @users.GID = params[:GID]
    @users.email = params[:email]
    if @users.save
      flash[:notice] = "ユーザー情報変更完了！"
      redirect_to("/users/#{@users.id}")
    else
      flash[:notice] = "ユーザー情報変更未完了！"
      render("/users/edit")
    end
  end
end



