require 'sinatra/base'
require_relative './../lib/daily_diary'

class DailyDiary < Sinatra::Base
  
  get '/' do
    erb :index
  end

  get '/todolist' do
    @diary_entries = DailyDiaryList.new.get_entries
    erb :'diarylist/todolist'
  end

  get '/todolist/new' do
    erb :'diarylist/form'
  end

  post '/todolist' do
    DailyDiaryList.new.add_entry(params[:date], params[:action], params[:item_or_message])
    redirect '/todolist'
  end
  
  run! if app_file == $PROGRAM_NAME
end