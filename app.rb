require 'sinatra/base'
require_relative './lib/list.rb'
require_relative './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
    "Hello World!"
  end

  get '/bookmarks' do
    @new_list = List.create_instance
    bookmark_1 = Bookmark.new("http://www.google.com/")
    bookmark_2 = Bookmark.new("http://www.microsoft.com/")
    @new_list.contents << bookmark_1
    @new_list.contents << bookmark_2
    @new_list = List.read_instance.see_list
    erb(:bookmarks)
  end

  run! if app_file == $0
end
