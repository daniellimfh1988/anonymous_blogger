require 'byebug'

class Post < ActiveRecord::Base
  def self.authenticate(email, password) #3
    @user = User.find_by_email(email)
    return false if @user.nil?
    if @user.password == password
      return @user
    else
      return false
    end
  end
end

#Note : below no longer in use as estelle recommended an alternative
helpers do
  # This will return the current user, if they exist
  # Replace with code that works with your application
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  # Returns true if current_user exists, false otherwise
  def logged_in?
    !current_user.nil?
  end
end
