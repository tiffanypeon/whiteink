class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.integer :draft_id
      t.integer :draft_index

      t.timestamps
    end
  end
end
