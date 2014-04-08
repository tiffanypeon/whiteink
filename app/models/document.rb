class Document < ActiveRecord::Base
  belongs_to :user
  has_many :drafts

  def self.published_drafts
    where(published: true).includes(:drafts).map do |document|
      document.drafts.last
    end
  end





end
