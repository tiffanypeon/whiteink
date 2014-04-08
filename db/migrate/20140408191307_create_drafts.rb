class CreateDrafts < ActiveRecord::Migration
  def change
    create_table :drafts do |t|
      t.text :content
      t.integer :document_id

      t.timestamps
    end
  end
end
