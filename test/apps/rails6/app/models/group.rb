class Group < ApplicationRecord
  def uuid_in_sql
    ActiveRecord::Base.connection.exec_query("select * where x = #{User.uuid}")
  end

  def use_simple_method
    self.where("thing = #{Group.simple_method}")
  end

  def self.simple_method
    "Hello"
  end
end
