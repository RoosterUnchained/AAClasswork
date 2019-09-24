require 'sqlite3'
require 'singleton'


class QuestionsDatabase < SQLite3::Database
  include Singleton 

  def initialize 
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end

end



class Users

    attr_accessor :id, :fname, :lname 

    def self.find_by_id(id)
        user = QuestionsDatabase.instance.execute(<<-SQL, id)
          SELECT 
            *
          FROM 
            users
          WHERE 
            id = ?
        SQL
        Users.new(user.first)
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end
end



class Questions
attr_accessor :id, :title, :body, :author_id

    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id)
          SELECT 
            *
          FROM 
            questions
          WHERE 
            id = ?
        SQL
        Questions.new(question.first)
    end

    def initialize(options)
        @id = options['id']
        @author_id = options['author_id']
        @title = options['title']
        @body = options['body']
    end
end



class Question_follows
    attr_accessor :id, :user_id, :question_id

    def self.find_by_id(id)
        question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
          SELECT 
            *
          FROM 
            questions
          WHERE 
            id = ?
        SQL
        Questions.new(question_follow.first)
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['author_id']
        @question_id = options['question_id']
    end

end

class Replies
  attr_accessor :id, :question_id, :author_id

  def self.find_by_id(id)
    question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM 
        questions
      WHERE 
        id = ?
    SQL
    Questions.new(question.first)
  end
end



class Question_likes

end



