class User < ActiveRecord::Base
  has_many :documents
  validates_uniqueness_of :name #email - write method to accept nil for twitter oauth

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      # user.name = auth["name"]
      user.name = auth["info"]["name"]
      user.email ||= auth[:info][:email] if auth[:info][:email]
    end
  end

  def active_drafts
    last_draft = self.documents.last.drafts.last
    last_two_drafts = self.documents.last.drafts[-2..-1]
    last_two_drafts ? last_two_drafts : last_draft
  end

end
