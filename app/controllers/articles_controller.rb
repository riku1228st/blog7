class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all.order(created_at: :desc)
    @tags = Article.tag_counts_on(:tags).order('count DESC')
    # @tags = Article.tag_counts_on(:tags).order('count DESC')     # 全タグ(Postモデルからtagsカラムを降順で取得)
    if 
      @tag = params[:tag]   # タグ検索用
      @article = Article.tagged_with(params[:tag])   # タグに紐付く投稿
    end
  end

  def top
    @new_article = Article.all.order(created_at: :desc).limit(4)
    @minecraft = Article.tagged_with('minecraft').limit(4)
    @aviutl = Article.tagged_with('aviutl').limit(4)
    @web = Article.tagged_with('web').limit(4)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @articles = Article.find(params[:id])
    @tags = @articles.tag_counts_on(:tags)
  end

  def first
  end

  def news
  end

  def info
  end

  def calender
  end

  def map
  end

  def search
    @articles = Article.all.order(created_at: :desc)
    @tags = Article.tag_counts_on(:tags).order('count DESC')
    # @tags = Article.tag_counts_on(:tags).order('count DESC')     # 全タグ(Postモデルからtagsカラムを降順で取得)
    if 
      @tag = params[:tag]   # タグ検索用
      @article = Article.tagged_with(params[:tag])   # タグに紐付く投稿
    end
  end

  # GET /articles/new
  def new
    @article = Article.new
    @tags = Article.tag_counts_on(:tags)
  end

  # GET /articles/1/edit
  def edit
    @tags = Article.tag_counts_on(:tags)
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def attach
    attachment = Attachment.create! image: params[:image]
    render json: { filename: url_for(attachment.image) }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:image, :title, :subtitle, :content, :tag_list)
    end
end