class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :load_rest_client


  # https://blog.pivotal.io/labs/labs/object-oriented-rails-writing-better-controllers

  # set one instance of the RestClient in the program for use across all controllers
  def load_rest_client(rest_client = RestClient.new)
    @rest_client ||= rest_client
  end
end
