require_relative 'questions_database.rb'
require_relative 'model.rb'
class Question < Model

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions WHERE id = #{id}")
    Question.new(data[0])
  end

  def initialize(options)
    @id = options["id"]
    @title = options["title"]
    @body = options["body"]
    @author_id = options["author_id"]
  end
end