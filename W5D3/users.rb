require_relative 'questions_database.rb'
require_relative 'question.rb'
require_relative 'model.rb'
require_relative 'question_follow.rb'
require_relative 'question_likes.rb'
require_relative 'replies.rb'


class Users < Model

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM users WHERE id = #{id}")
    Users.new(data[0])
  end
  
  def self.find_by_name(fname,lname)
    data = QuestionsDatabase.instance.execute("SELECT * FROM users WHERE fname = #{fname} AND  lname = #{lname}")
    Users.new(data[0])
  end
  
  
  def initialize(options)
    @id = options["id"]
    @fname = options["fname"]
    @lname = options["lname"] 
  end

end