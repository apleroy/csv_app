class RestClient
  include HTTParty

  def get_posts
    @posts = []
    url = 'http://jsonplaceholder.typicode.com/posts'
    response = HTTParty.get(url)
    response.parsed_response.each do |parsed_response|
      @posts << Post.new(parsed_response)
    end

    return @posts
  end

  def get_users
    @users = []
    url = 'http://jsonplaceholder.typicode.com/users'
    response = HTTParty.get(url)
    response.parsed_response.each do |parsed_response|
      @users << User.new(parsed_response)
    end

    return @users
  end

  def get_posts_users
    # posts = get_posts
    # users = get_users
    # @merged = []
    #
    # posts.each do |post|
    #   user = users.find {|u| u['id'] == post['userId']}
    #   @merged << post.merge(user)
    # end
    #
    # return merged

    @users = get_users
    @posts = get_posts

    @posts.each do |post|
      post.user = @users.detect { |u| u.id == post.userId}
    end

  end

end