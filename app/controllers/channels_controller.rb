class ChannelsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user,       only: [:index, :show, :edit, :create, :destroy, :subscribing]
  before_action :correct_channel,    only: [:show, :edit, :destroy, :subscribing]

  def index
    @user = User.find(params[:user_id])
    @channel = @user.channels.build
    @channels = @user.channels.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:user_id])
    @channel = Channel.find(params[:id])
    @title = "#{@channel.channel_name}"
    @feed_items = @channel.feed.paginate(page: params[:page])
  end

  def new
    @user = User.find(params[:user_id])
    @channel = current_user.channels.new
  end

  def create
    @user = User.find(params[:user_id])
    @channel = @user.channels.build(channel_params)
    if @channel.save
      redirect_to user_channels_path
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @channel = Channel.find(params[:id])
    @follows = @user.following
  end

  def update
    @channel = Channel.find(params[:id])
    if @channel.update_attributes(channel_params)
      flash[:success] = "Channel updated"
      redirect_to user_channels_path
    else
      render 'edit'
    end
  end

  def destroy
    @channel.destroy
    #flash[:success] = "Channel deleted"
    redirect_to user_channels_path
  end

  def subscribing
    @channel = Channel.find(params[:id])
    @title = "#{@channel.channel_name} subscriptions"
    @subscriptions = @channel.subscribing.paginate(page: params[:page], :per_page => 100)
    render 'show_subscription'
  end

  protected

    def channel_params
      params.require(:channel).permit(:channel_name)
    end

    def correct_user
      @user = User.find(params[:user_id])
      redirect_to root_path unless @user == current_user
    end
    def correct_channel
      @channel = current_user.channels.find_by(id: params[:id])
      redirect_to user_channels_path if @channel.nil?
    end

end
