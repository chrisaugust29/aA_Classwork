require_relative 'questions_database.rb'
require_relative 'model.rb'
require_relative 'question.rb'
require_relative 'users.rb'

class Replies < Model

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE id = #{id}")
    Replies.new(data[0])
  end

   def self.find_by_author_id(user_id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE author_id = #{user_id}")
    Replies.new(data[0])
  end

    def self.find_by_parent_id(parent_id)
   data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE parent_id = #{parent_id}")
    Replies.new(data[0])
  end

    def self.find_by_question_id(question_id)
   data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE question_id = #{question_id}")
    Replies.new(data[0])
  end




  def initialize(options)
    @id = options["id"]
    @body = options["body"]
    @author_id = options["author_id"]
    @parent_id = options["parent_id"] 
    @question_id = options["question_id"] 
  end

end