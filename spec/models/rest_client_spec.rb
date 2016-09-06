require 'spec_helper'

RSpec.describe RestClient, :type => :class do

  it "makes calls to get_posts" do
    restclient = RestClient.new
    posts = restclient.get_posts

    expect(posts.count).to be > 1
  end

  it "makes calls to get users" do
    restclient = RestClient.new
    users = restclient.get_users

    expect(users.count).to be > 1
  end

  it "makes calls and joins posts and users" do
    restclient = RestClient.new
    combined_posts = restclient.get_posts_users

    expect(combined_posts.count).to be > 1

    combined_posts.each do |post|
      expect(post.user).should_not be nil
    end
  end

end