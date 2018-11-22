require 'sinatra/base'
require_relative './lib/list.rb'
require 'pg'

class BookmarkManager < Sinatra::Base

  get '/' do
    "Hello World!"
  end

  get '/bookmarks' do
    @new_list = List.see_list
    erb(:bookmarks)
  end

  post '/create_bookmark' do
    List.create_bookmark(params[:url])
    redirect to('/bookmarks')
  end

  run! if app_file == $0
end
