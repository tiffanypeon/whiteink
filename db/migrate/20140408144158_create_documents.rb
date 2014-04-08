class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.text :text
      t.integer :user_id

      t.timestamps
    end
  end
end
