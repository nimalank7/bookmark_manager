require 'sinatra/base'
require_relative './lib/list.rb'
require_relative './lib/Comment.rb'
require_relative './lib/user.rb'
require_relative './lib/bookmark_tag_model.rb'
require_relative './database_connection_setup.rb'
require 'pg'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    @sign_in = session[:sign_in_message]
    erb(:log_in_page)
  end

  post '/sign_in' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user] = user
      redirect to('/bookmarks')
    end
    session[:sign_in_message] = "Please enter the correct email or password"
    redirect to('/')
  end

  get '/register' do
    @user_taken = session[:register_message]
    erb(:register)
  end

  post '/register' do
    if User.already_exists?(params[:email])
      session[:register_message] = "Sorry, but that email address is already taken"
      redirect to('/register')
    end
    session[:user] = User.create(params[:email], params[:password])
    session[:register_message] = "You are already logged in. Do you want to create another user?"
    redirect to('/bookmarks')
  end

  get '/bookmarks' do
    @user = session[:user]
    @new_list = List.see_list
    erb(:bookmarks)
  end

  get '/tags/:id' do
    @tag_id = Tag.find(params[:id])
    @bookmarks = @tag_id.all_bookmarks
    erb(:bookmarks_for_tag)
  end

  get '/bookmarks/:id/create_tag' do
    @bookmark_id = params[:id]
    erb(:create_tag)
  end

  post'/bookmarks/:id/create_tag' do
    tag_id = Tag.create(params[:content]).id
    BookmarkTag.create(params[:id], tag_id)
    redirect to('/bookmarks')
  end

  post '/bookmarks/:id/create_comment' do
    Comment.create_comment(params[:body], params[:id])
    redirect to('/bookmarks')
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

  get '/sign_out' do
    session.clear
    redirect to('/')
  end

  run! if app_file == $0
end
