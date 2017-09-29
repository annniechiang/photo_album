class CreatePhoto2s < ActiveRecord::Migration[5.1]
  def change
    create_table :photo2s do |t|
      t.string :title
      t.date :date
      t.text :description
      t.string :file_location
      t.timestamps
    end
  end
end
