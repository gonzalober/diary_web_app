require 'pg'

class DailyDiaryList
  attr_reader :diary_unlock

  def initialize
      @diary = []
      @diary_unlock = false
  end

  def lock
      @diary_unlock = false
      print "Diary is Locked"
  end

  def unlock
    @diary_unlock = true
    print "Diary is unlocked please add an entry or get an entry"
  end

  def add_entry(date, action, item)
      @connection = PG.connect(dbname: 'daily_dairy')
      @connection.exec "INSERT INTO dialy_dairy (date, action, item_or_message) VALUES ('#{date}', '#{action}', '#{item}');"
  end

  def get_entries
      @connection = PG.connect(dbname: 'daily_dairy')
      result = @connection.exec ("SELECT * FROM dialy_dairy ORDER BY date ASC")
      result.map {|list| list}
  end

end