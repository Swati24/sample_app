class UsersController < ApplicationController

  before_filter :authenticate_user!
  before_filter :validate_record_exists, only: [:show, :notify_editor, :destroy]
  load_and_authorize_resource

  def show
    if current_user.role? :reporter and current_user != @user
      @articles = @user.articles.published.includes(:user).paginate(page: params[:page], per_page: 5)
    else
      @articles = @user.articles.includes(:user).paginate(page: params[:page], per_page: 5)
    end
  end

  def create_editor
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, notice: 'Editor was successfully created.'
    else
      render action: "new"
    end
  end

  def new_editor
    @user = User.new
  end

  def notify_editor
    @user.notify_via_email
    redirect_to :back, notice: "Email sent!!"
  end

  def editors
    @editors = User.editors.paginate(page: params[:page], per_page: 10)
  end

  def destroy
    @user.destroy
    redirect_to editors_path, notice: "Editor deleted"
  end

  private

    def validate_record_exists
      @user = User.find_by_id(params[:id])
      if @user.nil?
        flash[:error] = "Record doesn't exist"
        redirect_to root_path and return
      end
    end
end
