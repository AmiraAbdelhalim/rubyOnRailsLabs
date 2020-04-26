class ArticlesController < ApplicationController
    # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
        
    def new
        @article= Article.new
    end

    def index
        @articles=Article.all #if not called articles.errors.any? would throu an error
    end

    def create
        @article = Article.new(article_params)
        
        if @article.save #save in db
            redirect_to @article #redirect to show action
        else
            render 'new' #render new,html
        end
    end

    def show
        @article=Article.find(params[:id])
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
       
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end


    def destroy
        @article = Article.find(params[:id])
        @article.destroy
    
        redirect_to articles_path
    end

    private #to make sure its not called outside context
    def article_params #as this method is used in create and update
        params.require(:article).permit(:title, :text)
    end


end
