class Post < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 365 }

  # Return microposts for users subscribed by a channel
  def Post.from_users_subscribed_by(channel)
    subscribing_ids = "SELECT subscribed_id FROM subscriptions
                       WHERE  subscriber_id = :channel_id"
    where("user_id IN (#{subscribing_ids})", channel_id: channel)
  end
end
