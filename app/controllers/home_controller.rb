class HomeController < ApplicationController
  def top
    if 
      @news = Article.tagged_with('news').limit(3)  # タグに紐付く投稿
      @la_news = Article.tagged_with('la_news').limit(3)  # タグに紐付く投稿
      # @lainfo = MineStat.new("192.168.0.8")
    end
  end

  def first
  end

  def news
    @news = Article.tagged_with('news')
  end

  def info
  end

  def calender
  end

  def map
  end

  def search
  end
end
