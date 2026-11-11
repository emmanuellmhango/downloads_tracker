class CreateDownloads < ActiveRecord::Migration[8.1]
  def change
    create_table :downloads do |t|
      t.integer :download

      t.timestamps
    end
  end
end
