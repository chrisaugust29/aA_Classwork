require_relative 'questions_database.rb'
require_relative 'model.rb'
require_relative 'question.rb'
require_relative 'users.rb'

class QuestionFollow < Model

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows WHERE id = #{id}")
    QuestionFollow.new(data[0])
  end

  def initialize(options)
    @id = options["id"]
    @user_id = options["user_id"]
    @question_id = options["question_id"] 
  end

end