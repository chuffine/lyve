class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:subscribed_id])
    current_channel = Channel.find(params[:subscriber_id])
    current_channel.subscribe(@user)
    redirect_to :back
    # respond_to do |format|
    #   format.html { redirect_to :back }
    #   format.js
    # end
  end
  def destroy
    @user = Subscription.find(params[:id]).subscribed
    current_channel = Channel.find(params[:subscriber_id])
    current_channel.unsubscribe(@user)
    redirect_to :back
    # respond_to do |format|
    #   format.html { redirect_to :back }
    #   format.js
    # end
  end
end
