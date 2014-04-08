class User < ActiveRecord::Base
  has_many :documents
  validates_uniqueness_of :email

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      # user.name = auth["name"]
      user.name = auth["info"]["name"]
      user.email ||= auth[:info][:email] if auth[:info][:email]
    end
  end

end
