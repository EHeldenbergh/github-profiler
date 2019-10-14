class SearchController < ApplicationController

  require 'pp'
  require 'json'
  require 'net/http'
  require 'uri'

  def search
  end

  def results

    username = params["username"]
    is_username_valid(username)
    @user_info = get_user_info(username)

    if @user_info["message"] == "Not Found"
      error_handling("user_not_found")
    end

    repositories = get_user_repositories(@user_info["repos_url"])
    repositories = repositories.sort_by{|repo| repo["watchers_count"]}.reverse
    @users_repositories = repositories
    @repositories_names = get_repositories_names(repositories)

  end

  private

  def error_handling(error)
    if error == "invalid_username"
      flash[:info] = "This username is invalid."
    elsif error == "user_not_found"
      flash[:info] = "This username was not found on GitHub."
    end
    redirect_to 'home'
  end

  def is_username_valid(username)
    if username == "" or username.match(/\A[a-zA-Z0-9]*\z/).nil?
      error_handling("invalid_username")
    end
  end

  def get_response_from_url(url)
    uri = URI(url)
    response = Net::HTTP.get(uri)

    return JSON.parse(response)
  end

  def get_user_info(username)
    user_url = "https://api.github.com/users/" << username
    puts "user info"
    response = get_response_from_url(user_url)
    pp(response)

    return response
  end

  def get_user_repositories(url)
    repositories = get_response_from_url(url)

    return repositories
  end

  def get_repositories_names(repositories)
    names = []
    repositories.each do |repo|
      names.push(repo["name"])
    end

    return names
  end

end
