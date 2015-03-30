class Channel < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :channel_name, presence: true, length: { maximum: 20 }
  validates_uniqueness_of :channel_name, scope: :user_id
  has_many :active_subscriptions, class_name:  "Subscription",
                                  foreign_key: "subscriber_id",
                                  dependent:   :destroy
  has_many :subscribing, through: :active_subscriptions, source: :subscribed

  # Subscribe to a user.
  def subscribe(subscribed_user)
    active_subscriptions.create(subscribed_id: subscribed_user.id)
  end
  # Unfollows a user.
  def unsubscribe(subscribed_user)
    active_subscriptions.find_by(subscribed_id: subscribed_user.id).destroy
  end
  # Returns true if the channel is subscribing to the user
  def subscribing?(subscribed_user)
    subscribing.include?(subscribed_user)
  end

  # Return channel feed
  def feed
    Post.from_users_subscribed_by(self)
  end
end
