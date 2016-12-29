
class FtQueryController < ApplicationController
  def index() end

  def create_db
    $db = SQLite3::Database.new('ft_sql')
    redirect_to root_path
  rescue SQLite3::SQLException => e
    e.message
  end

  def create_table
    $db.execute("CREATE TABLE IF NOT EXISTS clock_watch (ts_id int,\
      day int,
      year int,\
      hour int,\
      min int,\
      sec int,\
      race int,\
      name text(50),\
      lap int\
      );")
    $db.execute('CREATE TABLE IF NOT EXISTS race (r_id int, start text(50));')
    redirect_to root_path
  rescue SQLite3::SQLException => e
    e.message
  end

# $name_1 ,$name_2 ,$name_3 ,$name_4
  def start_race
  byebug
  Time.now.day
  Time.now.year
  Time.now.hour
  Time.now.min
  Time.now.sec
  params[:name_1]
    # $db.execute("INSERT INTO clock_watch (day, year, hour, min, sec, race, name, lap)
    #   VALUES (value1,value2,value3,...);")

  end

  def insert_time_stamp() end

  def drop_table() end

  def delete_last() end

  def destroy_all() end

  def all_by_name() end

  def all_by_race() end

  def update_time_stamp() end
end
