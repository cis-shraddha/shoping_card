class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :id
      t.string :name
      t.references :imageable, :polymorphic => true
      t.integer :imageable_id
      t.string :imageable_type

      t.timestamps
    end
  end
end
