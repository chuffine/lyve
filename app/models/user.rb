class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable
  default_scope -> { order('created_at DESC') }
  has_many :posts#, dependent: :destroy
  has_many :active_relationships,  class_name:  "Relationship",
           foreign_key:  "follower_id",
           dependent:  :destroy
  has_many :passive_relationships, class_name:  "Relationship",
           foreign_key:  "followed_id",
           dependent:  :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # channels
  has_many :channels

  validates :full_name, presence: true, length: { maximum: 50 }
  # Set a regex validation for username
  validates :username, presence: true, length: { maximum: 20 }, uniqueness: true

  # subscriptions
  has_many :passive_subscriptions, class_name:  "Subscription",
                                   foreign_key: "subscribed_id",
                                   dependent:   :destroy
  has_many :subscribers, through: :passive_subscriptions, source: :subscriber

  # Avatar
  has_attached_file :avatar,
                    styles: { :medium => "300x300>", :profile => "100x100", :thumb => "80x80>", :mini => "50x50>", },
                    default_url: 'missing.png'
  validates_attachment_content_type :avatar, :content_type => /^image\/(png|gif|jpeg|jpg)/

  before_save :default_channels

  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  protected
    def confirmation_required?
      false
    end

  private
    def default_channels
      if self.new_record?
          @default_channels = default_channel_list
          @default_channels.each do |chan|
            self.channels.new(channel_name: chan)
          end
      end
    end
    def default_channel_list
      ["News", "Social", "Entertainment", "Technology", "Music"]
    end
  # def to_param
  #   username
  # end
end
