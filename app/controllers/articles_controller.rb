class ArticlesController < ApplicationController
  #Before filter to implement authorization.
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource

  def index
    @articles = Article.published.paginate(:page => params[:page], :per_page => 10)
  end


  def show

  end

  def new

  end

  def edit

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
    redirect_to articles_url
  end

  def drafts
    @articles = Article.valid_draft_articles(current_user).paginate(:page => params[:page], :per_page => 10)
  end

  def publish
    @article.publish!
    redirect_to drafts_articles_path
  end

end
