class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  validates :uid, uniqueness: true
  validates :username, presence: true
  validates :provider, presence: true
  # validates :email, presence: true
  # validates :email, format: { with: /.+@.+\..+/ }
  # validates :avatar_url, presence: true
  #
  # devise :omniauthable, :omniauth_providers => [:github]


  # def self.find_or_create_from_omniauth(auth)
  #   provider = auth.provider
  #   uid = auth.uid
  #
  #   find_or_create_by(provider: provider, uid: uid) do |user|
  #
  #     user.provider = provider
  #     user.uid = uid
  #     user.email = auth.info.email
  #     user.username = auth.info.name
  #     user.save!
  #     # user.avatar_url = auth.info.image
  #   end
  # end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.name
      user.save!
    end
  end
end
