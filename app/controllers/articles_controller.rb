class ArticlesController < ApplicationController
  #Before filter to implement authorization.
  before_filter :authenticate_user!, :except => [:index, :show, :publish]
  before_filter :validate_record_exists, only: [:show, :edit, :update, :publish, :destroy]
  load_and_authorize_resource

  def index
    @articles = Article.published.latest.includes(:user).paginate(:page => params[:page], :per_page => 10)
  end


  [:show, :new, :edit].each do |method|
    define_method method do; end
  end


  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id
      if @article.save
        redirect_to @article, notice: 'Article was successfully created.'
      else
       render action: "new"
      end
  end

  def update
    if @article.update_attributes(params[:article])
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "Article deleted"
  end

  def drafts
    @articles = Article.valid_draft_articles(current_user).includes(:user).paginate(:page => params[:page], :per_page => 10)
  end

  def publish
    @article.publish!
    redirect_to drafts_articles_path, notice: "Artcle was successfully published!!"
  end

  private

    def validate_record_exists
      @article = Article.find_by_id(params[:id])
      if @article.nil?
        flash[:error] = "Record doesn't exist"
        redirect_to root_path and return
      end
    end

end
