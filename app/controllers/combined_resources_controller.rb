class CombinedResourcesController < ApplicationController

  def index
    @combined_posts = @rest_client.get_posts_users

    respond_to do |format|
      format.html
      format.csv
    end
  end

end
