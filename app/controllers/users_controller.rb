class UsersController < ApplicationController

  def index
    @users = @rest_client.get_users

    respond_to do |format|
      format.html
      format.csv
    end
  end

end
