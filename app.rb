require 'sinatra/base'
require_relative './lib/list.rb'
require 'pg'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    "Hello World!"
  end

  get '/bookmarks' do
    @new_list = List.see_list
    erb(:bookmarks)
  end

  post '/update_bookmark' do
    session[:update_id] = params[:update_id].to_i
    redirect to('/update_bookmark')
  end

  get '/update_bookmark' do
    erb(:update_bookmark)
  end

  patch '/update_bookmark' do
    List.update_bookmark(params[:url], params[:title], session[:update_id])
    redirect to('/bookmarks')
  end

  post '/create_bookmark' do
    List.create_bookmark(params[:url], params[:title])
    redirect to('/bookmarks')
  end

  delete '/delete_bookmark' do
    p params
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
