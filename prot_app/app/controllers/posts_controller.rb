class PostsController < ApplicationController
  
  before_action :set_current_user
  
  def index
    @posts = Post.all.order(created_at: :desc)
    #@users = User.find_by(id: @posts.user_id)
  end

  def show
    @posts = Post.find_by(id: params[:id])
    @users = @posts.user
  end

  def new
    
  end

  def create
    @posts = Post.new(
      content: params[:content],
      user_id: @current_user.id,
      subject: params[:subject]
    )
    if @posts.content == "出席１"
      @posts.save
      flash[:notice] = "出席完了"
      redirect_to("/posts/index")
    else
      flash[:notice] = "キーワードが違います"
      render("/posts/new")
    end
    
  end

  def edit
    @posts = Post.find_by(id: params[:id])
  end

  def update
    @posts = Post.find_by(id: params[:id])
    @posts.content = params[:content]
    @posts.subject = params[:subject]
    @posts.save
    redirect_to("/posts/index")
  end

  def destroy
    @posts = Post.find_by(id: params[:id])
    @posts.destroy
    redirect_to("/posts/index")
  end

end
