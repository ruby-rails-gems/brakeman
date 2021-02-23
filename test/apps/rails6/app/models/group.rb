class Group < ApplicationRecord
  enum status: { start: 0, stop: 2, in_process: 3 }

  def uuid_in_sql
    ActiveRecord::Base.connection.exec_query("select * where x = #{User.uuid}")
  end

  def use_simple_method
    self.where("thing = #{Group.simple_method}")
  end

  def self.simple_method
    "Hello"
  end

  def use_enum
    self.where("thing IN #{Group.statuses.values_at(*[:start, :stop]).join(',')}")
  end
end
