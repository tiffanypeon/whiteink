class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :image_url
      t.string :provider
      t.integer :uid

      t.timestamps
    end
  end
end
