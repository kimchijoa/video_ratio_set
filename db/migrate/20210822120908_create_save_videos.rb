class CreateSaveVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :save_videos do |t|
      t.string :file_name

      t.timestamps
    end
  end
end
