require 'sinatra/base'
require_relative './lib/list.rb'
require_relative './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
    "Hello World!"
  end

  get '/bookmarks' do
    erb(:bookmarks)
  end

  run! if app_file == $0
end
