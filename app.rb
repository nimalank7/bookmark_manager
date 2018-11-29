require 'sinatra/base'
require_relative './lib/list.rb'
require_relative './lib/Comment.rb'
require_relative './lib/user.rb'
require_relative './database_connection_setup.rb'
require 'pg'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb(:log_in_page)
  end

  get '/register' do
    erb(:register)
  end

  post '/register' do
    session[:user] = User.create(params[:email], params[:password])
    redirect to('/bookmarks')
    # redirect to ('/register') if email already exists.
  end

  get '/bookmarks' do
    @user = session[:user]
    @new_list = List.see_list
    erb(:bookmarks)
  end

  post '/store_bookmark_id' do
    session[:bookmark_id] = params[:bookmark_id].to_i
    redirect to('/create_comment')
  end

  get '/bookmarks/:id/create_comment' do
    @bookmark_id = params[:id]
    erb(:create_comment)
  end

  post '/bookmarks/:id/create_comment' do
    Comment.create_comment(params[:body], params[:id])
    redirect to('/bookmarks')
  end

  get '/bookmarks/:id/update' do
    @bookmark_id = params[:id]
    erb(:update_bookmark)
  end

  patch '/bookmarks/:id' do
    List.update_bookmark(params[:url], params[:title], params[:id])
    redirect to('/bookmarks')
  end

  post '/create_bookmark' do
    List.create_bookmark(params[:url], params[:title])
    redirect to('/bookmarks')
  end

  delete '/delete_bookmark' do
    List.delete_bookmark(params[:delete_url])
    redirect to('/bookmarks')
  end

  post '/search_results' do
    @results = List.find_bookmark(params[:search])
    if @results.length == 0
      redirect to('not_found')
    end
    redirect to('/search_results')
  end

  get '/not_found' do
    erb(:not_found)
  end

  get '/search_results' do
    @results = List.search_results
    erb(:search_results)
  end

  run! if app_file == $0
end
