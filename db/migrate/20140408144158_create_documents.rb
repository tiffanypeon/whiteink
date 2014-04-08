class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.text :name
      t.integer :user_id
      t.boolean :published

      t.timestamps
    end
  end
end
