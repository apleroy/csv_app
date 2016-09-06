class PostsController < ApplicationController

  def index
    @posts = @rest_client.get_posts

    respond_to do |format|
       format.html
       format.csv
    end
  end

end
