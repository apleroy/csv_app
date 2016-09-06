class Post

  attr_reader :id, :userId, :title, :body
  attr_accessor :user

  def initialize(attributes = {})
    @id = attributes['id']
    @userId = attributes['userId']
    @title = attributes['title']
    @body = attributes['body']
    @user = nil
  end

  def body_clean
    self.body.gsub(/\n/, " ")
  end

end
