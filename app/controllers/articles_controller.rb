class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end

    def new
    end

    def index
        @articles = Article.all
    end

    def create
        @article = Article.create(article_params)
        redirect_to article_path
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
