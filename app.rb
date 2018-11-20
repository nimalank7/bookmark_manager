require 'sinatra/base'
require_relative './lib/list.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
    "Hello World!"
  end

  get '/bookmarks' do
    @new_list = List.see_list
    erb(:bookmarks)
  end

  run! if app_file == $0
end
