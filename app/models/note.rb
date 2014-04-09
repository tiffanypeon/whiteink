class Note < ActiveRecord::Base
  belongs_to :draft
  before_save :set_draft_index

  private
    def set_draft_index
      draft_index_num = Draft.find(self.draft_id).content.size
      self.draft_index = draft_index_num
    end
end
