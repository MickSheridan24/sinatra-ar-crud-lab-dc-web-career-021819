
require_relative "../../config/environment"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
  end

  get "/" do
    redirect "/articles"
  end

  get "/articles" do
    @articles = Article.all
    erb :index
  end

  get "/articles/new" do
    erb :new
  end

  get "/articles/:id" do
    @article = Article.all.find(params[:id])
    erb :show
  end

  get "/articles/:id/edit" do
    @article = Article.all.find(params[:id])
    erb :edit
  end

  patch "/articles/:id" do
    @article = Article.all.find_by_id(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    redirect "/articles/#{params[:id]}"
  end

  post "/articles" do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}"
  end

  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect "/articles"
  end
end
