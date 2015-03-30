class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:following, :followers, :subscribe, :dashboard]
  before_action :correct_user,       only: [:following, :followers]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user  = User.find(params[:id])
    @post  = current_user.posts.build if user_signed_in?
    @posts = @user.posts.paginate(page: params[:page])
  end

  def dashboard
    @user     = current_user
    @post     = current_user.posts.build if user_signed_in?
    @channel  = @user.channels.build
    @channels = @user.channels.paginate(page: params[:page])
  end

  def subscribe
    @user  = User.find(params[:id])
    if current_user == @user
      redirect_to root_path
    else
      @title = "Subscribe"
      @channels = current_user.channels
    end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  protected

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless @user == current_user
    end
end
