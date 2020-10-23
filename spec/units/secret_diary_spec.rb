require_relative './../../lib/daily_diary' 

describe DailyDiaryList do

  it 'Diary is locked' do
  expect(subject).to respond_to('lock')
  end

  it 'Diary is unlocked' do
  expect(subject).to respond_to('unlock')
  end

  it 'responds to the method add_entry' do
  expect(subject.add_entry('20201201', 'buy', 'milk' )).to eq "Diary is locked"
  end

 end