require 'sinatra/base'
require_relative './../lib/daily_diary'

class DailyDiary < Sinatra::Base
  
  get '/' do
    erb :index
  end

  get '/todolist' do
    # if @diary_unlock == true
    @diary_entries = DailyDiaryList.new.get_entries
    # else
    #   print "Diary is locked"
    # end
    erb :'diarylist/todolist'
  end

  post '/todolist' do

    redirect '/todolist'
  end
  
  run! if app_file == $PROGRAM_NAME
end